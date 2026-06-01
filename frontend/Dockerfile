FROM node:18-slim AS build

WORKDIR /app

# Copy everything from root
COPY . .

# Navigate to frontend and build
WORKDIR /app/frontend
RUN npm ci
RUN npm run build

# Production stage
FROM node:18-slim

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

# Copy built app
COPY --from=build /app/frontend/dist/frontend ./frontend/dist

EXPOSE 3000
CMD ["node", "server.js"]