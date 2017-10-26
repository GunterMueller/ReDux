#---------------------------------------------------------------------
# Declarations
#---------------------------------------------------------------------

# Backend

# Backend options
#BEO =#           use dynamic linkage
#BEO = -static#   use static linkage
 BEO = -static
#^^^^^^^^^        The previous line was modified by the ReDuX 
#                 installation make file!

# Backend used for linking, use the same that was used for compiling!
 BE = gcc $(BEO)
#^^^^^^^^^        The previous line was modified by the ReDuX 
#                 installation make file!

# Paths

# Path of ReDuX System:
 RDX = /home/buendgen/ReDuX
#^^^^^^^^^        The previous line was modified by the ReDuX 
#                 installation make file!
# Path of SAC2 Libraries:
 ALDES =/usr/local/caldes3.7
#^^^^^^^^^^^^^    The previous line was modified by the ReDuX 
#                 installation make file!


CC        = $(BE)
CCFLAGS   = -O2
LEX       = flex
LEXFLAGS  =
YACC      = yacc
YACCFLAGS = -d

RXPATH 	  = $(RDX)

#---------------------------------------------------------------------
# no changes required after this line
#---------------------------------------------------------------------

INCDIR    = $(RXPATH)/src/include

DEMOPATH  = $(RXPATH)/demo
LIBPATH   = $(RXPATH)/lib

LEXSRC    = scan.l
YACCSRC   = parse.y
LIBSRC    = fxpras.ald check.ald extern.ald objparse.ald \
            parsax.ald symlist.ald semerr.ald dtax.ald query.ald \
            write.ald ambig.ald insert.ald type.ald pinit.ald
ALDSRC    = $(LIBSRC) main.ald tpbgn.ald

INCLUDES  = $(INCDIR)/globs.h $(INCDIR)/tp.h $(INCDIR)/parse.h

LEXLIB    = -ll
YACCLIB   =# -ly
DPQR      = dpqr-sun4
SACLIB    = -L$(ALDES)/lib -lsac2 -l$(DPQR) -llow
REDUXLIB  = -L$(LIBPATH) -lac -ltc -lto -lsacr -ltp2 -lint -lco -lax

RINCL     = $(RXPATH)/bin/rincl
ALD       = $(RXPATH)/bin/ald

PROGNAME  = $(DEMOPATH)/parse
LIBNAME   = $(LIBPATH)/libparse.a


OBJFILES  = $(ALDSRC:.ald=.o) scan.o parse.o
LIBFILES  = $(LIBSRC:.ald=.o) scan.o parse.o

all: $(PROGNAME) $(LIBNAME)
	rm -f *.c
	rm -f *.o
	rm -f y.tab.h

parser: $(PROGNAME)

lib: $(LIBNAME)

$(LIBNAME): $(LIBFILES)
	ar rv $(LIBNAME) $(LIBFILES)
	ranlib $(LIBNAME)

$(PROGNAME): $(OBJFILES)
	$(CC) -o $(PROGNAME) $(OBJFILES) $(REDUXLIB) $(SACLIB) $(YACCLIB) $(LEXLIB)

main.c: main.ald $(INCLUDES)
fxpras.c: fxpras.ald $(INCLUDES)
check.c: check.ald $(INCLUDES)
extern.c: extern.ald $(INCLUDES) $(INCDIR)/it.h
objparse.c: objparse.ald $(INCLUDES)
parsax.c: parsax.ald $(INCLUDES)
symlist.c: symlist.ald $(INCLUDES)
semerr.c: semerr.ald $(INCLUDES)
dtax.c: dtax.ald $(INCLUDES)
query.c: query.ald $(INCLUDES)
write.c: write.ald $(INCLUDES)
ambig.c: ambig.ald $(INCLUDES)
insert.c: insert.ald $(INCLUDES)
type.c: type.ald $(INCLUDES)
pinit.c: pinit.ald $(INCLUDES)
tpbgn.c: tpbgn.ald $(INCLUDES)

main.o: main.c 
fxpras.o: fxpras.c
extern.o: extern.c
check.o: check.c
objparse.o: objparse.c
parsax.o: parsax.c
symlist.o: symlist.c
semerr.o: semerr.c
dtax.o: dtax.c
query.o: query.c
write.o: write.c
ambig.o: ambig.c
insert.o: insert.c
type.o: type.c
pinit.o: pinit.c
tpbgn.o: tpbgn.c

scan.o: scan.c y.tab.h

parse.o: y.tab.c
	$(CC) -o parse.o $(CCFLAGS) -c y.tab.c

.SUFFIXES: .ald
.ald.c:
	rm -f $*.c
	$(RINCL) $*.ald
	$(ALD) -1 -S i_$*.ald
	mv i_$*.c $*.c
	rm -f i_$*.ald

.c.o:
	$(CC) $(CCFLAGS) -c $<


scan.c: $(LEXSRC)
	$(LEX) -t $(LEXFLAGS) $(LEXSRC) >$@
y.tab.c y.tab.h: $(YACCSRC)
	$(YACC) $(YACCFLAGS) $(YACCSRC)


clean:
	rm -f *~
	rm -f *.o
	rm -f *.c
	rm -f yacc*
	rm -f parse.tab*
	rm -f y.tab.*

archive:
	lha a ../Rpars.lha *.ald parse.y scan.l typ/*.typ makefile *.h inp1 *.typ file.4 manual

