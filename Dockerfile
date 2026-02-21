FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Back4App requires EXPOSE
EXPOSE 5000

# But runtime must use dynamic $PORT
CMD gunicorn -w 1 -b 0.0.0.0:${PORT:-5000} app:app
