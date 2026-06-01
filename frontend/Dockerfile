FROM node:18-slim AS build

WORKDIR /app

# Copy root package files
COPY package*.json ./

# Copy frontend folder (this references frontend/ in the build context)
COPY frontend/ ./frontend/

WORKDIR /app/frontend

# Install dependencies
RUN npm ci

# Build the app
RUN npm run build

# Production stage
FROM node:18-slim

WORKDIR /app

# Copy root package.json for production
COPY package*.json ./

# Install production dependencies only
RUN npm ci --only=production

# Copy built frontend from build stage
COPY --from=build /app/frontend/dist/frontend ./frontend/dist

EXPOSE 3000

CMD ["node", "server.js"]