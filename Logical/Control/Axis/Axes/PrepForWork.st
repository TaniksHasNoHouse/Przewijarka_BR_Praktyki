
ACTION actPrepForWork:
	FOR i := 0 TO 2 DO
		IF Axis[i].AxisBasic.Error THEN
			Control.Step[i] := ERROR;
		END_IF;
		CASE Control.Step OF
			COMMUNICATION:
				IF Axis[i].AxisBasic.Info.CommunicationReady AND Axis[i].AxisBasic.Info.ReadyToPowerOn THEN
	  				Control.Step[i] := HOME;
				END_IF;
			HOME: 
				Axis[i].AxisBasic.Home := TRUE;
				IF Axis[i].AxisBasic.IsHomed THEN
					Axis[i].AxisBasic.Home := FALSE;
					Control.Step[i] := POWER;
				END_IF;
			POWER:
				Axis[i].AxisBasic.Power := TRUE;
				IF Axis[i].AxisBasic.PowerOn THEN
	  				Control.Step[i] := READY_FOR_USE;
				END_IF;
			ERROR:
				Axis[i].AxisBasic.Power := FALSE;
				Control.Step[i] := ERROR_RESET;
			ERROR_RESET:
				Axis[i].AxisBasic.ErrorReset := TRUE;
				IF Axis[i].AxisBasic.Error THEN
					Axis[i].AxisBasic.ErrorReset := FALSE;
					Control.Step[i] := COMMUNICATION
				END_IF;
		END_CASE;
	END_FOR;
END_ACTION
