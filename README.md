
![aws](./imgs/aws.PNG)
![aws1](./imgs/aws1.PNG)
![dockerhub](./imgs/dockerhub.PNG)
![ecr](./imgs/ecr.PNG)
![inside strapi](./imgs/inside_strapi.PNG)
![nginx](./imgs/nginx.PNG)
![strapi](./imgs/strapi.PNG)
![terraform](./imgs/terraform.PNG)
![logs](./imgs/user%20data%20logs.PNG)

[user data](./infra/terraform/user_data.sh)

# Steps

```bash
cd .\infra\terraform
terraform apply --auto-approve
```

## Copy paste this command & boom! 3 containers start in your instance which is in private subnet. Enter the website_url in browser.