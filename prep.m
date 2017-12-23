%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 1

% A "prep" function to create information for the future searches

function [smallest_dist] = prep(citylist,start_city,end_city,max_flight)

	%Find the smallest distance between two cities
	smallest_dist = Inf;

	%Do a loop
	for city1 = 1:((length(citylist))-1)

		for city2 = (city1+1):(length(citylist))

			%Find the distance between the two
			newcityvector = [citylist(city1) citylist(city2)];
			newdist = citydist(newcityvector);

			%See if this distance is the smallest
			if (newdist < smallest_dist)

				%We have new smallest distance
				smallest_dist = newdist;

			end

		end
	end

