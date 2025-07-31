
ACTION actProdColors: 
	IF Status.StateCurrent = 'Idle' THEN
		ButtonStyles.Start := 'green';
		PhysicalBtn.Production.Start.ColorON := TRUE;
		ButtonStyles.Stop := 'red';
		PhysicalBtn.Production.Stop.ColorON := TRUE;
	END_IF;

	IF Status.StateCurrent = 'Starting'
		OR Status.StateCurrent = 'Execute'
		OR Status.StateCurrent = 'Completing'
		OR Status.StateCurrent = 'Complete'
		OR Status.StateCurrent = 'Resetting' THEN
		ButtonStyles.Stop := 'red';
		PhysicalBtn.Production.Stop.ColorON := TRUE;
	END_IF;
	
	IF Status.StateCurrent = 'Stopped' 
		OR Status.StateCurrent = 'Complete'THEN
		ButtonStyles.Reset := 'blue';
		PhysicalBtn.Production.Reset.ColorON := TRUE;
	END_IF;
END_ACTION
