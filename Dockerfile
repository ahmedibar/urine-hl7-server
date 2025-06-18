# Use a slim Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install git and other system dependencies
RUN apt-get update && apt-get install -y git && apt-get clean

# Only copy requirements.txt first
COPY requirements.txt .

# Install dependencies manually
RUN pip install --no-cache-dir -r requirements.txt \
 && pip install git+https://github.com/frappe/frappe-client.git

# Copy app code
COPY app/ /app/

# Expose HL7 port (optional, can be overridden in compose)
EXPOSE 5030

# Default command
CMD ["python", "-u", "hl7_listener.py"]
