import json
import boto3
import uuid
import os
from datetime import datetime

dynamodb = boto3.resource('dynamodb')
sns = boto3.client('sns')

# Environment variables (BEST PRACTICE)
TABLE_NAME = os.environ['TABLE_NAME']
SNS_TOPIC_ARN = os.environ['SNS_TOPIC_ARN']

table = dynamodb.Table(TABLE_NAME)


def lambda_handler(event, context):
    try:
        # Parse request body
        body = json.loads(event.get('body', '{}'))

        # Validate required fields
        if not body.get('name') or not body.get('email') or not body.get('message'):
            return {
                "statusCode": 400,
                "headers": {"Access-Control-Allow-Origin": "*"},
                "body": json.dumps({"error": "Missing required fields"})
            }

        # Build item
        item = {
            "id": str(uuid.uuid4()),
            "name": body['name'],
            "email": body['email'],
            "phone": body.get('phone', "Not provided"),
            "message": body['message'],
            "timestamp": datetime.utcnow().isoformat()
        }

        # Save to DynamoDB
        table.put_item(Item=item)

        # Send SNS notification
        sns.publish(
            TopicArn=SNS_TOPIC_ARN,
            Subject="New Contact Message",
            Message=json.dumps(item, indent=2)
        )

        return {
            "statusCode": 200,
            "headers": {"Access-Control-Allow-Origin": "*"},
            "body": json.dumps({"message": "Message sent successfully"})
        }

    except Exception as e:
        print("ERROR:", str(e))  # CloudWatch logs

        return {
            "statusCode": 500,
            "headers": {"Access-Control-Allow-Origin": "*"},
            "body": json.dumps({"error": "Internal server error"})
        }