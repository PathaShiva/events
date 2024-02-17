#!/bin/bash
rm -f tmp/pids/server.pid
pwd
bundle install
sleep 10
echo "done: bundle install"
bin/rails db:create
echo "done: db:create"
bin/rails db:migrate
echo "done: db:migrate"
bin/rails server -p 7003 -b 0.0.0.0