# :package:	Divergent Hasura Docker Build
(With Automatic Application Of **Migrations** And **Metadata**)

## Synopsis

This repository is created to aid development for individuals and teams who want to jump into development with their database and API layer at the ready. This repo takes a Hasura image and builds it with docker, whether you want to use this in production or in development.
This configuration also uses the docker **migration** images which means that every time a new migration is present in your hasura directory that migration will be applied at startup (of the docker container). This is ideal for teams who are tracking changes to their metadata and migration files within the repo. **Combined with a CI/CD pipeline** this can keep all tables and their corresponding metadata up to date on your various environments.


## Pre-Requisites

- `<= node-v14`. We suggest the [n package](https://www.npmjs.com/package/n) if you use a mac or the [nvm for windows package](https://github.com/coreybutler/nvm-windows) if you're on windows
- `docker` & `docker-compose`
- `<= npm v7.24.2`

## Installation

Assuming all pre-requisites have been met the instructions are as follows:

1. Run `npm install` to install the only npm package (`hasura-cli`)
2. Copy the `.env.tpl` file (found in your root folder) and paste it as a `.env` file and fill in the environment variables to your heart's content
3. Similarly, within the hasura folder, copy the `config.yaml.tpl` file and paste it as a `config.yaml` file. All you **should** need to change is the `admin_secret` config variable to match the `HASURA_ADMIN_SECRET` **.env** file variable.
4. Run `npm run docker-dev` to build and run your `development` configuration, which ships with a Postgres database, **OR** run the command `npm run docker-prod` command to run your `production` configuration.

> If ou plan on using this in production, please make sure that your .env file sets the correct __database__ variables as the production build __DOES NOT__ ship with a postgres database. Assuming that your DB is a __Postgres database__ running on port __5432__ then all you should need to change are the database variables in the `.env` file as well as the `HASURA_ADMIN_SECRET` .env variable.   
  
  
## Tracking Database Changes & Migrations

To make sure that your database (and table) changes are tracked, please run the command `npm run hasura-console`. This command should run a different instance of Hasura locally. It should open a new browser tab/window for you, but if it doesn't it should print out the url of the newly run instance. It is __EXTREMELY__ important that you make all your changes via this newly run __Hasura console__ instance, because if you don't, any changes you make will not be tracked and will not be as easy to migrate to another instance.

> __Only changes made via the Hasaura Console are tracked!__

Making your changes in the Hasura console automatically tracks your changes and stores them within the `hasura/migrations` and `hasura/metadata` folders. To make sure that everyone in your team has access to these changes, please `commit` and `push` all your changes to a branch of your choice.

Fortunately, members of your team shouldn't need to manually apply any migration changes to your database if you just made a change to the database schema. All they should have to do is pull your most recent changes and run

`npm run docker-dev` for __development__
`npm run docker-prod` for __production__

Starting/restarting the docker container after they've pulled your most recent changes, should simply apply your changes as their container starts up!

For the more visual among you, you can [watch this great tutorial](https://www.youtube.com/watch?v=x-CHwIqLvHY) on YouTube detailing __how migrations work__.


