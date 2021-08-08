# terraform-jenkins

You can create jenkins with aws instance by terraform!

# Requirements (mac)

- STEP1 Install terraform, direnv

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install direnv
```

- STEP2 Make .envrc for aws account and

```
export AWS_ACCESS_KEY_ID=[AWS_ACCESS_KEY_ID]
export AWS_SECRET_ACCESS_KEY=[AWS_SECRET_ACCESS_KEY]
export TF_VAR_url=[Your Code Server Url]
export TF_VAR_user=[Your Code Server User]
export TF_VAR_password=[Your Code Server Password]
export TF_VAR_region=[Your AWS Region]
```

ex)

```envrc
export AWS_ACCESS_KEY_ID=AAAAAAAAAAAAAAAAAAAA
export AWS_SECRET_ACCESS_KEY=asdfghjklASDFGHJKLasdfghjklASDFGHJKLqwer
export TF_VAR_url=http://jenkins
export TF_VAR_user=admin
export TF_VAR_password=admin
export TF_VAR_region=ap-northeast-2
```

- STEP3 Execute Terraform

```
terraform apply
```

# License

- foxylion/jenkins
  - https://github.com/foxylion/docker-jenkins
  - Apache-2.0 License
