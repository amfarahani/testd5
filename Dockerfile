FROM python:3.11-slim

WORKDIR /app

# Install dependencies first (better layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

# Heroku sets PORT at runtime; this default helps local runs
ENV PORT=8080

# EXPOSE is optional on Heroku, but useful for local clarity
EXPOSE 8080

# Gunicorn binds to $PORT (required for Heroku routing)
CMD ["sh", "-c", "gunicorn --bind 0.0.0.0:${PORT} app:app"]
