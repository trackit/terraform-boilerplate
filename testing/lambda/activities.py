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
    escape_game = 0
    laser_game = 0
    kayak = 0
    karting = 0
    rulantica = 0
    data = response['Items']
    print(data)
    for item in data:
        if item['activity'] == 'EscapeGame':
            escape_game += 1
        if item['activity'] == 'LaserGame':
            laser_game += 1
        if item['activity'] == 'Karting':
            karting += 1
        if item['activity'] == 'Kayak':
            kayak += 1
        if item['rulantica'] == 'true':
            rulantica += 1
    return generate_response(200, {'EscapeGame': escape_game, 'LaserGame': laser_game, 'Karting': karting, 'Kayak': kayak,
                                   'Rulantica': rulantica})
