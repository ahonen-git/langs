FC=gfortran
ffiles=$(wildcard *.f90)
sfiles=$(ffiles:.f=.o)

fflags=`nc-config --fflags`
flibs=`nc-config --flibs`

all: $(sfiles)
	$(FC) $(flibs) $(fflags) $(sfiles) 
	./a.out

clean:
	rm -rf *.nc

.SUFFIXES: .o .f90
.f90.o:
	$(FC) -c $<

