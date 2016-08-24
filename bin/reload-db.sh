#!/bin/bash
rm ./db/development.sqlite3
bin/rake db:migrate
bin/rake db:seed
bin/rake import
