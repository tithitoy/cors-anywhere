# Use a lightweight Node.js image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy the rest of the application files
COPY . .

# Set environment variables (SnapDeploy will expose the port)
ENV PORT=8080
EXPOSE 8080

# Command to start the proxy server
CMD [ "node", "server.js" ]
