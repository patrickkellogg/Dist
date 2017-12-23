%Patrick Kellogg
%CSCI 5582
%Prof. Jim Martin
%HW 1

% Complete MATLAB program for HW #1

%start_city = Denver;
%end_city = KansasCity;
%max_flight = 600;
%start_city = Denver;
%end_city = Tampa;
%max_flight = 800;
%start_city = NewYork;
%end_city = SanFrancisco;
%max_flight = 1000;
%start_city = Roswell;
%end_city = Quebec;
%max_flight = 1000;
%start_city = Boston;
%end_city = Tupelo;
%max_flight = 1000;
%start_city = Boston;
%end_city = Tupelo;
%max_flight = 500;
%start_city = Boston;
%end_city = Tupelo;
%max_flight = 250;
%start_city = Regina;
%end_city = NewYork;
%max_flight = 500;
%start_city = Wausau;
%end_city = Tampa;
%max_flight = 1000;
%start_city = Tampa;
%end_city = NewYork;
%max_flight = 545;
start_city = Tampa;
end_city = Regina;
max_flight = 1150;

smallest_dist = prep(citylist,start_city,end_city,max_flight);

[bestvector,bestlength] = h(citylist,start_city,end_city,max_flight,smallest_dist);
%See if a solution exists
if (~isempty(bestvector))
	printcities(max_flight,bestvector,citylist)
	for resultloop = 1:length(bestvector)
		bestvector(resultloop).name
	end
	bestlength
end

