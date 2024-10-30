# CHAI-PCR-API
# Experiment Management API

This project provides an API for managing biological experiments on a networked device. Key functionalities include creating experiments, configuring stages and steps, starting, resuming, and stopping experiments, and retrieving amplification data.

## Table of Contents
1. [Installation](#installation)
2. [Configuration](#configuration)
3. [Authentication](#authentication)
4. [Experiment Management](#experiment-management)
    - [Create Experiment](#create-experiment)
    - [Update Experiment Stages and Steps](#update-experiment-stages-and-steps)
    - [Start, Resume, Stop Experiment](#start-resume-stop-experiment)
5. [Amplification Data Retrieval](#amplification-data-retrieval)
6. [Usage Example](#usage-example)

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

Authentication

The fetchAuth function authenticates and retrieves an access token:

javascript
Copy code
const fetchAuth = async () => {
    try {
        const authResponse = await fetch('http://192.168.7.2/users/current');
        const authJsonData = await authResponse.json();
        const authToken = 'Bearer ' + authJsonData.user.authentication_token.toString();
        const headers = new Headers();
        headers.append('Authorization', authToken);
        headers.append('Content-Type', 'application/json');
        return { headers };
    } catch (error) {
        console.error("Authentication failed:", error);
        return null;
    }
};
export { fetchAuth };
Experiment Management

Create Experiment
Use createExperiment to initialize a new experiment with default settings:

javascript
Copy code
const createExperiment = async (experiment, authHeaders) => {
    try {
        const response = await fetch('http://192.168.7.2/experiments', {
            method: 'POST',
            headers: authHeaders,
            body: JSON.stringify({ experiment: { name: experiment.experiment.name } }),
            redirect: 'follow',
        });
        return await response.json();
    } catch (error) {
        console.error("Error creating experiment:", error);
        return null;
    }
};
export { createExperiment };
Update Experiment Stages and Steps
Modify specific stages and steps as per protocol requirements:
Update Stage 2: stage2
Update Stage 1 Step 1: stage1step1
Update Stage 2 Step 1: stage2step1
Delete and Create Step in Stage 2: stage2step2
Start, Resume, Stop Experiment
Control experiment state with:

startExperiment(exp, authHeaders)
resumeExperiment(exp, authHeaders)
stopExperiment(exp, authHeaders)
Each function initiates the respective action on the device via HTTP POST requests.

Amplification Data Retrieval

Retrieve and log amplification data during an experiment:

javascript
Copy code
const getAmplificationData = async (exp, authHeaders) => {
    try {
        while (true) {
            const response = await fetch(`http://192.168.7.2/experiments/${exp.experiment.id}/amplification_data`, {
                method: 'GET',
                headers: authHeaders,
            });
            const data = await response.json();
            if (data.steps) return data.steps[0].amplification_data;
        }
    } catch (error) {
        console.error("Error retrieving amplification data:", error);
        return null;
    }
};
export { getAmplificationData };
Usage Example

An example usage to authenticate, create an experiment, and handle its flow:

javascript
Copy code
import { fetchAuth } from './auth.js';
import { createExperiment, startExperiment, resumeExperiment, stopExperiment } from './experiment.js';
import { getAmplificationData } from './dataRetrieval.js';
import { experiments } from './experimentDefinitions.js';

(async () => {
    const authHeaders = await fetchAuth();
    if (!authHeaders) return;

    for (const experiment of experiments) {
        const exp = await createExperiment(experiment, authHeaders);
        await startExperiment(exp, authHeaders);
        const ampData = await getAmplificationData(exp, authHeaders);
        console.log("Amplification Data:", ampData);

        if (ampData && ampData[1][4] < STD_PARAMS) {
            await resumeExperiment(exp, authHeaders);
            break;
        } else {
            await stopExperiment(exp, authHeaders);
        }
    }
})();
    },
    // Additional experiments can be defined here
];
export { experiments };
