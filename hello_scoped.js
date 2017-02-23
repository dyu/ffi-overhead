'use strict'
var binding = require('./newplus.node'),
    current_timestamp = binding.current_timestamp,
    plusone = binding.plusone_scoped;

function begin() {
    var start = current_timestamp();
    var x = 0;
    while (x < 2000000000) {
        x = plusone(x);
    }
    
    var end = current_timestamp();
    var elapsed = end - start;
    console.log(elapsed);
}

plusone(current_timestamp() === 0 ? 1 : 2);
begin();
