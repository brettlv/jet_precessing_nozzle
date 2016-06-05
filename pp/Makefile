#=======================================================================
#
#
#  MAKEFILE FOR ZMP-PP (Seaborg)
#
#
#-------------------  macro definitions  -------------------------------
all: compile
ZMP_EXE    = ../exe90/
ZMP_FC     = mpif90
ZMP_MOD    = ../src90
ZMP_OPTS   = -c -g
#ZMP_OPTS   = -c -g -qflttrap=zero:inv:ov:en -qcheck -qwarn64
ZMP_CC     = mpicc
ZMP_LDR    = mpif90
MGMPI_LIB  = -L./

HDF_LIB    = ${HDF} ${MGMPI_LIB} \
             -L../hdflibs/64 -lmfhdf -ldf -ljpeg -lz 

ZMP_LIB    = ${HDF_LIB} ${MGMPI_LIB} 
ZMP_CPP    = /lib/cpp  -DUSRDMP
#--------------------  implicit rules  ---------------------------------
#
.SUFFIXES: .F .for .c .o

.for.o:
	${ZMP_CPP} -P -traditional $*.F | tr -s "" "\012" > $*.for
	${ZMP_FC} -I ${ZMP_MOD} ${ZMP_OPTS} $*.for
.F.o:
	${ZMP_CPP} -P -traditional $*.F | tr -s "" "\012" > $*.for
	${ZMP_FC} -I ${ZMP_MOD} ${ZMP_OPTS} $*.for

.c.o:
	${ZMP_CC} -c$<
#
#-------------------  Fortran object files  ----------------------------
#
FOBJ = zmp_pp.o h4splice.o auto_h4.o h5splice.o auto_h5.o mod_files.o
#
#-------------------  C object files  ----------------------------------
#
COBJ =
#
#---------------------  targets  ---------------------------------------
#
help:
	@echo Type "'make help'             to see this menu"
	@echo Type "'make compile'          to create executable"
	@echo Type "'make clean'            to remove '*.f' and '*.o' files"
	@echo "                             ${ZMP_EXE}zeus_pp2.x"        
#
#-----------------------------------------------------------------------
#
clean:
	echo "\rm -f *.o *.for *.mod"
	\rm -f *.o *.for *.mod
#
#-----------------------------------------------------------------------
#
compile: ${ZMP_EXE}zmp_pp.x

${ZMP_EXE}zmp_pp.x: ${FOBJ} ${COBJ}
	${ZMP_LDR} -o ${ZMP_EXE}zmp_pp.x ${FOBJ} ${COBJ} ${ZMP_LIB}

#
#----------------------  dependencies  ---------------------------------
#
zmp_pp.o: zmp_pp.F ../src90/mod_files.o

h4splice.o: h4splice.F ../src90/mod_files.o

h5splice.o: h5splice.F ../src90/mod_files.o

auto_h4.o: auto_h4.F ../src90/mod_files.o

auto_h5.o: auto_h5.F ../src90/mod_files.o
