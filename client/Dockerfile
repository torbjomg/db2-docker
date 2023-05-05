# Use the official Python 3.11 image as the base
FROM python:3.11

# Set the working directory
WORKDIR /app

# Install any required packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Python script into the container
COPY script.py .

# Execute the script when the container starts
CMD ["python", "script.py"]