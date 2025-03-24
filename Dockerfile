FROM python:3.13

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

# Run the FastAPI application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "$PORT"]
