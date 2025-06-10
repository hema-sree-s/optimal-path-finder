# Use the official lightweight Python image.
FROM python:3.11-slim

# Set a working directory inside the container.
WORKDIR /app

# Copy dependency list and install them.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your entire application into the container.
COPY . .

# Expose the port your app runs on.
ENV PORT=8080
EXPOSE 8080

# Tell Flask/Gunicorn how to start.
#   - app:app  → “app” module (app.py), Flask object named “app”
#   - bind 0.0.0.0:8080 → listen on all interfaces for Container/Render/Cloud Run
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8080"]
