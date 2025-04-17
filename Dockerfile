# Start with Ubuntu base image
FROM ubuntu:22.04

# Update & install Apache, Git, Curl, etc.
RUN apt-get update && \
    apt-get install -y apache2 git curl unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory to Apache's web root
WORKDIR /var/www/html

# Expose Apache's port (we'll map this to 82 when running the container)
EXPOSE 82

# Start Apache in the foreground when the container runs
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

