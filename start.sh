#!/bin/bash

# Start the backend in the background
# We allow output to stdout/stderr so it shows in HF Space logs
echo "Starting Backend..."
uvicorn main:app --host 0.0.0.0 --port 8000 &

# Wait a few seconds for the backend to initialize
sleep 5

# Start the frontend
# Hugging Face Spaces expects the app to run on port 7860
echo "Starting Frontend..."
streamlit run streamlit_app.py --server.port 7860 --server.address 0.0.0.0
