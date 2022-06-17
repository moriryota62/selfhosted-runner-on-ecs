GitHub Actions セルフホストrunnerをECSで動かすAWS環境を構築するサンプルのTerraformコード群です。

以下の順番で実行してください。

1. network
2. ecs-cluster
3. ecr
4. ecs-task
5. ecs-service

VPCやECSクラスタがすでにある場合は実行しなくても構いません。各モジュールのterraform.tfvarsで指定するパラメータを修正してください。

# 各モジュール説明

## network

VPCやサブネットを作成します。サブネットはプライベートとパブリックを作成し、それぞれAZ冗長します。Internet Gateway、NAT Gatewayも作成します。

## ecs-cluster

ECSクラスタおよびAutoScalling GroupでEC2のコンテナインスタンスを作成します。EC2には`AmazonSSMManagedInstanceCore`のIAMポリシーを付与するため、セッションマネージャでインスタンスに接続できます。EC2のSecurity Groupはアウトバウンドのみ許可しており、インバウンド許可のルールは設定していません。

terraform.tfvarsで指定する`vpc_id`,`private_subnet_ids`は環境にあわせて修正してください。

## ecr

指定した名前のrepositoryを作成します。ライフサイクルルールを設定し、イメージは最新5世代が保管されます。それより古いイメージは自動で削除されます。

## ecs-task

GitHub Actions セルフホストrunner用のECSタスク定義を作成します。ECSタスク様にタスク実行用のIAMロールとタスクに付与するIAMロールを作成します。後者のロールにはECRへイメージプッシュするため`AmazonEC2ContainerRegistryFullAccess`のポリシーを付与しています。

terraform.tfvarsで指定する`github_account_token`は環境にあわせて修正してください。`target_organization`または`target_owner`、`target_repo`も環境にあわせて修正してください。
