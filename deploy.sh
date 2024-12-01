#!/usr/bin/env bash

# Update and install necessary packages
sudo apt update && sudo apt install -y nodejs npm ruby-full

# Install pm2 (production process manager)
sudo npm install -g pm2

# Stop any currently running instance of the Rails application
pm2 stop GymApp || true

# Change directory into the application folder
cd GymApp/

# Install Ruby gems (Rails dependencies)
bundle install --without development test

# Precompile assets for production
RAILS_ENV=production bin/rails assets:precompile

# Run database migrations
RAILS_ENV=production bin/rails db:migrate

# Start the Rails application using pm2
pm2 start --name GymApp --interpreter ruby -- bin/rails server -e production -b 0.0.0.0
