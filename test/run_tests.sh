#!/bin/bash

# Check if API key is provided
if [ -z "$1" ]; then
    echo "Please provide your OpenAI API key"
    echo "Usage: ./run_tests.sh your_api_key"
    exit 1
fi

# Run the tests with the provided API key
OPENAI_API_KEY=$1 flutter test 