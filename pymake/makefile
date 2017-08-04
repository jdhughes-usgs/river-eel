# makefile created on 2017-06-22 17:27:04.973222
# by pymake (version 1.1.0)
# using the gfortran fortran and gcc c/c++ compilers.

# Define the directories for the object and module files,
# the executable, and the executable name and path.
OBJDIR = ./obj_temp
BINDIR = .
PROGRAM = mf6

SOURCEDIR1=../src
SOURCEDIR2=../src/Exchange
SOURCEDIR3=../src/Model
SOURCEDIR4=../src/Model/Geometry
SOURCEDIR5=../src/Model/GroundWaterFlow
SOURCEDIR6=../src/Model/ModelUtilities
SOURCEDIR7=../src/Solution
SOURCEDIR8=../src/Solution/SparseMatrixSolver
SOURCEDIR9=../src/Timing
SOURCEDIR10=../src/Utilities
SOURCEDIR11=../src/Utilities/Memory
SOURCEDIR12=../src/Utilities/Observation
SOURCEDIR13=../src/Utilities/OutputControl
SOURCEDIR14=../src/Utilities/TimeSeries

VPATH = \
${SOURCEDIR1} \
${SOURCEDIR2} \
${SOURCEDIR3} \
${SOURCEDIR4} \
${SOURCEDIR5} \
${SOURCEDIR6} \
${SOURCEDIR7} \
${SOURCEDIR8} \
${SOURCEDIR9} \
${SOURCEDIR10} \
${SOURCEDIR11} \
${SOURCEDIR12} \
${SOURCEDIR13} \
${SOURCEDIR14} 

.SUFFIXES: .c .cpp .f .f90 .F90 .fpp .o

# Define the Fortran compile flags
FC = gfortran
FFLAGS = -O2 -fbacktrace -ffpe-summary=overflow -ffpe-trap=overflow,zero,invalid 

# Define the C compile flags
CC = gcc
CFLAGS = -O3 -D_UF 

# Define the libraries
SYSLIBS = -lc 

