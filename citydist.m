%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 0

%This MATLAB function will compute the uses a file called "cities.m"
%that is a modified version of the given text file.
%It needed to be modified so I could use the MATLAB
%"load" function.

%Once loaded, this routine can be called with the line
%retdist = citydist(list), where list is a vector of city
%names like list = [Atlanta,Tampa]

%Note that if a city is in the set of parameters
%for the function, but is not in the cities.m
%file, the function will abort. The special value
%NaN (not-a-number) is returned if the parameter
%list is empty. Finally, calling the function with
%only one city always results in a length of 0.

%The is the function definition for "citydist"
function total_distance = citydist(cityvector)

	%Set the diameter of the earth (in kilometers)
	earth_diameter = 12765;
	%For testing, I also calulated the distance in miles
	%earth_diameter = 12765*(0.6215);

	%Find the number of cities in the list
	numcities = length(cityvector);

	%Check the case of a null list
	if (numcities == 0)

		%Return "NaN"
		total_distance = NaN;

	%Check if there is only one city in the list
	elseif (numcities == 1)

		%Return 0
		total_distance = 0;

	%Otherwise, run through the list and calculate the length
	else

		%Create storage for the total distance
		total_distance = 0;

		%Create a counter to step through the list
		listcounter = 1;

		%Find the x-y-z coordinates of the first city in the list
		alpha = convert_to_radians(cityvector(listcounter).lat);
		beta = convert_to_radians(cityvector(listcounter).long);
		x1 = cos(alpha) * cos(beta);
		y1 = cos(alpha) * sin(beta);
		z1 = sin(alpha);

		%Loop until all the elements of the list are processed
		while (listcounter < numcities)

			%Find the x-y-z coordinates of the second city in the list
			alpha = convert_to_radians(cityvector(listcounter+1).lat);
			beta = convert_to_radians(cityvector(listcounter+1).long);
			x2 = cos(alpha) * cos(beta);
			y2 = cos(alpha) * sin(beta);
			z2 = sin(alpha);

			%Find the Euclidean distance
			euclidean_distance = sqrt(((x1-x2)^2) + ((y1-y2)^2) + ((z1-z2)^2));

			%Find the circle distance
			circle_distance = earth_diameter * asin(euclidean_distance/2);

			%Add the circle_dist to the running total (to the nearest kilometer)
			total_distance = total_distance + round(circle_distance);

			%Copy the second x-y-z into the first, and repeat
			x1 = x2;
			y1 = y2;
			z1 = z2;

			%Increment the counter
			listcounter = listcounter + 1;			

		end
	end


%Create a function to convert latitude or longitude to radians
function numradians = convert_to_radians(numdegrees)

	%Since a full circle is 2*pi radians or 360 degrees,
	%the number of radians uses the following formula:

	numradians = (numdegrees*pi)/180; 
