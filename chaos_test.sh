#!/bin/bash
URL=$(terraform output -raw alb_dns_name)
echo "Testing $URL - Press Ctrl+C to stop"
while true; do
  curl -s -I http://$URL | grep "HTTP/1.1 200 OK" || echo "Check failed!"
  sleep 10
done