'use strict'
var binding = require('./newplus.node'),
    current_timestamp = binding.current_timestamp,
    plusone = binding.plusone,
    plusone_scoped = binding.plusone_scoped;

function run(count) {
    var start = current_timestamp();
    var x = 0;
    while (x < count) {
        x = plusone(x);
    }
    
    console.log(current_timestamp() - start);
}

function run_scoped(count) {
    var start = current_timestamp();
    var x = 0;
    while (x < count) {
        x = plusone_scoped(x);
    }
    
    console.log(current_timestamp() - start);
}

function start() {
    var args = process.argv;
    if (args.length === 2) {
        console.log("First arg (0 - 2000000000) is required.");
        return;
    }

    var count = parseInt(args[2], 10);
    if (count <= 0 || count > 2000000000) {
        print("Must be a positive number not exceeding 2 billion.");
        return;
    }

    if (args.length === 4 && args[3] === 'scoped') {
        plusone_scoped(current_timestamp() === 0 ? 1 : 2);
        run_scoped(count);
    } else {
        plusone(current_timestamp() === 0 ? 1 : 2);
        run(count);
    }
}

start();
