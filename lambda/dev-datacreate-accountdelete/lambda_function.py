import cognito_info.poolinfo
import json
import traceback
import sys
from datetime import datetime
import os
import boto3

cognito_client = boto3.client('cognito-idp')


def lambda_handler(event, context):
    body = json.loads( event['body'] ) # Stringをdictへ変換
    Username = body['Username']
    UserRole = body['Role']
    MyRefreshToken = body['RefreshToken']
    print("Received event: " + json.dumps(body))
    
    if MyRefreshToken == '':
        return {
            'statusCode': 401,
            'headers': {
                'Content-Type': 'application/json;charset=utf-8',
            },
            'isBase64Encoded': False
         }

    try:
        userLayer = cognito_info.poolinfo.CognitoLayer(UserRole)
        # ログインの確認
        tokens = userLayer.refresh_token(MyRefreshToken)
        if 'ERROR' in tokens:
        		return {
        				'statusCode': 503,
        				'headers': {
        						'Content-Type': 'application/json;charset=utf-8',
        				},
        				'body': json.dumps(tokens),
        				'isBase64Encoded': False
        		 }



        # Cognitoアカウント削除(＝無効化)
        deleteResponse = cognito_client.admin_delete_user(
            UserPoolId = userLayer.get_pool_id(),
            Username = Username,
        )
        response = { "data" : deleteResponse }

        response.update(tokens["AuthenticationResult"])
    
        return {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'application/json;charset=utf-8',
            },
            'body': json.dumps(response, default=support_datetime_default),
            'isBase64Encoded': False
        }

    except Exception as e:
        type_, value, traceback_ = sys.exc_info()
        error = {
            "ERROR": {
                "type": str(type_),
                "value": str(value),
                "traceback_": str(traceback_)
            }
        }
        return {
            'statusCode': 503,
            'headers': {
                'Content-Type': 'application/json;charset=utf-8',
            },
            'body': json.dumps(error),
            'isBase64Encoded': False
         }
    
def support_datetime_default(obj):
    if isinstance(obj, datetime):
        return obj.isoformat()
    raise TypeError(repr(obj) + " is not JSON serializable")    
