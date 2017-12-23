%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 1

% This MATLAB code does some simple
% searching using the new code

%Close all the windows
close all

%Set the maximum length
max_length = 1000;

flops(0)
[A,B] = search(citylist,Denver,NewYork,max_length,'greedy');
myflops(1)=flops;
flops(0)
[A,B] = search(citylist,Denver,NewYork,max_length,'uniform-cost');
myflops(2)=flops;
flops(0)
[A,B] = search(citylist,Denver,NewYork,max_length,'A*');
myflops(3)=flops;
flops(0)
[A,B] = ida(citylist,Denver,NewYork,max_length);
myflops(4)=flops;
%[A,B] = search(citylist,Victoria,Tucson,max_length,'greedy');
%[A,B] = search(citylist,Victoria,Tucson,max_length,'uniform-cost');
%[A,B] = search(citylist,Victoria,Tucson,max_length,'A*');
%[A,B] = ida(citylist,Victoria,Tucson,max_length);
%[A,B] = search(citylist,Wausau,Tampa,max_length,'greedy');
%[A,B] = search(citylist,Wausau,Tampa,max_length,'uniform-cost');
%[A,B] = search(citylist,Wausau,Tampa,max_length,'A*');
%[A,B] = ida(citylist,Wausau,Tampa,max_length);
%[A,B] = search(citylist,Tampa,NewYork,max_length,'greedy');
%[A,B] = search(citylist,Tampa,NewYork,max_length,'uniform-cost');
%[A,B] = search(citylist,Tampa,NewYork,max_length,'A*');
%[A,B] = ida(citylist,Tampa,NewYork,max_length);

%[A,B] = ida(citylist,Victoria,Tampa,max_length);

printcities(max_length,A,citylist);
B
flops
