# Use the official Nginx image from the Docker Hub
FROM nginx:latest

# Copy custom configuration file to the Nginx configuration directory
COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d/ /etc/nginx/conf.d/

# Expose port 80
EXPOSE 80