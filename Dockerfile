# Use the `python:3.10` as a source image from the Amazon ECR Public Gallery
# We are not using `python:3.10` from Dockerhub because it has put a  pull rate limit. 
FROM python:stretch
WORKDIR /myimage

# Set up an app directory for your code
COPY requirements.txt requirements.txt
WORKDIR /app

# Install `pip` and needed Python packages from `requirements.txt`
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# Define an entrypoint which will run the main app using the Gunicorn WSGI server.
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]