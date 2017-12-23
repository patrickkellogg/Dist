%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 1

% Recursive MATLAB code to find all the
% permutations of a path

function [path_minus_one,element] = recurse_it(list_in,itir_value)

	%Find the length of the path
	list_length = length(list_in);

	%See if we are done
	if (list_length == 0)

		%We are done. Take the path and find the length
		path_length = citydist(citylist[finalpath]);

	else

		%Remove element "itir_value" from the list
		%and return everything else
		firstpart = list_in(1:(itir_value-1));
		secondpart = list_in((itir_value+1):list_length);
		path_minus_one = cat(2,firstpart,secondpart);
	
		%Set the new value to add
		element = itir_value;
		final_path = cat(2,final_path,element);

		%Call this function again
		for looper = 1:(list_length-1)

			%Set the final path
			final_path = saved_path;

			%Do the recursion
			recurse_it(path_minus_one,looper)

		end

	end
	