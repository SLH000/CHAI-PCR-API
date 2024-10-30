# CHAI-PCR-API
# Experiment Management API

This project provides an API for managing biological experiments on a networked device. Key functionalities include creating experiments, configuring stages and steps, starting, resuming, and stopping experiments, and retrieving amplification data.

## Table of Contents
1. Installation
2. Configuration
3. Authentication
4. Experiment Management
    - Create Experiment
    - Update Experiment Stages and Steps
    - Start, Resume, Stop Experiment
5. Amplification Data Retrieval
6. Usage Example

---

## Installation
1. Clone the repository and install dependencies:
    ```bash
    git clone <repository_url>
    cd <repository_directory>
    npm install
    ```
2. Make sure the device and API endpoints are accessible at `http://192.168.7.2`.

---

## Configuration
Define experiment configurations in `experimentDefinitions.js`:
```javascript
const experiments = [
    {
        experiment: { name: 'API Experiment 1' },
        stage2: { num_cycles: 5 },
        stage1step1: { temperature: '25.0', hold_time: 5, collect_data: true },
        stage2step1: { temperature: '27.0', hold_time: 1, collect_data: true },
        stage2step2: { temperature: '27.0', name: 'Pause', pause: true, collect_data: false },
