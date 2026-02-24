import boto3
from botocore.exceptions import ClientError

# Initialize clients for us-east-1
s3 = boto3.client('s3', region_name='us-east-1')
ecr = boto3.client('ecr', region_name='us-east-1')

# S3 Bucket
bucket_name = 'rushikesh-strapi-terraform-tfstate'
try:
    s3.head_bucket(Bucket=bucket_name)
    print(f"✅ Bucket '{bucket_name}' already exists")
except ClientError as e:
    if e.response['Error']['Code'] == '404':
        s3.create_bucket(Bucket=bucket_name, CreateBucketConfiguration={'LocationConstraint': 'us-east-1'})
        print(f"✅ Created bucket '{bucket_name}'")
    else:
        print(f"❌ Error checking bucket: {e}")

# ECR Repository
repo_name = 'rushikesh-strapi'
try:
    ecr.describe_repositories(repositoryNames=[repo_name])
    print(f"✅ ECR repo '{repo_name}' already exists")
except ClientError as e:
    if e.response['Error']['Code'] == 'RepositoryNotFoundException':
        ecr.create_repository(repositoryName=repo_name)
        print(f"✅ Created ECR repo '{repo_name}'")
    else:
        print(f"❌ Error checking ECR repo: {e}")
