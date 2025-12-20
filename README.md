# starter-terraform-azure

TerraformでAzureリソースを管理するスターターテンプレートです。

- [Terraformコードの内容](#Terraformコードの内容)
- [セットアップ手順](#セットアップ手順)
- [Terraformの実行](#Terraformの実行)

## Terraformコードの内容
<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.14.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.57.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.57.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | AzureサブスクリプションID | `string` | n/a | yes |

### Outputs

No outputs.
<!-- END_TF_DOCS -->

## セットアップ手順

### パッケージの更新と不要パッケージの削除

```bash
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
```

### tenvのインストール

Terraformのバージョンマネージャーとして、[tenv](https://github.com/tofuutils/tenv)をインストールします。

1. Cloudsmithリポジトリの登録

    ```bash
    curl -fsLS 'https://dl.cloudsmith.io/public/tofuutils/tenv/cfg/setup/bash.deb.sh' | sudo bash
    ```

2. tenvのインストール

    ```bash
    sudo apt install tenv
    ```

### Terraformのインストール

tenvを使用して、Terraformをインストールします。

1. 許可されている最新バージョンのTerraformをインストール

    ```bash
    tenv tf install latest-allowed
    ```

2. 許可されている最新バージョンのTerraformに切り替え

    ```bash
    tenv tf use latest-allowed
    ```

### TFLintのインストール

Terraformのリンターとして、[TFLint](https://github.com/terraform-linters/tflint)をインストールします。インストール中に必要になるunzipを先にインストールします。

1. unzipのインストール

    ```bash
    sudo apt install unzip
    ```

2. TFLintのインストール

    ```bash
    curl -fsLS 'https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh' | bash
    ```

3. TFLintの初期化

    ```bash
    tflint --init
    ```

### checkovのインストール

セキュリティー及びコンプライアンスチェッカーとして、[checkov](https://github.com/bridgecrewio/checkov)をインストールします。インストールに必要になるpipxを先にインストールします。

1. pipxのインストール

    ```bash
    sudo apt install pipx
    ```

2. pipxのパス設定と有効化

    ```bash
    pipx ensurepath && source ~/.bashrc
    ```

2. checkovのインストール

    ```bash
    pipx install checkov
    ```

### terraform-docsのインストール

ドキュメントの自動生成ツールとして、[terraform-docs](https://github.com/terraform-docs/terraform-docs)をインストールします。

1. terraform-docsのインストール

    ```bash
    curl -fsLS https://github.com/terraform-docs/terraform-docs/releases/download/v0.21.0/terraform-docs-v0.21.0-linux-amd64.tar.gz \
    | tar -xOzf - terraform-docs \
    | sudo tee /usr/local/bin/terraform-docs > /dev/null \
    && sudo chmod +x /usr/local/bin/terraform-docs
    ```

### pre-commitのインストール

コミット前にコードの整形や構文チェック等を自動で実行するためにpre-commitを設定します。実行内容は[.pre-commit-config.yaml](./.pre-commit-config.yaml)で設定しています。

1. pre-commitのインストール

    ```bash
    pipx install pre-commit
    ```

2. pre-commitの初期化

    ```bash
    pre-commit install
    ```

### Azure CLIのインストール

TerraformがAzureへの認証を行えるようにAzure CLIをインストールしログインしておきます。

1. Azure CLIのインストール

    ```bash
    curl -fsLS 'https://aka.ms/InstallAzureCLIDeb' | sudo bash
    ```

2. ログイン

    ```bash
    az login
    ```

## Terraformの実行

1. 整形し構文をチェック

    ```bash
    terraform fmt -recursive && terraform validate
    ```

2. 品質のチェック

    ```bash
    tflint --recursive
    ```

3. セキュリティー及びコンプライアンスのチェック

    ```bash
    checkov -d .
    ```

4. 変更予定内容の確認

    ```bash
    terraform plan
    ```

5. 変更の適用

    ```bash
    terraform apply
    ```

6. ドキュメントの生成

    ```bash
    terraform-docs markdown .
    ```
