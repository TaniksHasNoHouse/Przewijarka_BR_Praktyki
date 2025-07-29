
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC

	IF gTensionLogic.Status.EnableAxis1 = FALSE OR gTensionLogic.Status.EnableAxis2 = FALSE OR gTensionLogic.Status.EnableAxis3 = FALSE THEN
		aBORT := TRUE;
	END_IF;
	
	IF PhysicalBtn.Start.State = TRUE THEN
		gHMI.ControlBtn.Start := TRUE;
	END_IF;
	
	IF PhysicalBtn.Stop.State = TRUE THEN
		gHMI.ControlBtn.Stop := TRUE;
	END_IF;
			
	IF PhysicalBtn.Reset.State = TRUE THEN
		gHMI.ControlBtn.Reset := TRUE;
	END_IF;	

	IF Status.StateCurrent = 'Aborting' THEN
		ButtonStates := STATE_ESTOPPED;
	END_IF;
	IF Status.StateCurrent = 'Stopped' THEN
		IF Status.ModeCurrent = 'Manual' THEN
			ButtonStates := STATE_MANUAL;
		END_IF;
		ButtonStates := STATE_STOPPED;
	END_IF;
	IF Status.StateCurrent = 'Idle' THEN
		ButtonStates := STATE_IDLE;
	END_IF;
	IF Status.StateCurrent = 'Resetting' THEN
		ButtonStates := STATE_RESETING;
	END_IF;
	IF Status.StateCurrent = 'Starting' THEN
		ButtonStates := STATE_WORKING;
	END_IF;
	
	ButtonStyles.Start := 'default';
	ButtonStyles.Stop := 'default';
	ButtonStyles.Reset := 'reset';
	
	ManualOff := FALSE;
	
	PhysicalBtn.Start.ColorOFF := TRUE;
	PhysicalBtn.Reset.ColorON := TRUE;
	PhysicalBtn.Stop.ColorEstop := FALSE;
	
	PhysicalBtn.Manual.Left.ColorOFF := FALSE;
	PhysicalBtn.Manual.Left.ColorON := FALSE;
	
	PhysicalBtn.Manual.Right.ColorON := FALSE;
	PhysicalBtn.Manual.Right.ColorOFF := FALSE;
	
	CASE ButtonStates OF
		STATE_IDLE:
			PhysicalBtn.Stop.ColorOFF := TRUE;
			
		STATE_WORKING:
			gHMI.ControlBtn.Start := FALSE;
			ButtonStyles.Start := 'working';
			
			PhysicalBtn.Start.ColorOFF := FALSE;
			PhysicalBtn.Start.ColorON := TRUE;
			
			PhysicalBtn.Stop.ColorON := FALSE;
			PhysicalBtn.Stop.ColorOFF := TRUE;
		
		STATE_STOPPED:
			ManualOff := TRUE;
			gHMI.ControlBtn.Stop := FALSE;
			ButtonStyles.Stop := 'stopped';
			
			PhysicalBtn.Stop.ColorOFF := FALSE;
			PhysicalBtn.Stop.ColorON := TRUE;
			
			PhysicalBtn.Start.ColorON := FALSE;
			
			
			
		STATE_ESTOPPED:
			ButtonStyles.Stop := 'Estopped';
			
			PhysicalBtn.Stop.ColorON := FALSE;
			PhysicalBtn.Stop.ColorOFF := FALSE;

			PhysicalBtn.Start.ColorON := FALSE;
			PhysicalBtn.Stop.ColorEstop := TRUE;
		
		STATE_RESETING:
			gHMI.ControlBtn.Reset := FALSE;
			PhysicalBtn.Stop.ColorEstop := TRUE;
			PhysicalBtn.Reset.ColorOFF := TRUE;
			PhysicalBtn.Reset.ColorON := FALSE;
			ButtonStyles.Stop := 'Estopped';
			ButtonStyles.Reset := 'working';
		
		STATE_MANUAL:
			PhysicalBtn.Start.ColorOFF := FALSE;
			PhysicalBtn.Stop.ColorOFF := FALSE;
			PhysicalBtn.Start.ColorON := FALSE;
			PhysicalBtn.Stop.ColorON := FALSE;
			
			PhysicalBtn.Manual.Left.ColorOFF := TRUE;
			PhysicalBtn.Manual.Right.ColorOFF := TRUE;
			
			gHMI.Manual.JogLeftRight.JogLeft := FALSE;
			gHMI.Manual.JogLeftRight.JogRight := FALSE;
			
			IF PhysicalBtn.Manual.Left.State = TRUE OR gHMI.Manual.JogLeftRight.JogLeftTemp THEN
				gHMI.Manual.JogLeftRight.JogLeft := TRUE;
				PhysicalBtn.Manual.Left.ColorOFF := FALSE;
				PhysicalBtn.Manual.Left.ColorON := TRUE;
			END_IF;
			IF PhysicalBtn.Manual.Right.State = TRUE OR gHMI.Manual.JogLeftRight.JogRightTemp THEN
				gHMI.Manual.JogLeftRight.JogRight := TRUE;
				PhysicalBtn.Manual.Right.ColorOFF := FALSE;
				PhysicalBtn.Manual.Right.ColorON := TRUE;
			END_IF;
	END_CASE;
	

	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

