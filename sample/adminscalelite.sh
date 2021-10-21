#!/bin/bash

case "$1" in
  "init")
    echo "initialize the database..."
    docker-compose run --rm scalelite-api --entrypoint "/srv/scalelite/bin/rake db:setup"
    ;;
  "restart")
    docker-compose rm scalelite-api scalelite-poller scalelite-recording-importer
    docker-compose up -d scalelite-api scalelite-poller scalelite-recording-importer
    ;;
  "add")
    read -p "domain (in form of bbb.example.com): " domain
    read -p "secret: " secret
    url="https://$domain/bigbluebutton/api"
    docker exec scalelite-api /srv/scalelite/bin/rake servers:add["$url","$secret"] > result.tmp
    if (grep -q -F "OK" result.tmp); then
      node="$(grep -m 1 "^id: .*$" result.tmp | cut -d " " -f2)"
      docker exec scalelite-api /srv/scalelite/bin/rake servers:enable["$node"]
      docker exec scalelite-api /srv/scalelite/bin/rake poll:all
      docker exec scalelite-api /srv/scalelite/bin/rake status
    else
      echo "Failed to add server"
    fi
    rm result.tmp
    ;;
  "enable")
    read -p "node-id: " node
    docker exec scalelite-api /srv/scalelite/bin/rake servers:enable["$node"]
    ;;
  "disable")
    read -p "node-id: " node
    docker exec scalelite-api /srv/scalelite/bin/rake servers:disable["$node"]
    ;;
  "remove")
    read -p "node-id: " node
    docker exec scalelite-api /srv/scalelite/bin/rake servers:remove["$node"]
    ;;
  "servers")
    docker exec scalelite-api /srv/scalelite/bin/rake servers
    ;;
  "status")
    docker exec scalelite-api /srv/scalelite/bin/rake status
    ;;
  *)
    if [ -z $1 ]; then
      echo "no argument given"
    else
      echo "unknown argument"
    fi
    ;;

esac
