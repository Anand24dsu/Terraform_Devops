#!/bin/bash
set -e  # Exit on any error
export DEBIAN_FRONTEND=noninteractive

# Ensure system package list is up to date
echo "Updating system packages..."
sudo apt-get update
sudo apt-get install -y wget curl gnupg2 lsb-release tar python-is-python3

# Check Python version
echo "Checking Python version..."
python --version || { echo "Python is not installed!"; exit 1; }

# Configure ulimits
echo "Configuring ulimit values..."
ulimit -n 1048576
ulimit -u 65536

# Detect system architecture (x86_64 or aarch64)
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    YB_VERSION="2.25.0.0-b489"
    YB_TARBALL="yugabyte-${YB_VERSION}-linux-x86_64.tar.gz"
elif [[ "$ARCH" == "aarch64" ]]; then
    YB_VERSION="2.25.0.0-b489"
    YB_TARBALL="yugabyte-${YB_VERSION}-linux-aarch64.tar.gz"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

# Download and extract YugabyteDB
echo "Downloading YugabyteDB..."
wget "https://software.yugabyte.com/releases/2.25.0.0/${YB_TARBALL}"
tar xvfz "${YB_TARBALL}"

