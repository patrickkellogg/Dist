%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 1

% Routine to find the index of a given city

function [city_index] = find_city(city_array,city_to_find)

	%Get the length of the array
	array_length = length(city_array);

	%Loop until found
	for looper = 1:array_length,

		%See if we have a match
		if strcmp(city_array(looper).name,city_to_find.name)
			%Set the index
			city_index = looper;
			return;
		end

	end

	%If the code reached here, no match was found
	city_index = 0;
	return;

