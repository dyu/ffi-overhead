
library newplus_extension;

import 'dart-ext:newplus_extension';

// The simplest way to call native code: top-level functions.
int plusone(int x) native "PlusOne";
int plusone_noscope(int x) native "PlusOneNoScope";

int plusone_direct(int x) native "PlusOneDirect";
int plusone_direct_noscope(int x) native "PlusOneDirectNoScope";

int current_timestamp() native "CurrentTimestamp";
int current_timestamp_noscope() native "CurrentTimestampNoScope";
