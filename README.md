# Table of Contents
1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Downloading/Cloning](#downloadingcloning)
4. [Uploading/Restoring Source](#uploadingrestoring-source)
5. [Compiling and Running Examples](#compiling-and-running-examples)
6. [Repository Structure](#repository-structure)
7. [Conventions](#conventions)
8. [Troubleshooting Tips](#troubleshooting-tips)
9. [Disclaimer](#disclaimer)
10. [Licensing](#licensing)

## Introduction
This repository contains IBM i training examples intended for students. These examples cover various aspects of IBM i development, including CL, RPG, and COBOL.

## Prerequisites
- Access to an IBM i system
- IBM i Access Client Solutions
- Optional: Rational Developer for i (RDi)
- Ability to compile CL/RPG/COBOL where applicable

## Downloading/Cloning
To download or clone this repository, you can use the following command:
```bash
git clone https://github.com/FormaServe/tjmorris.git
```

## Uploading/Restoring Source
You can upload or restore source to your IBM i system using the following methods:
- **IBM i Access Client Solutions (ACS)**: Use the built-in file transfer features.
- **Git**: Clone the repository directly to your IBM i environment.
- **Copy into Source Physical Files or IFS**: Utilize file transfer mechanisms to place source files appropriately.

## Compiling and Running Examples
To compile and run the examples, follow the specific instructions included with each example in the repository. Generally, use the following commands:
```bash
// Example of compiling a CL program
CRTCLPGM PGM(MYLIB/MYCLPGM) SRCFILE(MYLIB/MYCLSRC) SRCMBR(MYCLMBR)
```

## Repository Structure
The repository structure is organized as follows:
```
/
├── src/       # Source files
├── bin/       # Compiled binaries
└── doc/       # Documentation 
```

## Conventions
- Follow naming conventions for source and object names based on IBM i standards.
- Comment your code clearly to enhance readability.

## Troubleshooting Tips
- Ensure you have the necessary permissions on the IBM i system.
- Check for system message logs if you encounter issues when compiling or running examples.

## Disclaimer
These examples are for educational purposes only and may require adaptation for production use.

## Licensing
Licensing for this repository is unspecified. Please contact the maintainers for more information.