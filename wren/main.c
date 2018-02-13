#include <wren.h>
#include <newplus/plus.h>
#include <stdio.h>
#include <string.h>

static void wren_plusone(WrenVM* vm)
{
    wrenSetSlotDouble(vm, 0, wrenGetSlotDouble(vm, 1) + 1);
}

static long long ts_start;
static long long ts_stop;
static double count = 0;

static void wren_count(WrenVM* vm)
{
    wrenSetSlotDouble(vm, 0, count);
}

static void wren_start(WrenVM* vm)
{
    //printf("start\n");
    ts_start = current_timestamp();
}

static void wren_stop(WrenVM* vm)
{
    ts_stop = current_timestamp();
    //printf("stop\n");
}

static WrenForeignMethodFn bindForeignMethod( 
    WrenVM* vm, 
    const char* module, 
    const char* className, 
    bool isStatic, 
    const char* signature)
{
    //fprintf(stdout, "%s %s %s\n", module, className, signature);
    
    if (0 == strcmp(module, "main"))
    {
        if (0 == strcmp(className, "FFI"))
        {
            if (0 == strcmp(signature, "count()")) return wren_count;
            else if (0 == strcmp(signature, "start()")) return wren_start;
            else if (0 == strcmp(signature, "stop()")) return wren_stop;
            else return wren_plusone;
        }
    }
    return NULL;
}

/*
// Binds foreign methods declared in either built in modules, or the injected
// API test modules.
static WrenForeignMethodFn bindForeignMethod(WrenVM* vm, const char* module,
    const char* className, bool isStatic, const char* signature)
{
  WrenForeignMethodFn method = bindBuiltInForeignMethod(vm, module, className,
                                                        isStatic, signature);
  if (method != NULL) return method;
  
  if (bindMethodFn != NULL)
  {
    return bindMethodFn(vm, module, className, isStatic, signature);
  }

  return NULL;
}

// Binds foreign classes declared in either built in modules, or the injected
// API test modules.
static WrenForeignClassMethods bindForeignClass(
    WrenVM* vm, const char* module, const char* className)
{
  WrenForeignClassMethods methods = bindBuiltInForeignClass(vm, module,
                                                            className);
  if (methods.allocate != NULL) return methods;

  if (bindClassFn != NULL)
  {
    return bindClassFn(vm, module, className);
  }

  return methods;
}*/

static void write(WrenVM* vm, const char* text)
{
  printf("%s", text);
}

static void reportError(WrenVM* vm, WrenErrorType type,
                        const char* module, int line, const char* message)
{
  switch (type)
  {
    case WREN_ERROR_COMPILE:
      fprintf(stderr, "[%s line %d] %s\n", module, line, message);
      break;
      
    case WREN_ERROR_RUNTIME:
      fprintf(stderr, "%s\n", message);
      break;
      
    case WREN_ERROR_STACK_TRACE:
      fprintf(stderr, "[%s line %d] in %s\n", module, line, message);
      break;
  }
}

static char* readFile(const char* path)
{
  FILE* file = fopen(path, "rb");
  if (file == NULL) return NULL;
  
  // Find out how big the file is.
  fseek(file, 0L, SEEK_END);
  size_t fileSize = ftell(file);
  rewind(file);
  
  // Allocate a buffer for it.
  char* buffer = (char*)malloc(fileSize + 1);
  if (buffer == NULL)
  {
    fprintf(stderr, "Could not read file \"%s\".\n", path);
    exit(74);
  }
  
  // Read the entire file.
  size_t bytesRead = fread(buffer, sizeof(char), fileSize, file);
  if (bytesRead < fileSize)
  {
    fprintf(stderr, "Could not read file \"%s\".\n", path);
    exit(74);
  }
  
  // Terminate the string.
  buffer[bytesRead] = '\0';
  
  fclose(file);
  return buffer;
}

static const int DEFAULT_COUNT = 1000000;
static const char DEFAULT_SCRIPT[] = "hello.wren";

int main(int argc, char *argv[])
{
    const char* s = argc > 1 ? argv[1] : DEFAULT_SCRIPT;
    const int c = argc > 2 ? atoi(argv[2]) : DEFAULT_COUNT;
    
    count += c;
    
    char* script = readFile(s);
    if (script == NULL)
    {
        fprintf(stderr, "Could not locate %s\n", s);
        return 1;
    }
    
    WrenConfiguration config;
    wrenInitConfiguration(&config);

    config.bindForeignMethodFn = bindForeignMethod;
    //config.bindForeignClassFn = bindForeignClass;
    //config.loadModuleFn = readModule;
    config.writeFn = write;
    config.errorFn = reportError;

    // Since we're running in a standalone process, be generous with memory.
    config.initialHeapSize = 1024 * 1024 * 100;
    WrenVM* vm = wrenNewVM(&config);
    
    //fprintf(stdout, "Found hello.wren\n%s\n", script);
    
    WrenInterpretResult result = wrenInterpret(vm, script);
    if (result == WREN_RESULT_SUCCESS)
    {
        printf("%lld\n", ts_stop - ts_start);
    }
    else
    {
        fprintf(stderr, "Error executing hello.wren %d\n", result);
    }
        
    wrenFreeVM(vm);
    free(script);
    
    return result;
}
