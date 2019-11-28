# CCA Logging
Easy python logging module

## Usage
Import this module, set logging output, optionally set logging level,
set a script level variable pointing to this modules `log` variable,
then issue log.debug() etc.

You only need to set the output destination and logging level once, so
if you have multiple files in your project, set the output destination
and the logging level in the first one.  In all the others just point a
script level variable to `ccalogging.log`.

```
# first (or only) project file

import ccalogging

ccalogging.setConsoleOut()
ccalogging.setDebug()
log = ccalogging.log

log.info("Logging has been started")
```

```
# subsequent project files

import ccalogging

log = ccalogging.log

log.debug("continuing to log to the same location as setup in the first file")
```

## Options
It is possible to log to the console and/or to a file. When logging to the
console logs go to `stderr` by default.

### setDebug()
Sets the global loglevel to be logging.DEBUG

### setInfo()
Sets the global loglevel to be logging.INFO

### setWarn()
Sets the global loglevel to be logging.WARNING

### setError()
Sets the global loglevel to be logging.ERROR

### setLogFile(fqfn)
Sends log output to a file

  parameters:

  `fqfn`: the fully qualified path name of the log file

  `fformat`: message format - defaults to: `"%(asctime)s [%(levelname)-5.5s]  %(message)s"`

  `datefmt`: date format - defaults to: `"%d/%m/%Y %H:%M:%S"`

### setConsoleOut()
Sends log output to the console

  parameters:

  `STDOUT`: if `True` send to `stdout` - defaults to False (`stderr`)

  `cformat`: message format - defaults to: `"%(asctime)s [%(levelname)-5.5s]  %(message)s"`

  `datefmt`: date format - defaults to: `"%d/%m/%Y %H:%M:%S"`
