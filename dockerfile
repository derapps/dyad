# Use Node.js base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and lock file
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the code
COPY . .

# Build the app (if there’s a build step)
RUN npm run build || echo "No build step"

# Expose port (Dyad docs: adjust if needed)
EXPOSE 3000

# Start the app (adjust if Dyad’s start script is different)
CMD ["npm", "start"]
