%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 1

% MATLAB code to find a path between two cities
% using the IDA* algorithm

function [best_path,best_length] = ida(citylist,start_city,end_city,max_flight)

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
     
     %Find the f-value of the current node
     cityvector = [start_city,end_city];
     g = 0;
     h = citydist(cityvector);
     flimit = g + h;
     start_city.f = flimit;
     
     %Create a variable for "epsilon-admissible" IDA*
     %Note, this value was not used for the "normal" version of IDA*
     e_flimit = flimit;
     %epsilon is the amount we will increase flimit by each iteration
	epsilon = 500;
     
     %Loop forever
     while (1)

	     %Show the flimit for debugging
	     %flimit

		%Increase the flimit by a fixed cost every iteration
		%Note: this was just a hack to increase my performance during testing
		e_flimit = e_flimit + epsilon;
	     flimit = e_flimit;	
     
	     %Call the recursive routine
	     [solution,flimit] = dfscontour(start_city,end_city,flimit,citylist,max_flight);
     
          %See if we have a solution
          if (~isempty(solution))
               
               %We have a solution
               best_path = solution.path;
               best_length = solution.so_far;
               return;

          end
          
          %Otherwise, see if we have reached the end of the nodes
          if (isinf(flimit))
               
               %No path was found
			'No path found between the two cities'
			best_path = [];
			best_length = 0;
			return;
		end
               
	end               
