FROM ubuntu:14.04
MAINTAINER Nathan Moos

# Copy files over
ADD . /app

# Update the system
RUN (apt-get -y update && apt-get -y upgrade)

# Install binary dependencies
RUN apt-get -y install python-pip python-numpy python-scipy python-pandas python-patsy python-statsmodels python-msgpack redis-server

# Install source dependencies
RUN pip install -r /app/requirements.txt

# Make directories
RUN (mkdir /var/log/skyline && mkdir /var/run/skyline && mkdir /var/dump)

# Finally, run the system
WORKDIR /app/bin
CMD sh ../skyline-start.sh
