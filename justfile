#!/usr/bin/env bash

# default recipe to display help information
default:
  @just --list

# start a new symfony docker project
clone repo='symfony-docker':
  #!/usr/bin/env bash
  git clone git@github.com:dunglas/symfony-docker.git {{ repo }}
  cp justfile {{ repo }}/justfile

# build container images
build:
  #!/usr/bin/env bash
  docker compose build --no-cache

# start containers
up:
  #!/usr/bin/env bash
  docker compose up --pull always -d --wait

# stop containers
down:
  #!/usr/bin/env bash
  docker compose down --remove-orphans

# show live container(s) logs  for
log container='':
  #!/usr/bin/env bash
  if [[ -z "{{ container }}" ]]; then
    docker compose logs --follow
  else
    docker compose logs --timestamps --follow {{ container }}
  fi

# php bin/console command <cmd>
console cmd='':
  #!/usr/bin/env bash
  docker compose exec php bin/console {{ cmd }}

# composer <cmd>
composer cmd='':
  #!/usr/bin/env bash
  docker compose exec php composer {{ cmd }}
