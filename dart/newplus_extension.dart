
library newplus_extension;

import 'dart-ext:newplus_extension';

// The simplest way to call native code: top-level functions.
int plusone(int x) native "PlusOne";
int plusone_scoped(int x) native "PlusOneScoped";

int current_timestamp() native "CurrentTimestamp";
