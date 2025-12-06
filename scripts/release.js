const { execSync } = require("child_process");
const pkg = require("../package.json");
const version = pkg.version;

console.log(`Building and releasing v${version}...`);

// Build distribution
console.log("Building distribution...");
execSync("npm run build:dist", { stdio: "inherit" });

// Create GitHub release
console.log(`Creating GitHub release v${version}...`);
const releaseCommand = `gh release create v${version} dist/Gemini-darwin-x64.zip --title "v${version}" --notes "Release v${version}"`;
execSync(releaseCommand, { stdio: "inherit" });

console.log(`✅ Release v${version} created successfully!`);
