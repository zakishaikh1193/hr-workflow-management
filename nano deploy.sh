#!/bin/bash
set -e  # Exit on any error

APP_DIR="/var/www/hr.legatolxp.online"
cd "$APP_DIR" || exit 1

echo "Pulling latest code..."
git pull origin main

echo "Installing dependencies..."
npm ci --production  # Or pip install -r requirements.txt

echo "Building app..."
npm run build  # Skip if no build step

echo "Restarting service..."
pm2 restart hr-app --update-env  # Or sudo systemctl restart hr-app

echo "Health check..."
sleep 5
if ! curl -f http://localhost:3000/health; then
  echo "Health check failed!"
  exit 1
fi
echo "Deployment successful!"