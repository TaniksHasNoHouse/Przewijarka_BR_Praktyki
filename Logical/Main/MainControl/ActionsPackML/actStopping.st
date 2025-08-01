ACTION actStopping:
// Free braking and transition to stopped
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STOPPING, PACKML_MODE_ALL) THEN
		gMainLogic.MotorMode.Production.Parameter.Distance := 0.0;
		gMainLogic.MotorMode.Production.Cmd.StartWinding := FALSE;
		gTensionLogic.Status.SetDancers := FALSE;
		gMainLogic.MotorMode.Production.Cmd.PowerOn := FALSE;
		gMainLogic.MotorMode.Production.Cmd.Reset := FALSE;
		gTensionLogic.Status.ProgressBarProcent := 0.0;


		//		gMainLogic.MotorMode.Manual.Axis1.Cmd.PowerOn := FALSE;
		//		gMainLogic.MotorMode.Manual.Axis2.Cmd.PowerOn := FALSE;
		//		gMainLogic.MotorMode.Manual.Axis3.Cmd.PowerOn := FALSE;
		IF NOT gTensionLogic.Status.LineIsPoweredOn THEN
			MpPackMLStateComplete(gPackMLCore, PACKML_MODE_ALL);
		END_IF;
		
	END_IF;
END_ACTION