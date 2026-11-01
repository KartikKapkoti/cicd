
# Stage 1: Build React application
FROM node:22-alpine AS builder

# Set working directory
WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy application source
COPY . .

# Generate production build
RUN npm run build


# Stage 2: Serve using Nginx
FROM nginx:alpine

# Remove default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Add our custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy React production files
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose HTTP port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
