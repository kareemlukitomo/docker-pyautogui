FROM python:3.8-slim-bullseye

# Install dependencies in one layer
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    libgl1-mesa-dev \
    libgl1-mesa-glx \
    xvfb \
    x11-apps \
    x11-xserver-utils \
    xauth \
    libxrender1 \
    libxtst6 \
    libxi6 \
    python3-tk \
    python3-dev \
    gnome-screenshot \
    firefox-esr && \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies separately to utilize caching effectively
RUN pip install --no-cache-dir pyautogui

# Create the necessary directory for output
RUN mkdir -p /app/data

# Set the working directory
WORKDIR /app/

# Copy the Python script and the shell script into the container
COPY test.py set_xvfb.sh /app/

# Ensure the shell script is executable
RUN chmod +x /app/set_xvfb.sh

# Set the entrypoint to the shell script
ENTRYPOINT ["/app/set_xvfb.sh"]
