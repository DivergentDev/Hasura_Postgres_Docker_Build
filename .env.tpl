#rename the file to .env and change your environment values to what you see fit

DB_PASSWORD=password_here
DB_USER=user_here
DB_NAME=set_database_name_here
DB_EXPOSED_PORT=5555
DB_HOST=db #within dev this should match the name of your database service. In production this should represent the ip address or username

HASURA_ADMIN_SECRET=myadminsecret