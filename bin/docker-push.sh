#!/bin/bash -ex

export GIT_COMMIT_ID="$(git rev-parse HEAD)"
docker-compose build rails_push
docker-compose push rails_push
