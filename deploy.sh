#!/bin/bash

# エラーが発生したら即座に中断する
set -e

# 1. functionsフォルダに移動してビルド
echo "building code"
cd functions
npm run build
cd ..

# 2. デプロイの実行
echo "Firebase Upload (Timeout: 120s)"
# タイムアウトを60秒に延長し、不要な隠しファイルを無視してデプロイ
export FUNCTIONS_DEPLOY_TIMEOUT=120000
firebase deploy --only functions

echo "deploy done"