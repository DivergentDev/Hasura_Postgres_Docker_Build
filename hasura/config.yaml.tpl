version: 2
endpoint: http://localhost:8080
metadata_directory: metadata
admin_secret: myadminsecretkey #enter your hasura admin secret key here
actions:
  kind: synchronous
  handler_webhook_baseurl: http://localhost:3000
