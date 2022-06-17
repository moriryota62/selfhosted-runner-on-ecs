GitHub ActionsのセルフホストrunnerをECSで動かすサンプルです。以下の構成イメージです。

![AWS](./aws.drawio.svg)

# ディレクトリ説明

## root

GitHub ActionsでビルドするサンプルのDockerイメージを配置しています。

## .github/workflows

GitHub ActionsでDockerイメージをbuildするサンプルのYAMLを配置しています。

## selfhosted-runner-image

GitHub Actions runnerイメージのサンプルです。ECS最適化AMIでコンテナ(ECSタスク)を実行する想定のイメージです。

## terraform

サンプル環境を構築するTerrafomコード群です。