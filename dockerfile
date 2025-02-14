# Use an official lightweight Python image
FROM python:3.9-slim

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy project files
COPY . .

# Install Nginx -
RUN apt update && apt install -y nginx

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80 8000

# Start Nginx and FastAPI together
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000
