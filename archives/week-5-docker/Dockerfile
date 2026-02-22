# Step 1: Use an existing light-weight web server image
FROM nginx:alpine

# Step 2: Copy your local HTML file into the image's web directory
COPY index.html /usr/share/nginx/html/index.html

# Step 3: Tell Docker to listen on port 80
EXPOSE 80
