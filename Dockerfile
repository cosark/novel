# Use the official Node.js 18 image as a parent image
FROM node:18-alpine

# Set the working directory
WORKDIR /usr/src/app


# Install pnpm if it isn't already included in the base image
RUN npm install -g pnpm 

# Copy the local code to the container
COPY . .
# Install dependencies
RUN pnpm install

# Install Mintlify CLI for the docs server
RUN pnpm install -w mintlify


# Build the project
RUN pnpm build

# Start the app
CMD ["npm", "run", "dev"]
