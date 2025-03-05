FROM python:3.10-slim

# Install Ghostscript and other required system dependencies
RUN apt-get update && apt-get install -y ghostscript && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy FastAPI app and requirements.txt
COPY . /app

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 8000

# Run the FastAPI application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
