
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
			
		STATE_WORKING:
			ButtonStyles.Start := 'working';
			ButtonStyles.Stop := 'default';
			ButtonStyles.Reset := 'default';
			IF gHMI.ControlBtn.Stop = TRUE THEN
				ButtonStates := STATE_STOPPED;
			END_IF;
			IF MpPackMLCore_0.StateCurrent = mpPACKML_STATE_COMPLETE THEN
				ButtonStates := STATE_STOPPED;
			END_IF;
		
		STATE_STOPPED:
			ButtonStyles.Start := 'default';
			ButtonStyles.Stop := 'stopped';
			ButtonStyles.Reset := 'default';
			IF gHMI.ControlBtn.Start = TRUE THEN
	  			ButtonStates := STATE_WORKING;
			END_IF;
			
			
		STATE_ESTOPPED:
			ButtonStyles.Start := 'default';
			ButtonStyles.Stop := 'Estopped';
			ButtonStyles.Reset := 'default';
			IF gHMI.ControlBtn.Reset THEN
	  			ButtonStates := STATE_RESETING;
			END_IF;
		
		STATE_RESETING:
			ResetBtnTimer.IN := TRUE;
			ResetBtnTimer.PT := T#2s;
			ButtonStyles.Reset := 'reset';
			ButtonStyles.Stop := 'Estopped';
			ButtonStyles.Start := 'default';
			IF ResetBtnTimer.Q = TRUE THEN
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

