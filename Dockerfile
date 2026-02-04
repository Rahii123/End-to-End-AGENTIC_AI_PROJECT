# Use Python 3.10 as the base image
FROM python:3.10-slim

# Set working directory to /app
WORKDIR /app

# Install system dependencies (curl is useful for health checks/debugging)
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application code
COPY . .

# Grant execution permissions to the start script
RUN chmod +x start.sh

# Expose port 7860 (Hugging Face Spaces default)
EXPOSE 7860

# Define the command to run the application
CMD ["./start.sh"]
