
ACTION actHandleError: 
	GroupLineVelocity := 0.0;
	TensionGroup.MoveVelocity := FALSE;
	TensionGroup.Control := FALSE;
	TensionGroup.Power := FALSE;
	TensionGroup.Home := FALSE;
	step := ERROR_RESET;
END_ACTION
