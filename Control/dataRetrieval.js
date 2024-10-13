/**
* Retrieve amplification data of an experiment when available
*/
const getAmplificationData = async (exp, authHeaders) => {
    try {
        /**
        * Send a request for amplification data every second until
        * we get step results
        */
        while (true) {
            /**
            * Collect amplification data on experiment
            */
            const ampDataRequest = await
            fetch(`http://192.168.7.2/experiments/${exp.experiment.id.toString()}/amplification_data`, {
                method: 'GET',
                headers: authHeaders,
            });
            const ampDataJsonResponse = await ampDataRequest.json();
            // Log amplification data
            console.log('LOG: AMPDATA REQUEST');
            // Break out of the loop if the `steps` property in `ampDataJsonResponse` has value
            if (typeof ampDataJsonResponse.steps != 'undefined') {
                return ampDataJsonResponse.steps[0].amplification_data;
            }
        }
    }
    catch (error) {
        console.log(error);
        return false;
    }
};
export { getAmplificationData };