%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 1

% This MATLAB code does a traveling salesman
% solution for the list of cities given in
% the "citylist" variable

%Create storage for the best path and best length
bestlength = 1000000;

%Loop a number of times
for looptimes = 1:100000

	%Create a random "path" and find the distance
	randpath = randperm(length(citylist));
	randpath = cat(2,randpath,randpath(1));
	paramlist = citylist(randpath);

	%Call the function
	pathlength = citydist(paramlist);

	%See if we have a good path
	if (pathlength < bestlength)

		%Save the length and the path
		bestlength = pathlength;
		bestpath = randpath;

	end

end

%Display the best path and length
'Best path was:'
citylist(bestpath).name
'Best length was:'
bestlength

%Plot the results
figure(1)
bestlat = [citylist(bestpath).lat];
bestlong = [citylist(bestpath).long];
plot(bestlat,bestlong)
title('Best path for traveling salesman')
xlabel('Longitude')
ylabel('Latitude')
