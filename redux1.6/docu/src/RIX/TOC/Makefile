#---------------------------------------------------------------------
# Declations
#---------------------------------------------------------------------

# Paths

RDIR = /home/buendgen/ReDuX
SDIR = src                  # link to $(RDIR)/src

ACDIR = $(SDIR)/ac
ACNDIR = $(SDIR)/acn
AXDIR = $(SDIR)/ax
CODIR = $(SDIR)/co
EVDIR = $(SDIR)/ev
EDDIR = $(EVDIR)/ED
ICDIR = $(SDIR)/ic
INIDIR = $(SDIR)/ini
IODIR = $(SDIR)/io
IODIT = $(SDIR)/it
RDDIR = $(SDIR)/rd
TCDIR = $(SDIR)/tc
TIODIR = $(SDIR)/tio
TODIR = $(SDIR)/to
TPDIR = $(SDIR)/tp
UCDIR = $(SDIR)/uc



#====================================================================
# Targets
#====================================================================

#--------------------------------------------------------------------
#       Suffix rules
#--------------------------------------------------------------------

.SUFFIXES: .toc1 .toc

.toc1.toc:
	sed -f t2t.sed $< > $@

#--------------------------------------------------------------------
#       Make everything from scratch
#--------------------------------------------------------------------

new:
	rm -f  *.toc1
	make all

#--------------------------------------------------------------------
# make new LaTeX-TOC-files
#-------------------------------------------------------------------- 

ac.toc1: $(SDIR)/ac/TOC
	cp $? $@
acn.toc1: $(SDIR)/acn/TOC
	cp $? $@
ax.toc1: $(SDIR)/ax/TOC
	cp $? $@
co.toc1: $(SDIR)/co/TOC
	cp $? $@
ed.toc1: $(SDIR)/ev/ED/TOC
	cp $? $@
ev.toc1: $(SDIR)/ev/TOC
	cp $? $@
ic.toc1: $(SDIR)/ic/TOC
	cp $? $@
ini.toc1: $(SDIR)/ini/TOC
	cp $? $@
it.toc1: $(SDIR)/it/TOC
	cp $? $@
rd.toc1: $(SDIR)/rd/TOC
	cp $? $@
tc.toc1: $(SDIR)/tc/TOC
	cp $? $@
tio.toc1: $(SDIR)/tio/TOC
	cp $? $@
to.toc1: $(SDIR)/to/TOC
	cp $? $@
tp.toc1: $(SDIR)/tp/TOC
	cp $? $@
uc.toc1: $(SDIR)/uc/TOC
	cp $? $@
all:
	make ac.toc acn.toc ax.toc co.toc ed.toc ev.toc ic.toc ini.toc it.toc rd.toc tc.toc tio.toc to.toc tp.toc uc.toc

