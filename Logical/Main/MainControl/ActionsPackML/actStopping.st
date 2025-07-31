ACTION actStopping:
// Free braking and transition to stopped
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STOPPING, PACKML_MODE_ALL) THEN
		gMainLogic.MotorMode.Production.Parameter.Distance := 0.0;
		gMainLogic.MotorMode.Production.Parameter.DancerPos1 := 5.0;
		gMainLogic.MotorMode.Production.Parameter.DancerPos2 := 5.0;
		IF gMainLogic.MotorMode.Production.Status.TensionReady THEN
			gMainLogic.MotorMode.Production.Cmd.PowerOn := FALSE;
		END_IF;

//		gMainLogic.MotorMode.Manual.Axis1.Cmd.PowerOn := FALSE;
//		gMainLogic.MotorMode.Manual.Axis2.Cmd.PowerOn := FALSE;
		//		gMainLogic.MotorMode.Manual.Axis3.Cmd.PowerOn := FALSE;
		IF NOT gTensionLogic.Status.LineIsPoweredOn THEN
	  		MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
		END_IF;
		
	END_IF;
END_ACTION