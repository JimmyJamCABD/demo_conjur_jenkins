#!/usr/bin/python

import os

access_key = os.environ['AWS_ACCESS_KEY_ID']
secret_key = os.environ['AWS_SECRET_ACCESS_KEY']

message = "{\n   AccessKeyID : " + access_key + ",\n   SecretAccessKey : " + secret_key + "\n}"

print message
