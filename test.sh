#!/bin/bash

# 指定されたディレクトリが存在しない場合にディレクトリを作成する関数
function create_directory_if_not_exists() {
  # 引数でディレクトリ名を受け取る
  local dir_name=$1

  # ディレクトリが存在しないかチェック
  if [ ! -d "$dir_name" ]; then
    echo "ディレクトリ '$dir_name' は存在しません。作成します..."
    mkdir -p "$dir_name"
    echo "ディレクトリ '$dir_name' を作成しました。"
  else
    echo "ディレクトリ '$dir_name' は既に存在します。"
  fi
}

# 関数を使って 'organizations' ディレクトリを作成する
create_directory_if_not_exists "organizations"

cp -r ../fabric-samples/test-network/organizations/peerOrganizations/ ./organizations
cp -r ../fabric-samples/test-network/organizations/ordererOrganizations/ ./organizations

export EXPLORER_CONFIG_FILE_PATH=./config.json
export EXPLORER_PROFILE_DIR_PATH=./connection-profile
export FABRIC_CRYPTO_PATH=./organizations

docker-compose up -d