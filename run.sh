#!/bin/bash


docker-compose create
docker-compose build
docker-compose run --entrypoint "sh -c \"cd /app && mix do deps.get, deps.compile, ecto.create, ecto.migrate && mix run priv/repo/seeds.exs\"" app

docker-compose run --entrypoint "sh -c \"cd /app && iex -S mix phx.server\"" --service-ports app
