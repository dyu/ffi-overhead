#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "include/dart_api.h"
#include "include/dart_native_api.h"

extern "C" {
#include "newplus/plus.h"
}

Dart_NativeFunction ResolveName(Dart_Handle name, int argc, bool* auto_setup_scope);

DART_EXPORT Dart_Handle newplus_extension_Init(Dart_Handle parent_library) {
  if (Dart_IsError(parent_library)) {
    return parent_library;
  }

  Dart_Handle result_code = Dart_SetNativeResolver(parent_library, ResolveName, NULL);
  
  if (Dart_IsError(result_code)) {
    return result_code;
  }

  return Dart_Null();
}


Dart_Handle HandleError(Dart_Handle handle) {
  if (Dart_IsError(handle)) {
    Dart_PropagateError(handle);
  }
  return handle;
}


void CurrentTimestamp(Dart_NativeArguments arguments) {
  Dart_EnterScope();
  Dart_SetReturnValue(arguments, HandleError(Dart_NewInteger(current_timestamp())));
  Dart_ExitScope();
}

void PlusOne(Dart_NativeArguments arguments) {
  int64_t x;
  Dart_EnterScope();
  Dart_GetNativeIntegerArgument(arguments, 0, &x);
  
  x = static_cast<int64_t>(plusone(static_cast<int>(x)));
  
  Dart_SetReturnValue(arguments, HandleError(Dart_NewInteger(x)));
  Dart_ExitScope();
}

void PlusOneDirect(Dart_NativeArguments arguments) {
  int64_t x;
  Dart_EnterScope();
  Dart_GetNativeIntegerArgument(arguments, 0, &x);
  
  Dart_SetReturnValue(arguments, HandleError(Dart_NewInteger(x + 1)));
  Dart_ExitScope();
}

struct FunctionLookup {
  const char* name;
  Dart_NativeFunction function;
};

FunctionLookup function_list[] = {
  {"CurrentTimestamp", CurrentTimestamp},
  {"PlusOne", PlusOne},
  {"PlusOneDirect", PlusOneDirect},
  {NULL, NULL}
};

FunctionLookup no_scope_function_list[] = {
  {"CurrentTimestampNoScope", CurrentTimestamp},
  {"PlusOneNoScope", PlusOne},
  {"PlusOneDirecteNoScope", PlusOneDirect},
  {NULL, NULL}
};

Dart_NativeFunction ResolveName(Dart_Handle name,
                                int argc,
                                bool* auto_setup_scope) {
  if (!Dart_IsString(name)) {
    return NULL;
  }
  
  Dart_NativeFunction result = NULL;
  if (auto_setup_scope == NULL) {
    return NULL;
  }

  Dart_EnterScope();
  const char* cname;
  HandleError(Dart_StringToCString(name, &cname));

  for (int i=0; function_list[i].name != NULL; ++i) {
    if (strcmp(function_list[i].name, cname) == 0) {
      *auto_setup_scope = true;
      result = function_list[i].function;
      break;
    }
  }

  if (result != NULL) {
    Dart_ExitScope();
    return result;
  }

  for (int i=0; no_scope_function_list[i].name != NULL; ++i) {
    if (strcmp(no_scope_function_list[i].name, cname) == 0) {
      *auto_setup_scope = false;
      result = no_scope_function_list[i].function;
      break;
    }
  }

  Dart_ExitScope();
  return result;
}
