clear
clc
tic;
planksSizes = importdata('maleplyty.txt');

popSize = 130;                          % number of chromosomes (cadinate solutions)
chromosomeSize = length(planksSizes);  % number of genes (variables)
amtOfGenerations = 300;                  % amt of Generations in the algorithm
Pc = 0.8;                               % Probability of cross-over
Pm = 0.4;                               % Probability of Mutation
Er = 0.03;                              % Amt of individuals(in %) from previous pop elite to be copied to the next pop
visualization = 0;                      % if set to 0 the final result gets printed only at the end of program execution and not through out the whole program life

[BestChrom]  = GeneticAlgorithm (popSize, chromosomeSize, amtOfGenerations, Pc, Pm, Er, planksSizes, visualization)

disp('The best chromosome found: ')
BestChrom.Gene
disp('The best fitness value: ')
BestChrom.Fitness

saveOutputData(BestChrom, 'output.txt', planksSizes);
toc;