#!/usr/bin/env bash

# default recipe to display help information
default:
  @just --list

# start a new symfony docker project
clone repo='symfony-docker':
  #!/usr/bin/env bash
  git clone git@github.com:dunglas/symfony-docker.git {{ repo }}
  cp justfile {{ repo }}/justfile

build:
  #!/usr/bin/env bash
  docker compose build --no-cache

up:
  #!/usr/bin/env bash
  docker compose up --pull always -d --wait

down:
  #!/usr/bin/env bash
  docker compose down --remove-orphans