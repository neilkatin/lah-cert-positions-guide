# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXAUTO    = --port 5002
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = LAHCFDCERTPositionsGuide
SOURCEDIR     = source
BUILDDIR      = build

.DEFAULT_GOAL := html

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile autobuild

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

autobuild:
	sphinx-autobuild -b html $(SPHINXAUTO) --ignore "*.swp" "$(SOURCEDIR)" "$(BUILDDIR)"

remake_requirements:
	pipenv lock -r > requirements.txt
