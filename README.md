# Mars Weather Dashboard

A planned **Flutter mobile dashboard** for visualising Mars weather data fetched from a custom Python backend API.

---

## 📌 About the Project

Mars Weather Dashboard is a **simple Flutter-based mobile application** designed to display Mars weather data in a clean, readable interface.

The app is planned to consume data from a dedicated backend service, handling all data retrieval and processing externally so the frontend can remain lightweight and focused on UI and user experience.

---

## 🧠 Project Architecture

This project is part of a **two-repository system**:

- **Backend API**  
  [python-mars-weather](https://github.com/dimitrilahanas/python-mars-weather)  
  A FastAPI service that fetches, processes, and exposes Mars weather data from NASA’s InSight API.

- **Frontend Dashboard (this repository)**  
  A Flutter mobile app that consumes the backend API and displays the data visually.

---

## 🎯 Planned Features

- Display the latest available Martian Sol
- View weather data for a selected Sol:
  - Average temperature
  - Martian season
  - Wind direction
  - Wind speed
- Simple, mobile-friendly UI
- API-driven architecture (no direct NASA API calls from the app)

---

## 🛠 Tech Stack

- **Flutter** – cross-platform mobile framework
- **Dart** – application logic
- **REST API** – data consumption from backend service

---

## 🚧 Project Status

This project is currently in the **early development / planning stage**.  
Initial focus is on API integration and basic UI structure before expanding features and design.

---