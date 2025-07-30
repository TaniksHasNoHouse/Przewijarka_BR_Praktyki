
ACTION actProdColors: 
	IF Status.StateCurrent = 'Idle' THEN
		ButtonStyles.Start := 'green';
		PhysicalBtn.Production.Start.ColorON := TRUE;
		gHMI.ControlBtn.Stop := FALSE;
		gHMI.ControlBtn.Reset := FALSE;
	END_IF;

	IF Status.StateCurrent = 'Idle' 
		OR Status.StateCurrent = 'Starting'
		OR Status.StateCurrent = 'Execute'
		OR Status.StateCurrent = 'Completing'
		OR Status.StateCurrent = 'Complete'
		OR Status.StateCurrent = 'Resetting' THEN
		ButtonStyles.Stop := 'red';
		PhysicalBtn.Production.Stop.ColorON := TRUE;
		gHMI.ControlBtn.Start := FALSE;
		gHMI.ControlBtn.Reset := FALSE;
	END_IF;
	
	IF Status.StateCurrent = 'Stopped' 
		OR Status.StateCurrent = 'Complete'THEN
		ButtonStyles.Reset := 'blue';
		PhysicalBtn.Production.Reset.ColorON := TRUE;
		gHMI.ControlBtn.Start := FALSE;
		gHMI.ControlBtn.Stop := FALSE;
	END_IF;
END_ACTION
