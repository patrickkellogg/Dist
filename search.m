%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 1

% MATLAB code to find a path between two cities

function [best_path,best_length] = search(city_array,start_city,end_city,max_flight,search_method)

	%Clear the return values in case no solution is found
	best_length = NaN;

	%Create some storage arrays
	best_path = [];
	nodes = [];
     
	%Clear the information fields
	end_city.so_far = 0;
	start_city.so_far = 0;
	end_city.f = NaN;
	start_city.f = NaN;
	end_city.path = '';
	start_city.path = '';
     
	%Save the path inside of each node
	start_city.path = [start_city];
     
	%nodes<-MAKE-QUEUE(MAKE-NODE(INITIAL-STATE[problem]))
	nodes = start_city;
     
     %Loop until a solution is found
	while (1)

		%If nodes is empty then return failure
		if (length(nodes) == 0)
			'No path found between the two cities'
			best_path = current_node.path;
			best_length = current_node.so_far;
			return;
		end

		%node<-REMOVE-FRONT(nodes)
		current_node = nodes(1);
		nodes = nodes(2:(length(nodes)));

		%if GOAL-TEST[problem] applied to STATE(node) succeeds then return node
		if (strcmp(current_node.name,end_city.name))
			best_path = current_node.path;
			best_length = current_node.so_far;
			return;
		end

		%nodes<-QUEUING-FN(nodes,EXPAND(node,OPERATORS[problem]))
		%Expand the current node and create an array of cities
		expand_list = [];
		%Loop through all the cities
		for looper = 1:length(city_array)

			%Find the looped city
			examine_city = city_array(looper);
               
			%Make sure we aren't adding the original city
			if (~(strcmp(examine_city.name,current_node.name)))
                    
				%Make sure that this node is not already in the path                    
				found = 0;
                    
				%See if the expanded city is already in the current path
				for searcher = 1:length(current_node.path)

					%If so, we don't want to look at it
					if strcmp(examine_city.name,current_node.path(searcher).name)
						%We found a node
						found = 1;
						break;
					end
                    end                    
                    
                    %Only add expand this node if it is new
                    if (found==0)
                         
					%Clear the f-value, path, and "cost so far" for now
		              	examine_city.so_far = 0;
		            	examine_city.f = NaN;
		              	examine_city.path = '';
					%See if the city is within "flying range"
					cityvector = [current_node,examine_city];
					%Call the function I wrote for HW #0, and call that path length "newdist"
					newdist = citydist(cityvector);
					%Then, g is the path length so far plus newdist
					g = current_node.so_far + newdist;

					%If city_distance < "flying range" add it to the array
					if (newdist < max_flight)

					%Figure out the "f-value"
	                         switch (search_method)
	                              
							case 'greedy'

								%Find the distance between the city and the goal
								cityvector = [end_city,examine_city];
								%Call that distance "h"
								h = citydist(cityvector);
	                                   
								%The "f-value" is simply h
								examine_city.f = h;
								%Save the "cost so far" inside the node
								examine_city.so_far = g;
								%Save the path so far inside the node
								examine_city.path = [current_node.path,examine_city];
								%Add the node to the array of available nodes
								expand_list = [expand_list,examine_city];
	
							case 'uniform-cost'
	
								%The "f-value" is simply "g"
								examine_city.f = g;
								%Save the "cost so far" inside the node
								examine_city.so_far = g;
								%Save the path so far inside the node
								examine_city.path = [current_node.path,examine_city];
								%Add the node to the array of available nodes
								expand_list = [expand_list,examine_city];
		
							case 'A*'
	
								%Find the distance between the city and the goal
								cityvector = [end_city,examine_city];
								%Call that distance "h"
								h = citydist(cityvector);
                                   
								%The "f-value" is (g+h)
								examine_city.f = g+h;
								%Save the "cost so far" inside the node
								examine_city.so_far = g;
								%Save the path so far inside the node
								examine_city.path = [current_node.path,examine_city];
								%Add the node to the array of available nodes
								expand_list = [expand_list,examine_city];
	
							otherwise
	
								%Return a fatal error
								'Error: no valid search method chosen'
                                        return
						end
					end
				end
			end
      	end
               
		%Examine the cities we are expanding
		for expand_index = 1:length(expand_list)

			%See if the node is found
			found = 0;
			found_index = 0;
                    
			%See if the expanded city is already in the "nodes" queue
			for remover = 1:length(nodes)

				%If so, we may need to remove it
				if strcmp(expand_list(expand_index).name,nodes(remover).name)
                         
					%We found a node
					found = 1;
					found_index = remover;
					break;
                         
				end
			end                    
                         
			%See if we found a city already in the queue
			if (found == 1)
                    
				%If the city in the queue has a worse path, delete it
				if (expand_list(expand_index).so_far < nodes(found_index).so_far)
                         
					%Delete the city from the queue
					first_part = nodes(1:(found_index-1));
					last_part = nodes((found_index+1):(length(nodes)));
					nodes = [first_part,last_part];
                         
					%Insert the new one
					nodes = insert_city_into_queue(expand_list(expand_index),nodes);
                         
				end
                    
			else
                    
				%The city to insert is better, so insert it
				nodes = insert_city_into_queue((expand_list(expand_index)),nodes);
                    
			end
		end
	end
     
%Create a function to do the insert
function nodes = insert_city_into_queue(insert_city,nodes)

	%Set the position counter
	best_position = 0;
                                
	%Find the "f-value" where we should insert
	for inserter = 1:length(nodes)
                    
		%Examine the "f-value" of the node at this place
		if ((nodes(inserter).f) > (insert_city.f))
			%This is the place the insert should be
			break
		end
                    
		%Otherwise, it should be after that node
		best_position = inserter;
          
     end                                   
     
	%Create the new list with the node inserted
	first_part = nodes(1:(best_position));
	last_part = nodes((best_position+1):(length(nodes)));
	nodes = [first_part,insert_city,last_part];
                    
