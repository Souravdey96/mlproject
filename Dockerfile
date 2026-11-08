FROM python:3.11-slim-buster

WORKDIR /app

# Install system dependencies if required (e.g. for building packages)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy dependency definition first for caching layers
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files into the container
COPY . .

# Expose port 5000 for Flask application
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]

