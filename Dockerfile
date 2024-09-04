# Use an old base image to simulate vulnerabilities
FROM ubuntu:18.04

# Install some outdated packages
RUN apt-get update && \
    apt-get install -y \
    curl=7.58.0-2ubuntu3.10 \
    openssl=1.1.1-1ubuntu2.1~18.04.5

# Create a basic application file
RUN echo "Hello, this is a vulnerable image!" > /usr/src/app/index.html

# Set working directory
WORKDIR /usr/src/app

# Expose a port for demonstration
EXPOSE 8080

# Run a simple command
CMD ["cat", "index.html"]
