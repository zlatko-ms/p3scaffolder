#!/bin/bash

usage() {
    echo "usage : generate.sh -n projectname -o outputdir [-p packagename]"
    echo "params:"
    echo "  projectname : name of the project, will apply to generated directory and main script"
    echo "  outputdir   : location where the project gets generated"
    echo "  packagename : name of the internal lib package, will use projectname if not specified"
    exit 255
}

while getopts n:p:o: flag
do
    case "${flag}" in
        n) projectname=${OPTARG};;
        p) packagename=${OPTARG};;
        o) outputdir=${OPTARG};;
    esac
done

if [ -z "$projectname" ] ; then
    echo "[CRITICAL] : missing mandatory parmeter projectname"
    usage
fi

if [ -z "$outputdir" ] ; then
    outputdir="out"
fi

if [ -z "$packagename" ] ; then
    packagename=$projectname
fi

echo "[INFO] copying templates to $outputdir"
mkdir -p "$outputdir/$projectname"
cp -r template/* "$outputdir/$projectname/."
cp -r template/.github "$outputdir/$projectname/."

mv "$outputdir/$projectname/mypackage" "$outputdir/$projectname/$packagename"
mv "$outputdir/$projectname/test/unit/mypackage" "$outputdir/$projectname/test/unit/$packagename"
mv "$outputdir/$projectname/test/integ/mypackage" "$outputdir/$projectname/test/integ/$packagename"
find "$outputdir" -type f -name "*.py" | xargs  perl -pi -e "s/mypackage/$packagename/g" 
find "$outputdir" -type f -name "Makefile" | xargs  perl -pi -e "s/mypackage/$packagename/g" 
find "$outputdir" -type f -name "Makefile" | xargs  perl -pi -e "s/projectname/$projectname/g" 
find "$outputdir" -type f -name "*.md" | xargs  perl -pi -e "s/projectname/$projectname/g" 
#find "$outputdir" -type f -name "*.yaml" | xargs perl -pi -e "s/projecyname/$projectname/g"
echo "[INFO] project generated in $outputdir/$projectname"



