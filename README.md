# pytemplate

Simple python3 project template generator/scaffolder to fasttrack the project initation.

# provides

This project creates a basic python3 project structure and covers the following sofrware engineering needs : 

* internal modules structure
* unit testing structure 
* acceptance testing structure
* formatting/linting
* github workflows for building, packaging and testing
* Makefile for local tasks including the targets for formatting, testing , acceptance and tarball packaging

Note that the UnitTests are implemented using noose2, the uat using behave.

# usage

Clone the repo then start the ./generate.sh script and provide at least the name of the project to generate using -n param.

For instace for a project named myproject, issue the following : 

```bash
./generate.sh -n myproject
```

Then cd to ./out and issue Make all to check the substitutions are fine : 

```bash
cd out/myproject
make all
```

Other parameters for generating the projects are the following : 

| Param        | cmd line param     | Description |
|--------------|-----------|------------|
| projectname | -n      | name of the project        |
| outputdir   | -o  | output dir where the project structure will be created, defaults to ./out       |
| packagename   | -p  | name of the internal module package, defaults to projectname |

# generated project

The project is pretty standard, it uses noose2 for unit testing, behave for uat and a Makefile for local operations.

The .github directory of the generated project contains minimal workflows for dependabot and dev building the application.

Also note the RELEASE.txt file that contains the version of the project. It is used by both Makefile and github workflows to generate a tarball package.

# next steps 

* add docker image building github workflow






