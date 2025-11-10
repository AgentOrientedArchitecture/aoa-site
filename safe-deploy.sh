#!/usr/bin/env bash
set -e

# --- Safety checks ---
current_branch=$(git rev-parse --abbrev-ref HEAD)
if [ "$current_branch" = "main" ]; then
  echo "❌  Refusing to deploy from 'main' directly."
  echo "   The script will switch to a temporary branch for publishing."
else
  echo "✅  Running from branch: $current_branch"
fi

if [ ! -f package.json ]; then
  echo "❌  package.json not found. Run this script from the project root."
  exit 1
fi

# --- Build site ---
echo "🏗️  Building site..."
npm install
npm run build

# --- Delete local gh-pages branch if it exists ---
echo "🧹  Resetting local gh-pages branch..."
git branch -D gh-pages 2>/dev/null || true

# --- Create new orphan branch and copy build ---
echo "🌿  Creating fresh gh-pages branch..."
git checkout --orphan gh-pages
git rm -rf . >/dev/null 2>&1 || true
cp -r build/* .
touch .nojekyll

# --- Add minimal .gitignore ---
echo "node_modules/
.docusaurus/
build/
src/
docs/
blog/
.github/
package.json
package-lock.json
" > .gitignore

git add .
git commit -m "Publish static build to gh-pages"

# --- Push to remote ---
echo "🚀  Deploying to remote gh-pages..."
git push origin gh-pages --force

# --- Return to main ---
git checkout main
echo "✅  Deployment complete. Visit https://agentorientedarchitecture.dev"
