# make a local develop environment for the project
#!/bin/bash

# Check if Python 3.9 is installed
if ! command -v python3.9 &> /dev/null
then
    echo "Python 3.9 not found. Installing..."
    # Install Python 3.9
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install python@3.9
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt-get update
        sudo apt-get install python3.9 -y
    else
        echo "Unsupported operating system"
        exit 1
    fi
fi

# Install pip for Python 3.9
if ! command -v pip3 &> /dev/null
then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sudo easy_install pip
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt-get install python3-pip -y
    else
        echo "Unsupported operating system"
        exit 1
    fi
fi

# Install virtualenv
pip3 install virtualenv

# Create a virtual environment for the project
virtualenv -p python3.9 env

# Activate the virtual environment
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Activating virtual environment..."
    source env/bin/activate
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source env/bin/activate
else
    echo "Unsupported operating system"
    exit 1
fi

# Install the packages from requirements.txt
pip3 install -r requirements.txt

# Deactivate the virtual environment
# deactivate