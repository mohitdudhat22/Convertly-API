FROM python:3.10-slim

# Install Ghostscript and other required system dependencies
RUN apt-get update && apt-get install -y ghostscript && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy FastAPI app and requirements.txt
COPY . /app

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variable for the port
ENV PORT=8000

# Expose the port
EXPOSE $PORT
# Run the FastAPI application
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port $PORT"]
