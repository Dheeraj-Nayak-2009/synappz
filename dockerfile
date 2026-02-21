# Use a Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy the dependency file first and install
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy all code into the container
COPY . .

# Tell Docker which port to expose
EXPOSE 5000

# Run using gunicorn so it serves on 0.0.0.0
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
