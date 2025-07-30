
ACTION actBtnAssignment: 
	IF PhysicalBtn.Production.Start.State = TRUE THEN
		gHMI.ControlBtn.Start := TRUE;
	END_IF;
	
	IF PhysicalBtn.Production.Stop.State = TRUE THEN
		gHMI.ControlBtn.Stop := TRUE;
	END_IF;
			
	IF PhysicalBtn.Production.Reset.State = TRUE THEN
		gHMI.ControlBtn.Reset := TRUE;
	END_IF;	
END_ACTION
