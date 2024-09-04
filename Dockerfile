# Use an older base image to simulate vulnerabilities
FROM ubuntu:18.04

# Install curl and openssl (latest versions available for this base image)
RUN apt-get update && \
    apt-get install -y \
    curl \
    openssl

# Create the application directory
RUN mkdir -p /usr/src/app

# Create a basic application file
RUN echo "Hello, this is a vulnerable image!" > /usr/src/app/index.html

# Set working directory
WORKDIR /usr/src/app

# Expose a port for demonstration
EXPOSE 8080

# Run a simple command
CMD ["cat", "index.html"]
