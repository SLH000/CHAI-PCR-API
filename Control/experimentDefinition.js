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
    },
];

// performance
// const experiments = [
//     {
//         experiment: {
//             name: 'API Experiment 1',
//         },
//         stage2: {
//             num_cycles: 5,
//         },
//         stage1step1: {
//             temperature: '30.0',
//             hold_time: 5,
//             collect_data: true,
//         },
//         stage2step1: {
//             temperature: '32.0',
//             hold_time: 1,
//             collect_data: true,
//         },
//         stage2step2: {
//             temperature: '32.0',
//             name: 'Pause',
//             pause: true,
//             collect_data: false,
//         },
//     },
//     {
//         experiment: {
//             name: 'API Experiment 2',
//         },
//         stage2: {
//             num_cycles: 5,
//         },
//         stage1step1: {
//             temperature: '50.0',
//             hold_time: 2,
//             collect_data: true,
//         },
//         stage2step1: {
//             temperature: '52.0',
//             hold_time: 2,
//             collect_data: true,
//         },
//         stage2step2: {
//             temperature: '52.0',
//             name: 'Pause',
//             pause: false,
//             collect_data: true,
//         },
//     },
//     {
//         experiment: {
//             name: 'API Experiment 3',
//         },
//         stage2: {
//             num_cycles: 5,
//         },
//         stage1step1: {
//             temperature: '70.0',
//             hold_time: 2,
//             collect_data: true,
//         },
//         stage2step1: {
//             temperature: '72.0',
//             hold_time: 2,
//             collect_data: true,
//         },
//         stage2step2: {
//             temperature: '72.0',
//             name: 'Pause',
//             pause: false,
//             collect_data: true,
//         },
//     },
//     {
//         experiment: {
//             name: 'API Experiment 4',
//         },
//         stage2: {
//             num_cycles: 5,
//         },
//         stage1step1: {
//             temperature: '90.0',
//             hold_time: 2,
//             collect_data: true,
//         },
//         stage2step1: {
//             temperature: '92.0',
//             hold_time: 2,
//             collect_data: true,
//         },
//         stage2step2: {
//             temperature: '92.0',
//             name: 'Pause',
//             pause: false,
//             collect_data: true,
//         },
//     },
// ];

export { experiments };

