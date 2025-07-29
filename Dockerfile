FROM node:18-alpine

# Set the working directory
WORKDIR /src

# Copy package files first to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm ci --omit=dev

# Copy source files
COPY tsconfig.json .
COPY src ./src

# Build TypeScript
RUN npm run build

# Use CMD instead of RUN for the start command
CMD ["npm", "start"]