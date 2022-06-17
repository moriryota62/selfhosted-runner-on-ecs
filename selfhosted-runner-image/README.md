GitHub Actions runnerイメージのサンプルです。ECS最適化AMIでコンテナ(ECSタスク)を実行する想定のイメージです。

コンテナ起動時の環境変数を設定してください。

- 環境変数`ORGANIZATION`にGitHubアカウントのアクセストークンを設定してください。
- Organizationのrunnerとする場合、環境変数`ORGANIZATION`を設定してください。
- 特定Repositoryのrunnerとする場合、環境変数`ORGANIZATION`を設定せず、環境変数`OWNER`と`REPO`
