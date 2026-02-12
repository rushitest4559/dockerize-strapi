
![dockerhub](./imgs/dockerhub.PNG)
![strapi_instance](./imgs/strapi_instance1.PNG)
![strapi_running](./imgs/strapi_running.PNG)
![terraform_outputs](./imgs/terraform_outputs.PNG)
![user_data_logs](./imgs/user_data_logs.PNG)
![strapi_instance_aws](./imgs/strapi_instance_aws.PNG)
![nginx](./imgs/nginx.PNG)

![user data](./strapi-infra/terraform/user_data.sh)

# Steps

```bash
cd infra/terraform
terraform apply --auto-approve
```

## Copy paste this command & boom! 3 containers start in your instance which is in private subnet. Enter the website_url in browser.