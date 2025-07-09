# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Copy all other source files
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]
