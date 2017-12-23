%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 1

%Create a function (that returns nothing) to print a map
function return_nothing = printcites(max_length,bestvector,citylist)

%Plot the cities
mylength = length(citylist);
bestpath = 1:mylength;
mycity = citylist(bestpath);

%Make the cities print correctly (left to right)
for loopit = 1:mylength
	mycity(loopit).long = 0 - mycity(loopit).long;
end

bestlat = [mycity.lat];
bestlong = [mycity.long];
bestname = [mycity.name];

figure(1)
hold on
orient tall
mystring = ['The best path between ',bestvector(1).name,' and ',bestvector(length(bestvector)).name,' for maximum distance = ',num2str(max_length)];
title(mystring)
xlabel('Negative Longitude')
ylabel('Latitude')

%Print paths joining all the cities for a given max_length
for x = 1:((length(citylist))-1),

	for y = (x+1):(length(citylist)),

		%Create a city vector
		cityvector = [citylist(x) citylist(y)];

		%See if the length is within bounds
		if (max_length > (citydist(cityvector)))

			%Draw a line
			line ([(0-citylist(x).long) (0-citylist(y).long)],[citylist(x).lat citylist(y).lat],'LineWidth',2,'Color',[.8 .8 .8]);

		end

	end

end

%Plot the cities
plot(bestlong,bestlat,'o')
for printit = 1:mylength
	text(bestlong(printit),bestlat(printit),cat(2,' ',mycity(printit).name));
end

%Plot the best path
for x = 1:((length(bestvector))-1),

	%Draw a line from the current city to the next one
	line ([(0-bestvector(x).long) (0-bestvector(x+1).long)],[bestvector(x).lat bestvector(x+1).lat],'LineWidth',1,'Color','red');

end



line([-125,-124,-124,-124,-121,-115,-109,-104,-101,-100,-96,-94,-94],[52,50,45,40,35,32,31,31,29,30,26,25,28])
line([-94,-92,-90,-88,-88,-85,-83,-81,-80,-82,-79],[28,30,29,29,30,30,27,26,28,30,32]);
line([-124,-95,-95,-94,-93,-90,-92,-90,-89,-89,-88,-86,-87,-85,-84,-84,-83,-83],[47,47,48,48,47,47,46,46,45,44,43,43,45,46,46,45,45,43]);
line([-83,-80,-80,-74,-74,-70,-69,-68,-66,-65,-65],[43,43,44,45,46,47,49,49,47,47,46]);
line([-65,-69,-74,-75,-76,-79],[46,44,40,38,34,32]);
line([-65,-63],[46,47]);

hold off
