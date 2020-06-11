# XReq - eXecutable Requirements

## Overview
[TODO]

## Installation
### Dependencies
- gnatpro (x86_64) 17.1+
- gnatpro (arm-eabi) 17.1+
- gps IDE 17.1+

### Build
You can run `make help` to see all the available targets.
The variables shown can be overriden with the make syntax:
```
make VAR=VALUE TARGET
```

Typical build is done by running:
```
make clean release
```

### Install
This will produce an archive file located in dist directory:
    **xreq-stable-vX.Y.Z-1234567.tar.gz**

Use this archive for intallation onto a different host.

To install it on the same host, you can cd into the `dist/xreq-stable-vX.Y.Z-1234567` directory and launch the `doinstall.sh` script


## User Guide
In this section, we assume that XREQ_INSTALL_DIR corresponds to the path where you installed XReq Tool (for example into /opt/xreq)

An example project titled "oranges" is installed into the XREQ_INSTALL_DIR/shared/examples directory.

It is composed of a tiny oranges library, and tests examples written in xreq format.

To build and execute this example, simply cd into the XREQ_INSTALL_DIR/shared/examples/oranges directory, and launch the commands:
```
make all
```

Then have a look at the output and the source code. The main directories to have a look into are:
```
impl
tests/features
tests/features/step_definitions
```

You may also pay attention on the Makefile and the .gpr project files to see how all is glued together.


## Development
You can find all relevant information into the [Developer's Guide](README_DEV.md)


## Known issues or limitations
[TBC]
* Build and install on linux box.
* In projects using xreq, set a primary stack size of around 20kb, here is an example on how to acheive that:
```
package Linker is
   for Default_Switches ("Ada") use (
      "-Wl,--print-memory-usage"
      -- Specify a custom primary stack size
      -- XReq test requires a minimum of 16k stack size to be able to
      -- execute it, especially on arm targets
      ,"-Wl,--defsym=__stack_size=20480"
    );
end Linker;
```
* Currently, C code generation is not yet functional in this version of XReq?
* Problem parsing step definitions:

   You should define the procedures on the step definition packages in one line.
   If you split the procedure on two lines, the procedure name will not be detected
properly.
   If you have a body part in your package, the step definition generation will put
the generated procedures in the body part of the package.

