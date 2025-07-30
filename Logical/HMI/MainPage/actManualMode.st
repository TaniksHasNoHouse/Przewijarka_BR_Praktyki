
ACTION actManualMode: 
	gHMI.Manual.JogLeftRight.JogLeft := FALSE;
	gHMI.Manual.JogLeftRight.JogRight := FALSE;
	PhysicalBtn.Production.Start.State := FALSE;
	PhysicalBtn.Production.Stop.State := FALSE;
	IF PhysicalBtn.Manual.Left.State = TRUE OR gHMI.Manual.JogLeftRight.JogLeftTemp THEN
		gHMI.Manual.JogLeftRight.JogLeft := TRUE;
		PhysicalBtn.Manual.Left.ColorON := TRUE;
	END_IF;
	IF PhysicalBtn.Manual.Right.State = TRUE OR gHMI.Manual.JogLeftRight.JogRightTemp THEN
		gHMI.Manual.JogLeftRight.JogRight := TRUE;
		PhysicalBtn.Manual.Right.ColorON := TRUE;
	END_IF;
END_ACTION
