#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Building tc-redirect-tap…"
docker build -t tc-redirect-tap-builder .

echo "📦 Extracting binary…"
cid=$(docker create tc-redirect-tap-builder)
docker cp "$cid:/tc-redirect-tap" ./tc-redirect-tap
docker rm "$cid"

echo "🧹 Cleaning up image…"
docker rmi tc-redirect-tap-builder >/dev/null

echo "🔧 Installing to /opt/cni/bin (you may be prompted for sudo)…"
sudo mkdir -p /opt/cni/bin
sudo mv ./tc-redirect-tap /opt/cni/bin/
sudo chmod +x /opt/cni/bin/tc-redirect-tap

echo "✅ Done! tc-redirect-tap is now available at /opt/cni/bin/tc-redirect-tap 🎉"
