FROM node:18-alpine AS build

WORKDIR /app

# Copy root package files
COPY package*.json ./

# Copy frontend package files
COPY frontend/ ./frontend/

# Install root dependencies
RUN npm ci

# Install frontend dependencies
WORKDIR /app/frontend
RUN npm ci

# Build frontend
RUN npm run build

# Production stage
FROM node:18-alpine

WORKDIR /app

# Copy root package files
COPY package*.json ./

# Install production dependencies
RUN npm ci --only=production

# Copy built frontend from build stage
COPY --from=build /app/frontend/dist ./frontend/dist

EXPOSE 3000

CMD ["node", "server.js"]