%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 1

% This MATLAB code does some simple
% searching using the new code

%Close all the windows
close all

%Find the length of the citylist
total_length = size(citylist,2);

%Set the number of iterations
array_size = 100;

%Create storage
A = zeros(1,array_size);
Anumcities = zeros(1,array_size);
Adist = zeros(1,array_size);
B = zeros(1,array_size);
Bnumcities = zeros(1,array_size);
Bdist = zeros(1,array_size);
C = zeros(1,array_size);
Cnumcities = zeros(1,array_size);
Cdist = zeros(1,array_size);
D = zeros(1,array_size);
Dnumcities = zeros(1,array_size);
Ddist = zeros(1,array_size);
GreedyCorrect = zeros(1,array_size);
     
%Loop a bunch of times
for looper = 1:array_size,

     'Iteration ='
     looper
     
     %Find two random cities
     index1 = (floor(rand * total_length)) + 1;
     index2 = (floor(rand * total_length)) + 1;

     citylist(index1)
     citylist(index2)
     
     %Create a random length
     big_length = floor(((rand) * 2000) + 500);
     big_length
     
     %Do all three searches
     'greedy'
     flops(0);
     mypath = [];
     mylength = [];
     [mypath,mylength] = search(citylist,citylist(index1),citylist(index2),big_length,'greedy');
     A(looper) = flops;
     Anumcities(looper) = size(mypath,2);
     Adist(looper) = mylength;
     'uniform-cost'
     flops(0);
     mypath = [];
     mylength = [];
     [mypath,mylength] = search(citylist,citylist(index1),citylist(index2),big_length,'uniform-cost');
     B(looper) = flops;
     Bnumcities(looper) = size(mypath,2);
     Bdist(looper) = mylength;
     'A*'
     flops(0);
     mypath = [];
     mylength = [];
     [mypath,mylength] = search(citylist,citylist(index1),citylist(index2),big_length,'A*');
     C(looper) = flops;
     Cnumcities(looper) = size(mypath,2);
     Cdist(looper) = mylength;
     'IDA*'
     flops(0);
     mypath = [];
     mylength = [];
     [mypath,mylength] = ida(citylist,citylist(index1),citylist(index2),big_length);
     D(looper) = flops;
     Dnumcities(looper) = size(mypath,2);
     Ddist(looper) = mylength;

     %See if the greedy algorithm was correct (compared to A*)
     GreedyCorrect(looper) = (Adist(looper) == Cdist(looper));

end

%Find the average number of flops
aveA = mean(A);
aveB = mean(B);
aveC = mean(C);
aveD = mean(D);

printit = [aveA aveB aveC aveD];
index = [1 2 3 4];

%Plot all the averages
figure(1)
stem(index, printit)
title('Average number of flops for 100 iterations of search')
xlabel('Search technique')
ylabel('Number of flops')

%Plot the number of flops vs. the number of cities
figure(2)
plot(Anumcities,A,'o')
title('Number of cities in the path for greedy vs. Number of flops')
xlabel('Number of cities')
ylabel('Number of flops')
figure(3)
plot(Bnumcities, B,'o')
title('Number of cities in the path for uniform-cost vs. Number of flops')
xlabel('Number of cities')
ylabel('Number of flops')
figure(4)
plot(Cnumcities, C,'o')
title('Number of cities in the path for A* vs. Number of flops')
xlabel('Number of cities')
ylabel('Number of flops')
figure(5)
plot(Dnumcities, D,'o')
title('Number of cities in the path for IDA* vs. Number of flops')
xlabel('Number of cities')
ylabel('Number of flops')

%Plot the number of flops vs. path length
figure(6)
plot(Adist, A,'o')
title('Path length for greedy vs. Number of flops')
xlabel('Path length')
ylabel('Number of flops')
figure(7)
plot(Bdist, B,'o')
title('Path length for uniform-cost vs. Number of flops')
xlabel('Path length')
ylabel('Number of flops')
figure(8)
plot(Cdist, C,'o')
title('Path length for A* vs. Number of flops')
xlabel('Path length')
ylabel('Number of flops')
figure(9)
plot(Ddist, D,'o')
title('Path length for IDA* vs. Number of flops')
xlabel('Path length')
ylabel('Number of flops')

%Plot how many times greedy is correct
figure(10)
plot(Cnumcities, GreedyCorrect,'o')
title('Number of cities vs. Correctness of the greedy algorthm')
xlabel('Number of cities')
ylabel('Correctness of greedy (1 = correct)')

figure(11)
plot(Cdist, GreedyCorrect,'o')
title('Path length vs. Correctness of the greedy algorthm')
xlabel('Path length')
ylabel('Correctness of greedy (1 = correct)')

mean(GreedyCorrect)
