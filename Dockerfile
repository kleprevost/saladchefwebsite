# Use an official Node.js image as a base
FROM node:18-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Install Astro CLI globally
RUN npm install -g astro

# Install socat for IPv6 support
RUN apk update && apk add socat

# Copy the application code
COPY . .

# Build the Astro site
RUN astro build

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application with IPv6 support
CMD ["sh", "-c", "socat TCP6-LISTEN:3000,fork TCP4:127.0.0.1:8080 & astro preview --host :: --port 8080"]
