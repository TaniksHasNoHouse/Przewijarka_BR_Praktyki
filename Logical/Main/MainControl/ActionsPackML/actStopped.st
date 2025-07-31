ACTION actStopped:
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STOPPED, PACKML_MODE_ALL) THEN
    
			
			gMainLogic.MotorMode.Production.Parameter.Velocity := 0.0;

			gMainLogic.MotorMode.Production.Cmd.Home := FALSE;
			gMainLogic.MotorMode.Production.Cmd.Reset := FALSE;
		
			gMainLogic.MotorMode.Production.Cmd.PowerOn := FALSE;

//			gMainLogic.MotorMode.Manual.Axis1.Cmd.PowerOn := FALSE;
//			gMainLogic.MotorMode.Manual.Axis2.Cmd.PowerOn := FALSE;
//			gMainLogic.MotorMode.Manual.Axis3.Cmd.PowerOn := FALSE;
//			gMainLogic.MotorMode.Manual.Axis1.Cmd.Enable := FALSE;
//			gMainLogic.MotorMode.Manual.Axis2.Cmd.Enable := FALSE;
//			gMainLogic.MotorMode.Manual.Axis3.Cmd.Enable := FALSE;
		
			// cala linia zeby ruszyc -> enable -> home -> power on -> start winding 
	END_IF;
END_ACTION