#!/usr/bin/env bash

# Update and install necessary packages
echo "Updating system and installing dependencies..."
sudo apt update && sudo apt install -y nodejs npm ruby-full

# Install pm2 (production process manager)
echo "Installing PM2..."
sudo npm install -g pm2

# Stop and delete any currently running instance of the Rails application
echo "Stopping any running PM2 process for GymApp..."
pm2 stop GymApp || true
pm2 delete GymApp || true

# Navigate to the application folder
echo "Navigating to the application folder..."
cd ~/GymApp/ || exit 1  # Update the path if necessary

# Ensure Ruby gems are installed (Rails dependencies)
echo "Installing Ruby gems..."
bundle install --without development test || exit 1

# Precompile assets for production
echo "Precompiling assets..."
RAILS_ENV=production bin/rails assets:precompile || exit 1

# Run database migrations
echo "Running database migrations..."
RAILS_ENV=production bin/rails db:migrate || exit 1

# Ensure the bin/rails file is executable
echo "Ensuring bin/rails is executable..."
chmod +x bin/rails || exit 1

# Start the Rails application using PM2
echo "Starting the application with PM2..."
pm2 start --name GymApp --interpreter ruby -- bin/rails server -e production -b 0.0.0.0 || exit 1

# Display the status of PM2 processes
echo "Deployment completed. Checking PM2 status..."
pm2 list
