clear
clc
tic;
planksSizes = importdata('maleplyty.txt');

popSize = 100;                          % number of chromosomes (cadinate solutions)
chromosomeSize = length(planksSizes);  % number of genes (variables)
amtOfGenerations = 350;                  % amt of Generations in the algorithm
Pc = 0.8;                               % Probability of cross-over
Pm = 0.4;                               % Probability of Mutation
Er = 0.03;                              % Amt of individuals(in %) from previous pop elite to be copied to the next pop
visualization = 0;                      % set to 0 if you do not want the convergence curve

[BestChrom]  = GeneticAlgorithm (popSize, chromosomeSize, amtOfGenerations, Pc, Pm, Er, planksSizes, visualization)

disp('The best chromosome found: ')
BestChrom.Gene
disp('The best fitness value: ')
BestChrom.Fitness

saveOutputData(BestChrom, 'output.txt', planksSizes);
toc;