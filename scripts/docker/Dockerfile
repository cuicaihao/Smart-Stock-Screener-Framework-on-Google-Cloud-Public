# Use the official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set environment variables for Google Cloud credentials (if needed)
# ENV GOOGLE_APPLICATION_CREDENTIALS /path/to/your/credentials.json

# Create and set the working directory
WORKDIR /app

# Copy the requirements file into the container and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy schema into the container
RUN mkdir ./schema
COPY ./schema ./schema

# Copy modules into the container
RUN mkdir ./modules
COPY ./modules ./modules

# Copy the app.py file into the container
COPY app.py .

# Define the command to run your application
CMD ["python", "app.py"]
