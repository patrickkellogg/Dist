%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 1

% MATLAB code to find a path between two cities

function [returnnode,nextf] = dfscontour(node,end_city,flimit,citylist,max_flight)

	%Clear the nextf
	nextf = Inf;
     
	%Find the distance between the node and the goal
     g = node.so_far;
     cityvector = [node,end_city];
     h = citydist(cityvector);
	tempf = g + h;
     
     %See if we've gone too far
     if (tempf > flimit)
          %Return with nothing
          returnnode = [];
          nextf = tempf;
          return;
     end
     
     %See if we have found the end_city
	if (strcmp(node.name,end_city.name))
          returnnode = node;
          nextf = flimit;
          return;
	end
     
	%Expand the current node
     expand_list = [];
	%Loop through all the cities
	for looper = 1:length(citylist)

		%Find the looped city
		examine_city = citylist(looper);
               
		%Make sure we aren't adding the original city
		if (~(strcmp(examine_city.name,node.name)))
                    
			%Make sure that this node is not already in the path                    
			found = 0;
                    
			%See if the expanded city is already in the "nodes" queue
			for searcher = 1:length(node.path)

				%If so, we don't need to look at it
				if strcmp(examine_city.name,node.path(searcher).name)
					%We found a node
					found = 1;
					break;
				end
			end                    
                    
			%Only add expand this node if it is new
			if (found == 0)
                         
				%Clear the f-value, path, and "cost so far" for now
				examine_city.so_far = 0;
				examine_city.f = NaN;
				examine_city.path = '';
				%See if the city is within "flying range"
				cityvector = [node,examine_city];
				%Call the function I wrote for HW #0, and call that path length "newdist"
				newdist = citydist(cityvector);
				%Then, g is the path length so far plus newdist
				g = node.so_far + newdist;

				%If city_distance < "flying range" add it to the array
				if (newdist < max_flight)

					%Figure out the "f-value"
					cityvector = [end_city,examine_city];
					%Call that distance "h"
					h = citydist(cityvector);
					%The "f-value" is (g+h)
					examine_city.f = g+h;
					%Save the "cost so far" inside the node
					examine_city.so_far = g;
					%Save the path so far inside the node
					examine_city.path = [node.path,examine_city];
					%Add the node to the array of available nodes
					expand_list = [expand_list,examine_city];
                         
				end
			end
		end
	end
     
	%Examine the cities we are expanding
	for expand_index = 1:length(expand_list)
          
          %Call the recursive routine
          [solution,newf] = dfscontour(expand_list(expand_index),end_city,flimit,citylist,max_flight);
          
          %See if we have a solution
          if (~isempty(solution))
               %We have a solution
               returnnode = solution;
               nextf = flimit;
               return;
          end
          
          %See if this node has the smallest f-value
          if (newf < nextf)
               
               %Use the newf at the next limit
               nextf = newf;
               
		end              
     end
     
     %Return nothing
     returnnode = [];
          