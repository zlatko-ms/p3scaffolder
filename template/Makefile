
NAME:= "projectname"
RELNUM := $(shell cat RELEASE.txt)
PACKAGENAME="$(NAME).rel.v$(RELNUM).tar.gz"
UATDIR:= "test/uat/features"
UTESTDIR:= "test/unit"
INTESTDIR:= "test/integ"
UNITTEST=test.unit.mypackage.test_calculator.TestCalculator.test_integer_addition

all: clean dependencies format unit-tests integ-tests uat
githubpipeline: pyformatcheck tests
format: tounix pyformat pyformatcheck
devtest: unit-tests integ-tests

dependencies:
	@echo "[>] ############################################"
	@echo "[>] installing python dependencies"
	@echo "[>] ############################################"
	@pip3 install -r requirements.txt

tounix:
	@echo "[>] ############################################"
	@echo "[>] converting files to unix format"
	@echo "[>] ############################################"
	@dos2unix *.py
	@dos2unix mypackage/*.py

pyformat:
	@echo "[>] ############################################"
	@echo "[>] formatting python source files"
	@echo "[>] ############################################"
	@python3 -m black mypackage/*.py
	@python3 -m black *.py 

pyformatcheck:
	@echo "[>] ############################################"
	@echo "[>] checking source syntax violations : "
	@echo "[>] ############################################"
	@python3 -m flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
	@echo "[>] ############################################"
	@echo "[>] checking source formatting violations : "
	@echo "[>] ############################################"
	@python3 -m flake8 . --count  --extend-ignore=F811,E266 --max-complexity=12 --statistics

clean:
	@echo "[>] ############################################"
	@echo "[>] cleaning release files"
	@echo "[>] ############################################"
	@rm -f "$(NAME).rel.*"
	@find . -type d -name "__pycache__" | xargs rm -rf

unit-tests:
	@echo "[>] ############################################"
	@echo "[>] running unit tests"
	@echo "[>] ############################################"
	@python3 -m nose2 -v -F  -s $(UTESTDIR) -t .

singletest:
	@echo "[>] ############################################"
	@echo "[>] running test $(UNITTEST)"
	@echo "[>] ############################################"
	@python3 -m nose2 -v $(UNITTEST) -s $(INTESTDIR) -t .

integ-tests:
	@echo "[>] ############################################"
	@echo "[>] running integ tests"
	@echo "[>] ############################################"
	@python3 -m nose2 -v -F  -s $(INTESTDIR) -t .

uat:
	@echo "[>] ############################################"
	@echo "[>] running uat from directory $(UATDIR)"
	@echo "[>] ############################################"
	@python3 -m behave $(UATDIR)

uat-output:
	@echo "[>] ############################################"
	@echo "[>] running uat from directory $(UATDIR)"
	@echo "[>] ############################################"
	@python3 -m behave $(UATDIR) --no-capture

release:
	@echo "[>] ############################################"
	@echo "[>] building release package"
	@echo "[>] ############################################"
	@rm -f $(PACKAGENAME)
	@tar cfz $(PACKAGENAME) mypackage/*.py *.py
	@echo "[>] archive $(PACKAGENAME) created"
	@echo "[>] ############################################"

