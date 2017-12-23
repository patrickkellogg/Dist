%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 1

% This program tells me whether two
% cities are connected

function yes_or_no = isconnected(citylist,start_city,end_city,max_flight)

	%Clear the return value
	yes_or_no = 0;

	%If the start_city is the same as the end_city, don't do anything
	if strcmp(start_city.name,end_city.name)
	     %The answer is yes
		yes_or_no = 1;
	     return;
	end

	%See if the two cities are connected
     city_pool = citylist;
     connected = 0;
     remove_list = start_city;
	%Loop until there are no more cities to remove
     while(1)
                    
          %Remove the first element from the remove_list queue
          expand_city = remove_list(1);
          remove_list = remove_list(2:length(remove_list));
          
    	     %Remove that city from the city_pool
          remove_index = 0;
          for remove_loop = 1:length(city_pool)
               %See if we've found the city
               if strcmp(city_pool(remove_loop).name,expand_city.name)
				remove_index = remove_loop;
                    break;
               end
		end
               
		%Create the new list with the node removed
		first_part = city_pool(1:(remove_index-1));
		last_part = city_pool((remove_index+1):(length(city_pool)));
		city_pool = [first_part,last_part];
          
          %Loop through the cities remaining in the city_pool and see if they are successors
          expand_loop = 1;
          while(1)
               
               %See if there are any cities left
               if (expand_loop >= length(city_pool))
                    %No cities left, so stop
                    break
               end
               
               %Create a vector of the two cities
               twocities = [city_pool(expand_loop) expand_city];
               mindist = citydist(twocities);
              
               %See if the distance is within allowable bounds
               if (mindist < max_flight)
                   
                    %See if this is the end_city we are looking for
                    if strcmp(city_pool(expand_loop).name,end_city.name)
                    
                    	%Set the flag for a match and quit
    	                    connected = 1;
                         break;
                        
                    end
                   
                    %Otherwise, add this city to the remove_list
                    remove_list = [remove_list city_pool(expand_loop)];
				%Remove the city from the city_pool
				first_part = city_pool(1:(expand_loop-1));
				last_part = city_pool((expand_loop+1):(length(city_pool)));
				city_pool = [first_part,last_part];
               else
                    %Try the next element
				expand_loop = expand_loop+1;                    
               end
          end
              
     	%See if a connection has been found
          if connected
               %Just exit with connected = 1
               break;
          end
          
          %Also exit if there are no cities in the "remove_list" queue
          if isempty(remove_list)
               %Just exit, and connected equals 0
               break;
		end
	end
    
	%Return
	yes_or_no = connected;
	return;     