OBJECTS = \
$(OBJDIR)/kind.o \
$(OBJDIR)/List.o \
$(OBJDIR)/Timer.o \
$(OBJDIR)/Xt3dAlgorithm.o \
$(OBJDIR)/BaseGeometry.o \
$(OBJDIR)/ims8reordering.o \
$(OBJDIR)/OpenSpec.o \
$(OBJDIR)/SimVariables.o \
$(OBJDIR)/Constants.o \
$(OBJDIR)/mf6lists.o \
$(OBJDIR)/StringList.o \
$(OBJDIR)/HashTable.o \
$(OBJDIR)/Sparse.o \
$(OBJDIR)/Memory.o \
$(OBJDIR)/TimeSeriesRecord.o \
$(OBJDIR)/ArrayHandlers.o \
$(OBJDIR)/ObsOutput.o \
$(OBJDIR)/SmoothingFunctions.o \
$(OBJDIR)/MemoryList.o \
$(OBJDIR)/Sim.o \
$(OBJDIR)/InputOutput.o \
$(OBJDIR)/ListReader.o \
$(OBJDIR)/RectangularChGeometry.o \
$(OBJDIR)/BlockParser.o \
$(OBJDIR)/RectangularGeometry.o \
$(OBJDIR)/CircularGeometry.o \
$(OBJDIR)/ArrayReaders2.o \
$(OBJDIR)/DisvGeom.o \
$(OBJDIR)/PrintSaveManager.o \
$(OBJDIR)/MemoryManager.o \
$(OBJDIR)/ObsOutputList.o \
$(OBJDIR)/Connections.o \
$(OBJDIR)/Iunit.o \
$(OBJDIR)/Budget.o \
$(OBJDIR)/Mover.o \
$(OBJDIR)/PackageMover.o \
$(OBJDIR)/TimeSeries.o \
$(OBJDIR)/BaseModel.o \
$(OBJDIR)/ims8linear.o \
$(OBJDIR)/NameFile.o \
$(OBJDIR)/BaseSolution.o \
$(OBJDIR)/tdis.o \
$(OBJDIR)/TimeSeriesGroupList.o \
$(OBJDIR)/SolutionGroup.o \
$(OBJDIR)/BaseExchange.o \
$(OBJDIR)/TimeSeriesLink.o \
$(OBJDIR)/BndUzfKinematic.o \
$(OBJDIR)/TimeSeriesManager.o \
$(OBJDIR)/DiscretizationBase.o \
$(OBJDIR)/NumericalPackage.o \
$(OBJDIR)/Observe.o \
$(OBJDIR)/gwf3ic8.o \
$(OBJDIR)/gwf3dis8.o \
$(OBJDIR)/TimeArray.o \
$(OBJDIR)/gwf3sto8.o \
$(OBJDIR)/gwf3disv8.o \
$(OBJDIR)/ObsUtility.o \
$(OBJDIR)/OutputControlData.o \
$(OBJDIR)/ObsContainer.o \
$(OBJDIR)/OutputControl.o \
$(OBJDIR)/Obs3.o \
$(OBJDIR)/TimeArraySeries.o \
$(OBJDIR)/gwf3disu8.o \
$(OBJDIR)/Xt3dInterface.o \
$(OBJDIR)/gwf3obs8.o \
$(OBJDIR)/gwf3mvr8.o \
$(OBJDIR)/gwf3npf8.o \
$(OBJDIR)/TimeArraySeriesLink.o \
$(OBJDIR)/gwf3oc8.o \
$(OBJDIR)/gwf3hfb8.o \
$(OBJDIR)/TimeArraySeriesManager.o \
$(OBJDIR)/BoundaryPackage.o \
$(OBJDIR)/gwf3drn8.o \
$(OBJDIR)/NumericalModel.o \
$(OBJDIR)/GhostNode.o \
$(OBJDIR)/gwf3uzf8.o \
$(OBJDIR)/gwf3ghb8.o \
$(OBJDIR)/gwf3sfr8.o \
$(OBJDIR)/gwf3lak8.o \
$(OBJDIR)/gwf3wel8.o \
$(OBJDIR)/gwf3maw8.o \
$(OBJDIR)/gwf3chd8.o \
$(OBJDIR)/NumericalExchange.o \
$(OBJDIR)/gwf3rch8.o \
$(OBJDIR)/gwf3evt8.o \
$(OBJDIR)/NumericalSolution.o \
$(OBJDIR)/gwf3riv8.o \
$(OBJDIR)/gwf3.o \
$(OBJDIR)/GwfGwfExchange.o \
$(OBJDIR)/SimulationCreate.o \
$(OBJDIR)/mf6.o 

# Define task functions

# Create the bin directory and compile and link the program
all: makebin | $(PROGRAM)

# Make the bin directory for the executable
makebin :
	mkdir -p $(BINDIR)

# Define the objects that make up the program
$(PROGRAM) : $(OBJECTS)
	-$(FC) $(FFLAGS) -o $@ $(OBJECTS) $(SYSLIBS) -I$(OBJDIR) -J$(OBJDIR) 

$(OBJDIR)/%.o : %.f
	@mkdir -p $(@D)
	$(FC) $(FFLAGS) -c $< -o $@ -I$(OBJDIR) -J$(OBJDIR) 

$(OBJDIR)/%.o : %.f90
	@mkdir -p $(@D)
	$(FC) $(FFLAGS) -c $< -o $@ -I$(OBJDIR) -J$(OBJDIR) 

$(OBJDIR)/%.o : %.F90
	@mkdir -p $(@D)
	$(FC) $(FFLAGS) -c $< -o $@ -I$(OBJDIR) -J$(OBJDIR) 

$(OBJDIR)/%.o : %.fpp
	@mkdir -p $(@D)
	$(FC) $(FFLAGS) -c $< -o $@ -I$(OBJDIR) -J$(OBJDIR) 

$(OBJDIR)/%.o : %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR)/%.o : %.cpp
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean the object and module files and the executable
.PHONY : clean
clean : 
	-rm -rf $(OBJDIR)
	-rm -rf $(PROGRAM)

# Clean the object and module files
.PHONY : cleanobj
cleanobj : 
	-rm -rf $(OBJDIR)

