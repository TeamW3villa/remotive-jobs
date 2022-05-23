#!/bin/sh 
set -e

# Remove a potentially pre-existing server.pid for Rails.
#/bin/bash -l -c "bundle install --jobs 20 --retry 5"

#/bin/bash -l -c "source /etc/profile.d/rvm.sh &&  rake db:setup && rake assets:precompile"
/bin/bash -l -c "source /etc/profile.d/rvm.sh && bundle exec sidekiq "

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
