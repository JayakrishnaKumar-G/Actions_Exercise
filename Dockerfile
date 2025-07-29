FROM node:18-alpine

# Set the working directory
WORKDIR /src

# Copy package files first to leverage Docker cache
COPY . .

# Install dependencies
RUN npm ci --omit=dev

# Use CMD instead of RUN for the start command
CMD ["npm" ,"run" , "start"]