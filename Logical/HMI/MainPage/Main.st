
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	CASE ButtonStates OF
		STATE_IDLE:
			ButtonStyles.Start := 'default';
			ButtonStyles.Stop := 'default';
			ButtonStyles.Reset := 'default';
			IF gHMI.ControlBtn.Start = TRUE THEN
				ButtonStates := STATE_WORKING;
			END_IF;
			IF gHMI.ControlBtn.Stop = TRUE THEN
				ButtonStates := STATE_STOPPED;
			END_IF;
			IF gHMI.ControlBtn.Reset = TRUE THEN
				ButtonStates := STATE_RESETING;
			END_IF;
			
		STATE_WORKING:
			ButtonStyles.Start := 'working';
			ButtonStyles.Stop := 'default';
			IF gHMI.ControlBtn.Stop = TRUE THEN
				ButtonStates := STATE_STOPPED;
			END_IF;
		
		STATE_STOPPED:
			ButtonStyles.Start := 'default';
			ButtonStyles.Stop := 'stopped';
		
		STATE_RESETING:
			ButtonStyles.Start := 'default';
			ButtonStyles.Stop := 'default';
		  

	END_CASE;
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

