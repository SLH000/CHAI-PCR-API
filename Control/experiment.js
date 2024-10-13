/**
* Create a new experiment
*/
const createExperiment = async (experiment, authHeaders) => {
    try {
        /**
        * Create an experiment using the default protocol
        */
        const requestNewExp = await fetch('http://192.168.7.2/experiments', {
            method: 'POST',
            headers: authHeaders,
            body: JSON.stringify({
                experiment: {
                    name: experiment.experiment.name,
                },
            }),
            redirect: 'follow',
        });
        const createdExp = await requestNewExp.json();
        // Print the created experiment
        console.log('createdExp', createdExp);
        /**
        * Update Stage 2
        */
        const requestStage2CycleNumChange = await fetch(`http://192.168.7.2/stages/${createdExp.experiment.protocol.stages[1].stage.id.toString()}`, {
            method: 'PUT',
            headers: authHeaders,
            body: JSON.stringify({
                stage: experiment.stage2,
            }),
            redirect: 'follow',
        });
        const responseStage2CycleNumChange = await requestStage2CycleNumChange.json();
        // Print the updated stage
        console.log('responseStage2CycleNumChange',
        responseStage2CycleNumChange);
        /**
        * Update Stage 1 Step 1
        */
        const requestUpdateStage1Step1 = await fetch(`http://192.168.7.2/steps/${createdExp.experiment.protocol.stages[0].stage.steps[0].step.id.toString()}`, {
            method: 'PUT',
            headers: authHeaders,
            body: JSON.stringify({
                step: experiment.stage1step1,
            }),
            redirect: 'follow',
        });
        const updatedStage1Step1 = await requestUpdateStage1Step1.json();
        // Print the updated step
        console.log('updatedStage1Step1', updatedStage1Step1);
        /**
        * Update Stage 2 Step 1
        */
        const requestCollectDataStep = await fetch(`http://192.168.7.2/steps/${createdExp.experiment.protocol.stages[1].stage.steps[0].step.id.toString()}`, {
            method: 'PUT',
            headers: authHeaders,
            body: JSON.stringify({
                step: experiment.stage2step1,
            }),
            redirect: 'follow',
        });
        const updatedCollectDataStep = await requestCollectDataStep.json();
        // Print the updated step
        console.log('updatedCollectDataStep', updatedCollectDataStep);
        /**
        * Delete default Stage 2 Step 2
        */
        const deleteStage2Step2 = await fetch(`http://192.168.7.2/steps/${createdExp.experiment.protocol.stages[1].stage.steps[1].step.id.toString()}`, {
            method: 'DELETE',
            headers: authHeaders,
            body: '',
            redirect: 'follow',
        });
        const deletedResponse = await deleteStage2Step2.json();
        // Print the created experiment
        console.log('deletedResponse', deletedResponse);
        /**
        * Create new Stage 2 Step 2
        */
        const requestNewStep = await fetch(`http://192.168.7.2/stages/${createdExp.experiment.protocol.stages[1].stage.id.toString()}/steps`, {
            method: 'POST',
            headers: authHeaders,
            body: JSON.stringify({
                prev_id: createdExp.experiment.protocol.stages[1].stage.steps[0].step.id,
                step: experiment.stage2step2,
            }),
            redirect: 'follow',
        });
        const createdStep = await requestNewStep.json();
        // Print the created step
        console.log('createdStep', createdStep);
        return createdExp;
    } 
    catch (error) {
        console.log(error);
        return false;
    }
};
/**
* START an experiment
*/
const startExperiment = async (exp, authHeaders) => {
    try {
        const requestStart = await fetch('http://192.168.7.2/device/start', {
            method: 'POST',
            headers: authHeaders,
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
const resumeExperiment = async (exp, authHeaders) => {
    try {
        const requestResume = await fetch('http://192.168.7.2/device/resume', {
            method: 'POST',
            headers: authHeaders,
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
const stopExperiment = async (exp, authHeaders) => {
    try {
        const requestStop = await fetch('http://192.168.7.2/device/stop', {
            method: 'POST',
            headers: authHeaders,
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
export { createExperiment, startExperiment, resumeExperiment, stopExperiment }; 