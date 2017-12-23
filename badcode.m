%Patrick Kellogg
%CSCI XXXX
%Prof. Jim Martin
%HW 0

% Recursive MATLAB code to find all the
% permutations of a path

function [best_path,best_length] = search(start_city,end_city,max_flight)

	%Find the number of cities
	num_all_cities = length(citylist);

	%Create some storage arrays
	best_path = [];
	remaining_cities = citylist;

	%Copy the starting city into the new array and hold it
	current_length = length(remaining_cities);
	if (current_length) > 1)
		remove_from_front = remaining_cities(1);
		remaining_cities = remaining_cities(2:current_length);
		best_path = (best_path;remove_from_front);
	elseif (current_length) == 1)
		remove_from_front = remaining_cities(1);
		remaining_cities = [];
		best_path = (best_path;remove_from_front);
	else
		'No cities left to add to path'
		return
	end if

	while (1)



	end

end