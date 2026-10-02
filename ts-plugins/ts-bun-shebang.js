// tsserver-Plugin: Lose Bun-Skripte (Hashbang mit `bun`, kein tsconfig/package.json drumherum)
// landen in einem Inferred Project ohne Typen — node:*-Imports und `Bun.*` sind dort unbekannt.
// Für genau diese Projekte hängt das Plugin @types/bun an die Compiler-Optionen.
//
// Wird von lua/config/lsp.lua nach stdpath("data")/ts-plugins/node_modules/ts-bun-shebang/
// kopiert; @types/bun liegt dort im benachbarten node_modules/@types.
const fs = require("node:fs");
const path = require("node:path");

const BUN_SHEBANG = /^#!.*\bbun\b/;
const TYPE_ROOT = path.resolve(__dirname, "..", "@types");

function isBunScript(scriptInfo) {
  const snapshot = scriptInfo.getSnapshot();
  return BUN_SHEBANG.test(snapshot.getText(0, Math.min(snapshot.getLength(), 128)));
}

module.exports = ({ typescript: ts }) => ({
  create(info) {
    const project = info.project;
    if (project.projectKind !== ts.server.ProjectKind.Inferred) return info.languageService;
    if (!fs.existsSync(path.join(TYPE_ROOT, "bun"))) return info.languageService;

    const getCompilationSettings = project.getCompilationSettings.bind(project);
    project.getCompilationSettings = () => {
      const options = getCompilationSettings();
      try {
        if (!project.getRootScriptInfos().some(isBunScript)) return options;
      } catch {
        return options;
      }
      return { ...options, typeRoots: [TYPE_ROOT], types: ["bun"] };
    };

    return info.languageService;
  },
});
