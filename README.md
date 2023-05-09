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

Note that the UnitTests are implemented using noose2, the uat using behave and the formatting is enforced with black.

# usage

Start by cloning the repo then launch the generate.sh script that accepts the following parameters : 

| Param        | cmd line param     | Description |
|--------------|-----------|------------|
| projectname | -n      | name of the project, mandatory       |
| outputdir   | -o  | output dir where the project structure will be created, defaults to ./out       |
| packagename   | -p  | name of the internal module package, defaults to projectname |

To generate the project named 'myproject', issue the following command line : 

```bash
./generate.sh -n myproject
```

To generate the project named 'myproject', with a root package name 'myrootpackage', issue the following command line : 

```bash
./generate.sh -n myproject -p myrootpackage
```

To generate the project named 'myproject' under the /tmp/mydir directory, issue the following command line : 

```bash
./generate.sh -n myproject -o /tmp/mydir
```

Then cd to the output dir and issue the following command to ensure the generation process went fine : 

```bash
cd <outputDir>/myproject
make all
```

Other parameters for generating the projects are the following : 



# generated project

The project is pretty standard, it uses noose2 for unit testing, behave for uat and a Makefile for local operations.

The .github directory of the generated project contains minimal workflows for dependabot and dev building the application.

Also note the RELEASE.txt file that contains the version of the project. It is used by both Makefile and github workflows to generate a tarball package.

# code formatting tests

The Makefile will check the format of your source code and will throw an error if it is not aligned to the formatting policy.

In order to make sure your code is correctly formatted before triggering any make targets, install and use the Black plugin in your IDE.

For VSCode you can ue the Back Formatter extension ( https://marketplace.visualstudio.com/items?itemName=ms-python.black-formatter )

# next steps 

* add docker image building github workflow






