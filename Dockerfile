# Use the official Nginx image as the base image
FROM nginx:alpine

# Copy the static HTML file to the Nginx web server's directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 for the container
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
