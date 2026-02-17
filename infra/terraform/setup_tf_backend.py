import boto3
from botocore.exceptions import ClientError

# --- CONFIGURATION ---
REGION = "us-east-1"
BUCKET_NAME = "rushikesh-strapi-terraform-state"
TABLE_NAME = "terraform-state-lock"

s3 = boto3.client('s3', region_name=REGION)
dynamodb = boto3.client('dynamodb', region_name=REGION)

def create_s3_bucket():
    try:
        print(f"Creating S3 bucket: {BUCKET_NAME}...")
        if REGION == "us-east-1":
            s3.create_bucket(Bucket=BUCKET_NAME)
        else:
            s3.create_bucket(
                Bucket=BUCKET_NAME,
                CreateBucketConfiguration={'LocationConstraint': REGION}
            )
        # Enable Versioning (Crucial for State Files)
        s3.put_bucket_versioning(
            Bucket=BUCKET_NAME,
            VersioningConfiguration={'Status': 'Enabled'}
        )
        print("S3 bucket created and versioning enabled.")
    except ClientError as e:
        print(f"Error: {e}")

def create_dynamodb_table():
    try:
        print(f"Creating DynamoDB table: {TABLE_NAME}...")
        dynamodb.create_table(
            TableName=TABLE_NAME,
            KeySchema=[{'AttributeName': 'LockID', 'KeyType': 'HASH'}],
            AttributeDefinitions=[{'AttributeName': 'LockID', 'AttributeType': 'S'}],
            ProvisionedThroughput={'ReadCapacityUnits': 5, 'WriteCapacityUnits': 5}
        )
        print("DynamoDB table created.")
    except ClientError as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    create_s3_bucket()
    create_dynamodb_table()