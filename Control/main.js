import { fetchAuth } from './auth.js';
import { STD_PARAMS} from './constant.js';
import { createExperiment, startExperiment, resumeExperiment, stopExperiment } from './experiment.js';
import { getAmplificationData } from './dataRetrieval.js';
import { experiments } from './experimentDefinitions.js';

(async () => {
    let doPrintTime = false;
    try {
        // Initialize authentication
        const authHeaders = await fetchAuth();
        if (!authHeaders) {
            throw new Error('Authentication failed');
        }

        // Loop through predefined experiments
        for (let i = 0; i < experiments.length; i++) {
            // Create new experiment
            const exp = await createExperiment(experiments[i], authHeaders);

            // Start the experiment
            await startExperiment(exp, authHeaders);

            // Get amplification data
            const ampData = await getAmplificationData(exp, authHeaders);

            // Print the amplification data response
            console.log('ampData', ampData);

            let ampDataColumnIndex = 4;

            // Print the column header
            console.log('ampData Column Header', ampData[0][ampDataColumnIndex]);

            // Saving the first row value
            console.log('ampData Column Value', ampData[1][ampDataColumnIndex]);
            console.log('Condition', ampData[1][ampDataColumnIndex] < STD_PARAMS);

            // Test condition
            const condition1 = ampData[1][ampDataColumnIndex] < STD_PARAMS;
            if (condition1) {
                // RESUME the experiment
                await resumeExperiment(exp, authHeaders);
                // Don't create any new experiments
                break;
            } else {
                // STOP the experiment
                await stopExperiment(exp, authHeaders);
                // After this, create a new experiment and start it
            }
        }
    } catch (error) {
        console.log(error);
    }
})();
