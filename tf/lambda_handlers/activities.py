import json
import decimal
import boto3

dynamodb = boto3.resource('dynamodb', region_name='eu-west-3')
table = dynamodb.Table('Form')


class DecimalEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            if o % 1 > 0:
                return float(o)
            else:
                return int(o)
        return super(DecimalEncoder, self).default(o)


def generate_response(status, body):
    return {
        "statusCode": status,
        "body": json.dumps(body, indent=4, cls=DecimalEncoder),
        "headers": {"Access-Control-Allow-Origin": "*", "Access-Control-Allow-Credentials": True}
    }


def get_activities(event, context):
    response = table.scan()
    data = response['Items']
    return generate_response(200, {'Activities': item})
