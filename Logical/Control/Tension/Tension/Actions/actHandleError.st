
ACTION actHandleError: 
	TensionGroup.MoveVelocity := FALSE;
	TensionGroup.Control := FALSE;
	TensionGroup.Home := FALSE;
	step := ERROR_RESET;
END_ACTION
