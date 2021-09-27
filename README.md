# Simform Test (Scamble Application)

## Install

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.6.6`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.6.6
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Initialize the database

```shell
rails db:create
rails db:migrate
```

## Serve

```shell
heroku local
```

In another tab
```shell
./bin/webpack-dev-server
```

## DB Schema

### game_players

| Column | Datatype | Model Role |
| --------------- | --------------- | --------------- |
| player_id | bigint | required |
| game_id | bigint | required |
| score | float | required |

### games

| Column | Datatype | Model Role |
| --------------- | --------------- | --------------- |
| name | string | required |
| detail | string |  |

### players

| Column | Datatype | Model Role |
| --------------- | --------------- | --------------- |
| name | string | required |
| phone | string |  |