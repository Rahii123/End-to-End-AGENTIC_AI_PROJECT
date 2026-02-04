---
title: Agentic Trip Planner
emoji: ✈️
colorFrom: blue
colorTo: indigo
sdk: docker
pinned: false
app_port: 7860
---

# 🌍 End-to-End Agentic AI Trip Planner

![Python](https://img.shields.io/badge/Python-3.10%2B-blue?style=for-the-badge&logo=python)
![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)
![LangChain](https://img.shields.io/badge/LangChain-1C3C3C?style=for-the-badge&logo=langchain)
![Streamlit](https://img.shields.io/badge/Streamlit-FF4B4B?style=for-the-badge&logo=streamlit)

**An intelligent, autonomous travel assistant that builds personalized itineraries in real-time.**

Current Status: 🚧 **Under Active Development (Phase 1 Complete)**

---

## 📖 Overview

The **Agentic AI Trip Planner** goes beyond simple chatbots. It uses an **Agentic Workflow** powered by **LangGraph** to orchestrate specialized tools. When you ask for a trip plan, the AI acts as a sophisticated travel agent: it researches locations, checks live weather, calculates expenses, and converts currencies to provide a comprehensive, actionable itinerary.

## ✨ Key Features

- **🤖 Autonomous Agentic Core**: Uses a graph-based orchestration engine to decide *what* tools to use and *when*.
- **🔍 Multi-Source Search**: Integrates **Tavily AI** (and optional Google Places) to find top-rated attractions, restaurants, and hidden gems.
- **⛅ Live Weather Integration**: Fetches real-time weather forecasts via **OpenWeatherMap** to ensure your plans match the season.
- **💱 Dynamic Currency Conversion**: Automatically converts estimated costs to your preferred currency using live rates from **Fixer.io**.
- **💰 Smart Expense Calculator**: Provides budget estimates for activities and dining.
- **⚡ High-Performance Architecture**: Built on **FastAPI** for a robust backend and **Streamlit** for an interactive frontend.

---

## 🛠️ Tech Stack

- **LLM Orchestration**: [LangGraph](https://langchain-ai.github.io/langgraph/) & [LangChain](https://www.langchain.com/)
- **LLM Providers**: Llama 3.3-70b (via **Groq**) or OpenAI GPT-4o.
- **Backend**: FastAPI
- **Frontend**: Streamlit
- **Tools & APIs**:
  - **Tavily**: Search & Research
  - **OpenWeatherMap**: Weather Data
  - **Fixer.io**: Currency Exchange Rates
  - **Google Places** (Optional support)

---

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/trip-planner-agent.git
cd trip-planner-agent
```

### 2. Environment Setup
Create a `.env` file in the root directory and add your API keys:

```ini
# Core LLM Providers
GROQ_API_KEY=your_groq_api_key
OPENAI_API_KEY=your_openai_api_key  # Optional if using Groq

# Tool APIs
TAVILY_API_KEY=your_tavily_api_key
OPENWEATHERMAP_API_KEY=your_openweathermap_api_key
FIXER_API_KEY=your_fixer_api_key
GPLACES_API_KEY=your_google_places_key # Optional: Auto-skips if missing
```

### 3. Install Dependencies
It is recommended to use a virtual environment:
```bash
# Create venv
python -m venv venv
# Activate venv (Windows)
.\venv\Scripts\activate
# Install packages
pip install -r requirements.txt
```

---

## 🏃‍♂️ Usage

This project runs as a two-part system: a generic API backend and a user-facing frontend.

### Step 1: Start the Backend
Runs the FastAPI server handling the agent logic.
```bash
uvicorn main:app --reload --port 8000
```

### Step 2: Start the UI
Runs the Streamlit interface for interaction.
```bash
streamlit run streamlit_app.py
```
*Access the app at `http://localhost:8501`*

*Access the app at `http://localhost:8501`*

---

## 🐳 Deployment with Docker

The easiest way to run the application in a professional environment is using Docker. This ensures that all dependencies are isolated and the app runs consistently everywhere.

### 1. Build and Run
Make sure you have Docker Desktop installed, then run:

```bash
docker-compose up --build
```

- **Backend** will start on `http://localhost:8000`
- **Frontend** will start on `http://localhost:8501`

### 2. Stop the App
To stop the containers, press `Ctrl+C` or run:
```bash
docker-compose down
```

---

## 🏗️ Project Structure

```
├── agent/                  # Agent orchestration logic (LangGraph)
├── config/                 # Configuration files (LLM selection, models)
├── tools/                  # Tool definitions (Search, Weather, etc.)
├── utils/                  # Utility scripts (API wrappers, helpers)
├── main.py                 # FastAPI Entry point
├── streamlit_app.py        # Frontend Application
├── requirements.txt        # Project dependencies
└── README.md               # Project documentation
```

## 🗺️ Roadmap

- [x] **Phase 1**: Core Agentic Workflow & Tool Integration (Complete)
- [ ] **Phase 2**: Enhanced UI/UX & Interactive Maps
- [ ] **Phase 3**: Authentication & User Profiles
- [ ] **Phase 4**: Cloud Deployment (Docker/AWS)

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements.

---

*Built by Raheel Nadeem*