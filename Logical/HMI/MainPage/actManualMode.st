
ACTION actManualMode: 
	IF Status.StateCurrent = 'Stopped' THEN
		PhysicalBtn.Production.Reset.ColorON := TRUE;
		ButtonStyles.Reset := 'blue';
	END_IF;
	IF Status.StateCurrent = 'Idle' THEN
		PhysicalBtn.Production.Stop.ColorON := TRUE;
		ButtonStyles.Stop := 'red';
		actManualBtnAssignment;
	END_IF;
END_ACTION
