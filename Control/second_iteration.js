    const STD_PARAMS = 500;
    const auth = {};
    const experiments = [
    {
        experiment: {
            name: 'API Experiment 1',
        },
        stage2: {
            num_cycles: 5,
        },
        stage1step1: {
            temperature: '25.0',
            hold_time: 5,
            collect_data: true,
        },
        stage2step1: {
            temperature: '27.0',
            hold_time: 1,
            collect_data: true,
        },
        stage2step2: {
            temperature: '27.0',
            name: 'Pause',
            pause: true,
            collect_data: false,
        },
    },
    {
        experiment: {
            name: 'API Experiment 2',
        },
        stage2: {
            num_cycles: 5,
        },
        stage1step1: {
            temperature: '30.0',
            hold_time: 2,
            collect_data: true,
        },
        stage2step1: {
            temperature: '32.0',
            hold_time: 2,
            collect_data: true,
        },
        stage2step2: {
            temperature: '32.0',
            name: 'Pause',
            pause: true,
            collect_data: false,
        },
    },];

    const experiments_higher = [
        {
            experiment: {
                name: 'API Experiment 1_higher',
            },
            stage2: {
                num_cycles: 5,
            },
            stage1step1: {
                temperature: '45.0',
                hold_time: 5,
                collect_data: true,
            },
            stage2step1: {
                temperature: '47.0',
                hold_time: 1,
                collect_data: true,
            },
            stage2step2: {
                temperature: '47.0',
                name: 'Pause',
                pause: true,
                collect_data: false,
            },
        },
        {
            experiment: {
                name: 'API Experiment 2',
            },
            stage2: {
                num_cycles: 5,
            },
            stage1step1: {
                temperature: '55.0',
                hold_time: 2,
                collect_data: true,
            },
            stage2step1: {
                temperature: '57.0',
                hold_time: 2,
                collect_data: true,
            },
            stage2step2: {
                temperature: '57.0',
                name: 'Pause',
                pause: true,
                collect_data: false,
            },
    },];
    /**
    * Initialise Authentication
    */
    const initAuth = async () => {
        try {
            const authResponse = await fetch('http://192.168.7.2/users/current');
            const authJsonData = await authResponse.json();
            console.log('Authentication Token',
            authJsonData.user.authentication_token.toString());
            // Save the authentication token to variable
            const authToken = 'Bearer ' + authJsonData.user.authentication_token.toString();
            // Set authentication get headers
            const headers = new Headers();
            headers.append('Authorization', authToken);
            headers.append('Content-Type', 'application/json');
            // Cache auth
            auth.headers = headers;
            auth.token = authToken;
            return true;
        }
        catch (error) {
            console.log(error);
            return false;
        }
    };
    const createNewExperiment = async (index, experiments) => {
        try {
            // Create an experiment using the default protocol
            const requestNewExp = await fetch('http://192.168.7.2/experiments', {
                method: 'POST',
                headers: auth.headers,
                body: JSON.stringify({
                    experiment: {
                        name: experiments[index].experiment.name,
                    },
                }),
                redirect: 'follow',
            });
            const createdExp = await requestNewExp.json();
            // Print the created experiment
            console.log('createdExp', createdExp);
            
            // Update Stage 2
            const requestStage2CycleNumChange = await fetch(`http://192.168.7.2/stages/${createdExp.experiment.protocol.stages[1].stage.id.toString()}`, {
                method: 'PUT',
                headers: auth.headers,
                body: JSON.stringify({
                    stage: experiments[index].stage2,
                }),
                redirect: 'follow',
            });
            const responseStage2CycleNumChange = await requestStage2CycleNumChange.json();
            // Print the updated stage
            console.log('responseStage2CycleNumChange', responseStage2CycleNumChange);
            
            // Update Stage 1 Step 1
            const requestUpdateStage1Step1 = await fetch(`http://192.168.7.2/steps/${createdExp.experiment.protocol.stages[0].stage.steps[0].step.id.toString()}`, {
                method: 'PUT',
                headers: auth.headers,
                body: JSON.stringify({
                    step: experiments[index].stage1step1,
                }),
                redirect: 'follow',
            });
            const updatedStage1Step1 = await requestUpdateStage1Step1.json();
            // Print the updated step
            console.log('updatedStage1Step1', updatedStage1Step1);
            
            // Update Stage 2 Step 1
            const requestCollectDataStep = await fetch(`http://192.168.7.2/steps/${createdExp.experiment.protocol.stages[1].stage.steps[0].step.id.toString()}`, {
                method: 'PUT',
                headers: auth.headers,
                body: JSON.stringify({
                    step: experiments[index].stage2step1,
                }),
                redirect: 'follow',
            });
            const updatedCollectDataStep = await requestCollectDataStep.json();
            // Print the updated step
            console.log('updatedCollectDataStep', updatedCollectDataStep);
            
            // Delete default Stage 2 Step 2
            const deleteStage2Step2 = await fetch(`http://192.168.7.2/steps/${createdExp.experiment.protocol.stages[1].stage.steps[1].step.id.toString()}`, {
                method: 'DELETE',
                headers: auth.headers,
                body: '',
                redirect: 'follow',
            });
            const deletedResponse = await deleteStage2Step2.json();
            // Print the created experiment
            console.log('deletedResponse', deletedResponse);
            
            // Create new Stage 2 Step 2
            const requestNewStep = await fetch(`http://192.168.7.2/stages/${createdExp.experiment.protocol.stages[1].stage.id.toString()}/steps`, {
                method: 'POST',
                headers: auth.headers,
                body: JSON.stringify({
                    prev_id: createdExp.experiment.protocol.stages[1].stage.steps[0].step.id,
                    step: experiments[index].stage2step2,
                }),
                redirect: 'follow',
            });
            const createdStep = await requestNewStep.json();
            // Print the created step
            console.log('createdStep', createdStep);
            
            return createdExp;
        } catch (error) {
            console.log(error);
            return false;
        }
    };

    /**
    * START an experiment
    */
    const startExperiment = async exp => {
        try {
            const requestStart = await fetch('http://192.168.7.2/device/start',
            {
                method: 'POST',
                headers: auth.headers,
                body: JSON.stringify({
                    experiment_id: exp.experiment.id,
                }),
                redirect: 'follow',
            });
            const responseJsonStart = await requestStart.json();
            // Print experiment start response
            console.log('responseJsonStart', responseJsonStart);
            return true;
        } 
        catch (error) {
            console.log(error);
            return false;
        }
    };
    /**
    * RESUME the experiment
    */
    const resumeExperiment = async exp => {
        try {
            const requestResume = await
            fetch('http://192.168.7.2/device/resume', {
                method: 'POST',
                headers: auth.headers,
                body: JSON.stringify({
                    experiment_id: exp.experiment.id,
                }),
                redirect: 'follow',
            });
            const responseJsonResume = await requestResume.json();
            // Print experiment resume response
            console.log('responseJsonResume', responseJsonResume);
            return true;
        } 
        catch (error) {
            console.log(error);
            return false;
        }
    };
    /**
    * STOP the experiment
    */
    const stopExperiment = async exp => {
        try {
            const requestStop = await fetch('http://192.168.7.2/device/stop', {
                method: 'POST',
                headers: auth.headers,
                body: JSON.stringify({
                    experiment_id: exp.experiment.id,
                }),
                redirect: 'follow',
            });
            const responseJsonStop = await requestStop.json();
            // Print experiment stop response
            console.log('responseJsonStop', responseJsonStop);
            return true;
        } 
        catch (error) {
            console.log(error);
            return false;
        }
    };
    /**
    * Retrieve amplification data of an experiment when available
    */
    const getAmplificationData = async exp => {
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
                    headers: auth.headers,
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
    /**
    * Main
    */
    (async () => {
        try {
        // Initialise Authentication
            if (!(await initAuth())) {
                throw new Error('Authentication Error');
            }
            // Loop through predefined experiments
            for (let i = 0; i < experiments.length; i++) {
                // Create new experiment
                const exp = await createNewExperiment(i, experiments);
                // Start the experiment
                await startExperiment(exp);
                // Get amplification data
                const ampData = await getAmplificationData(exp);
                // Print the amplification data response
                console.log('ampData', ampData);
                let ampDataColumnIndex = 4;
                // Print the column header
                console.log('ampData Column Header',
                ampData[0][ampDataColumnIndex]);
                // Saving the first row value
                console.log('ampData Column Value',
                ampData[1][ampDataColumnIndex]);
                console.log('Condition', ampData[1][ampDataColumnIndex] < STD_PARAMS);
                // Test condition
                const condition1 = ampData[1][ampDataColumnIndex] < STD_PARAMS;
                if (condition1) {
                    exp = await createNewExperiment(i, experiments_higher);
                    await startExperiment(exp);
                    ampData = await getAmplificationData(exp);
                    console.log('ampData', ampData);
                    let ampDataColumnIndex = 4;
                    console.log('ampData Column Header',ampData[0][ampDataColumnIndex]);
                    console.log('ampData Column Value',
                    ampData[1][ampDataColumnIndex]);
                    console.log('Condition', ampData[1][ampDataColumnIndex] < STD_PARAMS);
                    const condition2 = ampData[1][ampDataColumnIndex] < STD_PARAMS;
                    if (condition2) {
                        // RESUME the experiment
                        await resumeExperiment(exp);
                        break;
                    }
                    else {
                        // STOP the experiment
                        await stopExperiment(exp);
                    }
                }
                else {
                    await startExperiment(exp);
                    ampData = await getAmplificationData(exp);
                    console.log('ampData', ampData);
                    let ampDataColumnIndex = 4;
                    console.log('ampData Column Header',ampData[0][ampDataColumnIndex]);
                    console.log('ampData Column Value',
                    ampData[1][ampDataColumnIndex]);
                    console.log('Condition', ampData[1][ampDataColumnIndex] < STD_PARAMS);
                    const condition2 = ampData[1][ampDataColumnIndex] < STD_PARAMS;
                    if (condition2) {
                        // RESUME the experiment
                        await resumeExperiment(exp);
                        break;
                    }
                    else {
                        // STOP the experiment
                        await stopExperiment(exp);
                    }
                }
            }
        }
        catch (error) {
            console.log(error);
        }
    })();