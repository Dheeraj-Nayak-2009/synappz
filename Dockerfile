# Use a Python base image
FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Do NOT hardcode 5000
CMD ["sh", "-c", "gunicorn --worker-class eventlet -w 1 -b 0.0.0.0:$PORT app:app"]
