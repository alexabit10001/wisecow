# Use full Ubuntu base
FROM ubuntu:24.04

# Set working directory
WORKDIR /app

# Install prerequisites
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Ensure /usr/games is in PATH
ENV PATH="/usr/games:${PATH}"

# Copy the entire app
COPY . .

# Expose the port
EXPOSE 4499

# Run the app via the script
CMD ["bash","./wisecow.sh"]

