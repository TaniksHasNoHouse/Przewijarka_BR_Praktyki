
ACTION actPrepForWork:
	FOR i := 0 TO 2 DO
		IF Tension.TensionController[i].Error THEN
			Control.Step[i] := ERROR;
		END_IF;
		CASE Control.Step[i] OF
			COMMUNICATION:
				IF Axis[i].AxisBasic.Info.CommunicationReady AND Axis[i].AxisBasic.Info.ReadyToPowerOn AND Tension.TensionController[i].ControlBusy AND Tension.TensionGroup.ControlBusy THEN
	  				Control.Step[i] := HOME;
				END_IF;
			HOME: 
				Tension.TensionGroup.Home := TRUE;
				IF Tension.TensionGroup.IsHomed THEN
					Tension.TensionGroup.Home := FALSE;
					Control.Step[i] := POWER;
				END_IF;
			POWER:
				Tension.TensionGroup.Power := TRUE;
				IF Tension.TensionGroup.PowerOn THEN
	  				Control.Step[i] := READY_FOR_USE;
				END_IF;
			ERROR:
				Tension.TensionGroup.Power := FALSE;
				Control.Step[i] := ERROR_RESET;
			ERROR_RESET:
				Tension.TensionGroup.ErrorReset := TRUE;
				IF Tension.TensionGroup.Error THEN
					Tension.TensionGroup.ErrorReset := FALSE;
					Control.Step[i] := COMMUNICATION;
				END_IF;
		END_CASE;
	END_FOR;
END_ACTION
