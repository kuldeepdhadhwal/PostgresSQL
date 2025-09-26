-- You, for some reason, want a combined list of all surnames and all facility names. Yes, this is a contrived example :-). Produce that list!
Select surname from cd.members 
	union
Select name from cd.facilities;
