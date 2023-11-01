# Use an official Python runtime as a parent image
FROM python:3.6-slim-buster

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install required packages
RUN apt-get update && apt-get install -y \n    build-essential \n    python3-dev

# Remove the package lists to free up space
RUN rm -rf /var/lib/apt/lists/* 

# Upgrade pip to the latest version
RUN python -m pip install --upgrade pip

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Run a command to download the 'en' model for 'spacy'
RUN python -m spacy download en

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "run.py"]
