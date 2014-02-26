CC = g++
MPICC = mpic++
CFLAGS = -Wall -ansi -pedantic -fopenmp -O0 -funroll-all-loops -g 
LDFLAGS = -lboost_program_options-mt -fopenmp -g
OBJECTS = Dataset.o Dumb.o Ensemble.o Model.o Misc.o RBM.o RBMOpenMP.o DBN.o RBM_P.o
EXEC = RunFrontend RunDumb RunRBM RunEnsemble Blending BlendingMajority Statistics RunDBN

all: $(EXEC)

RunFrontend: RunFrontend.o $(OBJECTS) 
	$(MPICC) -o $@ $^ $(LDFLAGS)

RunDumb: RunDumb.o $(OBJECTS)
	$(MPICC) -o $@ $^ $(LDFLAGS)

RunRBM: RunRBM.o $(OBJECTS)
	$(MPICC) -o $@ $^ $(LDFLAGS)

RunDBN: RunDBN.o $(OBJECTS)
	$(MPICC) -o $@ $^ $(LDFLAGS)

RunEnsemble: RunEnsemble.o $(OBJECTS)
	$(MPICC) -o $@ $^ $(LDFLAGS) 

Statistics: Statistics.o Dataset.o Misc.o
	$(MPICC) -o $@ $^ $(LDFLAGS) 

Blending: Blending.o Dataset.o Misc.o
	$(MPICC) -o $@ $^ $(LDFLAGS)

BlendingMajority: BlendingMajority.o Dataset.o Misc.o
	$(MPICC) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(MPICC) $(CFLAGS) -o $@ -c $<

.PHONY: clean edit rebuild

clean:
	rm -f *.o *~ $(EXEC)

edit:
	geany *.h *.cpp &

rebuild: clean all
