
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	IF PhysicalBtn.Start.State = TRUE THEN
		gHMI.ControlBtn.Start := TRUE;
	END_IF;
	
	IF PhysicalBtn.Stop.State = TRUE THEN
		gHMI.ControlBtn.Stop := TRUE;
	END_IF;
			
	IF PhysicalBtn.Reset.State = TRUE THEN
		gHMI.ControlBtn.Reset := TRUE;
	END_IF;		
	
	ButtonStyles.Start := 'default';
	ButtonStyles.Stop := 'default';
	ButtonStyles.Reset := 'default';
	PhysicalBtn.Start.ColorOFF := TRUE;
	PhysicalBtn.Stop.ColorOFF := TRUE;
	
	CASE ButtonStates OF
		STATE_IDLE:
			IF gHMI.ControlBtn.Start = TRUE THEN
				ButtonStates := STATE_WORKING;
			END_IF;
			IF gHMI.ControlBtn.Stop = TRUE THEN
				ButtonStates := STATE_STOPPED;
			END_IF;
			
		STATE_WORKING:
			gHMI.ControlBtn.Start := FALSE;
			ButtonStyles.Start := 'working';
			PhysicalBtn.Start.ColorOFF := FALSE;
			PhysicalBtn.Stop.ColorON := FALSE;
			PhysicalBtn.Start.ColorON := TRUE;
			IF gHMI.ControlBtn.Stop = TRUE THEN
				ButtonStates := STATE_STOPPED;
			END_IF;
			IF MpPackMLCore_0.StateCurrent = mpPACKML_STATE_COMPLETE THEN
				ButtonStates := STATE_STOPPED;
			END_IF;
		
		STATE_STOPPED:
			gHMI.ControlBtn.Stop := FALSE;
			PhysicalBtn.Stop.ColorOFF := FALSE;
			PhysicalBtn.Start.ColorON := FALSE;
			PhysicalBtn.Stop.ColorON := TRUE;
			ButtonStyles.Stop := 'stopped';
			IF gHMI.ControlBtn.Start = TRUE THEN
				ButtonStates := STATE_WORKING;
			END_IF;
			
			
		STATE_ESTOPPED:
			ButtonStyles.Stop := 'Estopped';
			PhysicalBtn.Stop.ColorOFF := FALSE;
			PhysicalBtn.Start.ColorON := FALSE;
			PhysicalBtn.Stop.ColorON := FALSE;
			PhysicalBtn.Stop.ColorEstop := TRUE;
			IF gHMI.ControlBtn.Reset = TRUE THEN
				ButtonStates := STATE_RESETING;
			END_IF;
		
		STATE_RESETING:
			gHMI.ControlBtn.Reset := FALSE;
			PhysicalBtn.Reset.ColorON := TRUE;
			PhysicalBtn.Stop.ColorOFF := FALSE;
			ResetBtnTimer.IN := TRUE;
			ResetBtnTimer.PT := T#2s;
			ButtonStyles.Reset := 'reset';
			ButtonStyles.Stop := 'Estopped';
			IF ResetBtnTimer.Q = TRUE THEN
				PhysicalBtn.Stop.ColorEstop := FALSE;
				PhysicalBtn.Reset.ColorON := FALSE;
				ResetBtnTimer.IN := FALSE;
				ButtonStyles.Stop := 'default';
				ButtonStates := STATE_IDLE;
			END_IF;
		  

	END_CASE;
	
	IF MpPackMLCore_0.StateCurrent = mpPACKML_STATE_ABORTING THEN
		ButtonStates := STATE_ESTOPPED;
	END_IF;
	
	 ResetBtnTimer();
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

