import cognito_info.poolinfo
import json
import traceback
import sys
from datetime import datetime
import os
import boto3

cognito_client = boto3.client('cognito-idp')

'''
{
    "Username": "kkato",
    "Role":"user",
     "Attributes": [
        { "Name": "email", "Value": "kyowa@example.com" },
        { "Name": "name", "Value": "KaoriKato" }
    ],
    "Password": "P@ssw0rd",
    "RefreshToken":"..."
}
'''

def lambda_handler(event, context):
    body = json.loads( event['body'] ) # Stringをdictへ変換
    Username = body['Username']
    UserRole = body['Role']
    Attributes = body['Attributes']
    UserPassword = body['Password']
    MyRefreshToken = body['RefreshToken']
    print("Received event: " + json.dumps(body))
    Attributes[2]["Value"] = str(Attributes[2]["Value"])
    
    Attributes.append({
      "Name": "email_verified",
      "Value": "True"
     })

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

        createResponse = cognito_client.admin_create_user(
            UserPoolId = userLayer.get_pool_id(),
            Username = Username,
            UserAttributes = Attributes,
            TemporaryPassword = UserPassword,
            MessageAction = "SUPPRESS"
        )
        print( json.dumps(createResponse, default=support_datetime_default) )

        changeResponse = cognito_client.admin_set_user_password(
            UserPoolId = userLayer.get_pool_id(),
            Username =  Username,
            Password =  UserPassword,
            Permanent = True
        )
        print( json.dumps(changeResponse, default=support_datetime_default) )
        
        userResponse = cognito_client.admin_get_user(
            UserPoolId = userLayer.get_pool_id(),
            Username = Username,
        )
        print(userResponse)
        response = { "data" : [userResponse] }      

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
        print(json.dumps(error))

        #中途半端なアカウントを削除
        if "UsernameExistsException" not in str(type_):
            try:
                exceptRes = cognito_client.admin_delete_user(
                    UserPoolId = userLayer.get_pool_id(),
                    Username =  Username
                )

            except Exception as delEx:
                type_, value, traceback_ = sys.exc_info()
                error = {
                    "ERROR": {
                        "type": str(type_),
                        "value": str(value),
                        "traceback_": str(traceback_)
                    }
                }
                print(json.dumps(error))
        
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


        try:
            # Check if the email is already registered
            email_exists = is_email_registered(email, user_pool_id)

            if email_exists:
                return {
                    'statusCode': 400,
                    'body': json.dumps(f'An account with the email {email} already exists.')
                }
            
            # Sign up the new user
            sign_up_user(username, password, email, client_id)

            return {
                'statusCode': 200,
                'body': json.dumps(f'User {username} has been successfully signed up.')
            }

        except Exception as e:
            print(e)
            return {
                'statusCode': 500,
                'body': json.dumps(f"Error: {str(e)}")
            }