
ACTION actManualBtnAssignment: 
	IF PhysicalBtn.Manual.Left.State = TRUE OR gHMI.Manual.JogLeftRight.JogLeftTemp = TRUE THEN
		gHMI.Manual.JogLeftRight.JogLeft := TRUE;
		PhysicalBtn.Manual.Left.ColorON := TRUE;
	ELSE
		gHMI.Manual.JogLeftRight.JogLeft := FALSE;
		PhysicalBtn.Manual.Left.ColorON := FALSE;
	END_IF;
	IF PhysicalBtn.Manual.Right.State = TRUE OR gHMI.Manual.JogLeftRight.JogRightTemp = TRUE THEN
		gHMI.Manual.JogLeftRight.JogRight := TRUE;
		PhysicalBtn.Manual.Right.ColorON := TRUE;
	ELSE
		gHMI.Manual.JogLeftRight.JogRight := FALSE;
		PhysicalBtn.Manual.Right.ColorON := FALSE;
	END_IF;
END_ACTION
