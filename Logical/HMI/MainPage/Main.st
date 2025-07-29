
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
	ButtonStyles.Reset := 'reset';
	PhysicalBtn.Start.ColorOFF := TRUE;
	PhysicalBtn.Reset.ColorON := TRUE;
	PhysicalBtn.Manual.Left.ColorOFF := FALSE;
	PhysicalBtn.Manual.Right.ColorOFF := FALSE;
	PhysicalBtn.Manual.Left.ColorON := FALSE;
	PhysicalBtn.Manual.Right.ColorON := FALSE;
	
	CASE ButtonStates OF
		STATE_IDLE:
			PhysicalBtn.Stop.ColorOFF := TRUE;
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
			PhysicalBtn.Stop.ColorOFF := TRUE;
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

			ResetBtnTimer.PT := T#2s;
			ResetBtnTimer.IN := TRUE;
			BlinkTimer.PT    := T#250ms;
			BlinkTimer.IN    := TRUE;

			IF BlinkTimer.Q THEN
				BlinkTimer.IN  := FALSE;
				BlinkToggle    := NOT BlinkToggle;
			END_IF;
			BlinkTimer.IN := TRUE;

			IF BlinkToggle THEN
				PhysicalBtn.Reset.ColorON  := TRUE;    // niebieski
				PhysicalBtn.Reset.ColorOFF := FALSE;
				ButtonStyles.Reset := 'reset';
			ELSE
				PhysicalBtn.Reset.ColorON  := FALSE;   // zielony (miganie)
				PhysicalBtn.Reset.ColorOFF := TRUE;
				ButtonStyles.Reset := 'working';
			END_IF;

			ButtonStyles.Stop := 'Estopped'; // zachowaj wygl¹d Estop

			IF ResetBtnTimer.Q THEN
				ResetBtnTimer.IN := FALSE;
				BlinkTimer.IN    := FALSE;
				BlinkToggle      := FALSE;

				PhysicalBtn.Reset.ColorON  := TRUE;
				PhysicalBtn.Reset.ColorOFF := FALSE;
				PhysicalBtn.Stop.ColorEstop := FALSE;

				ButtonStyles.Stop := 'default';
				
				ButtonStates := STATE_IDLE;
			END_IF;
		
		STATE_MANUAL:
			PhysicalBtn.Start.ColorOFF := FALSE;
			PhysicalBtn.Stop.ColorOFF := FALSE;
			PhysicalBtn.Start.ColorON := FALSE;
			PhysicalBtn.Stop.ColorON := FALSE;
			
			IF gHMI.ControlBtn.Reset = TRUE THEN
				ButtonStates := STATE_RESETING;
			END_IF;
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
			
			IF gHMI.ControlBtn.AutoManual = FALSE THEN
				ButtonStates := STATE_IDLE;
			END_IF;
	END_CASE;
	
	IF MpPackMLCore_0.StateCurrent = mpPACKML_STATE_ABORTING THEN
		ButtonStates := STATE_ESTOPPED;
	END_IF;
	
	IF ButtonStates <> STATE_ESTOPPED OR ButtonStates <> STATE_RESETING THEN
		IF gHMI.ControlBtn.AutoManual = TRUE THEN
			ButtonStates := STATE_MANUAL;
		END_IF;
	END_IF;
//	
//	IF MpPackMLCore_0.StateCurrent <> mpPACKML_STATE_STOPPED THEN
//	  
//	END_IF;
//	
	
	BlinkTimer();
	ResetBtnTimer();
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

