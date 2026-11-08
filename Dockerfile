FROM python:3.11-slim

WORKDIR /app

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
