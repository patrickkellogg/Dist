%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 1

% This program chooses the best search
% algorithm for the given parameters

function [best_path,best_length] = h(citylist,start_city,end_city,max_flight,smallest_dist)

	%If the start_city is the same as the end_city, don't do anything
	if strcmp(start_city.name,end_city.name)
          %Tell the user
          best_path = [];
          best_length = 0;
	     'The start city is the same as the end city'
	     return;
	end

	%Find the distance between the two cities
	total_vector = [start_city, end_city];
	total_length = citydist(total_vector);

	%If this distance is less than the smallest possible distance, do nothing
	if (total_length < smallest_dist)
	     %Tell the user
          best_path = [];
          best_length = 0;
	     'There is no possible path between the two cities'
	     return;
	end

	%See if the two cities are even connected
     if (~isconnected(citylist,start_city,end_city,max_flight))
          %Don't bother doing a search
          best_path = [];
          best_length = 0;
          'No valid path between those cities for that length'
          return;
     end
     
     %Otherwise, if there is a valid path, see if greedy will work
     %Note: I figured out the largest possible value where greedy still
     %peformed accurately. There are still a minority of cases, though,
     %where greedy will return the "wrong" path
     max_allowable_greedy = 1000;
     if (total_length < max_allowable_greedy)
          
          %Do a greedy search
		[best_path,best_length] = search(citylist,start_city,end_city,max_flight,'greedy');
          
     else
          
          %Otherwise, do A*
		[best_path,best_length] = search(citylist,start_city,end_city,max_flight,'A*');
          
          %Note: I didn't even consider IDA*, because its smaller system requirments
          %don't make up for the slower speed... at least not in our domain
          %Also, uniform-cost is quite slow, but could have been used if the branching factor
          %was extremely small
          
     end
