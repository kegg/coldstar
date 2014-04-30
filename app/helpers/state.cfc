component {
	public state function init() {
		return this;
	}
	
	public array function getCountries() {
		var countries = ArrayNew(1);
		
		ArrayAppend(countries, "United States Of America");
		
		return countries;
	}

	public array function getStates() {
		var states = ArrayNew(1);
		
		ArrayAppend(states, "Alabama");
		ArrayAppend(states, "Alaska");
		ArrayAppend(states, "American Samoa");
		ArrayAppend(states, "Arizona");
		ArrayAppend(states, "Arkansas");
		ArrayAppend(states, "California");
		ArrayAppend(states, "Colorado");
		ArrayAppend(states, "Connecticut");
		ArrayAppend(states, "Delaware");
		ArrayAppend(states, "District of Columbia");
		ArrayAppend(states, "Florida");
		ArrayAppend(states, "Georgia");
		ArrayAppend(states, "Guam");
		ArrayAppend(states, "Hawaii");
		ArrayAppend(states, "Idaho");
		ArrayAppend(states, "Illinois");
		ArrayAppend(states, "Indiana");
		ArrayAppend(states, "Iowa");
		ArrayAppend(states, "Kansas");
		ArrayAppend(states, "Kentucky");
		ArrayAppend(states, "Louisiana");
		ArrayAppend(states, "Maine");
		ArrayAppend(states, "Maryland");
		ArrayAppend(states, "Massachusetts");
		ArrayAppend(states, "Michigan");
		ArrayAppend(states, "Minnesota");
		ArrayAppend(states, "Mississippi");
		ArrayAppend(states, "Missouri");
		ArrayAppend(states, "Montana");
		ArrayAppend(states, "Nebraska");
		ArrayAppend(states, "Nevada");
		ArrayAppend(states, "New Hampshire");
		ArrayAppend(states, "New Jersey");
		ArrayAppend(states, "New Mexico");
		ArrayAppend(states, "New York");
		ArrayAppend(states, "North Carolina");
		ArrayAppend(states, "North Dakota");
		ArrayAppend(states, "Northern Marianas Islands");
		ArrayAppend(states, "Ohio");
		ArrayAppend(states, "Oklahoma");
		ArrayAppend(states, "Oregon");
		ArrayAppend(states, "Pennsylvania");
		ArrayAppend(states, "Puerto Rico");
		ArrayAppend(states, "Rhode Island");
		ArrayAppend(states, "South Carolina");
		ArrayAppend(states, "South Dakota");
		ArrayAppend(states, "Tennessee");
		ArrayAppend(states, "Texas");
		ArrayAppend(states, "Utah");
		ArrayAppend(states, "Vermont");
		ArrayAppend(states, "Virginia");
		ArrayAppend(states, "Virgin Islands");
		ArrayAppend(states, "Washington");
		ArrayAppend(states, "West Virginia");
		ArrayAppend(states, "Wisconsin");
		ArrayAppend(states, "Wyoming");

		return states;
	}
}