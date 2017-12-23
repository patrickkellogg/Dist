%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 0

% This MATLAB code tests the MATLAB function "citydist"
% by running through all the available cities in the
% "citylist" vector and computing their distance from
% a given city (in this case, Atlanta)

'Distance from Atlanta to:'

for loopcounter = 2:4

	%Show the city name
	citylist(loopcounter).name

	%Set the parameter list
	params = [Atlanta,citylist(loopcounter)];

	%Call the function
	citydist(params)	

end

% Do Atlanta to Boston
'Atlanta to Boston'
newlist = [Atlanta,Boston];
citydist(newlist)

% Do a longer route
'Atlanta to Boston and back'
newlist = [Atlanta,Boston,Atlanta]; 
citydist(newlist)

% Test when the list is missing
'No city given'
citydist('')

% Test when only given one city
'Just Atlanta'
newlist = [Atlanta];
citydist(newlist)
