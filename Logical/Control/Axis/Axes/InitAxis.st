
ACTION actInitAxes: 
	FOR i := 0 TO 2 DO
		Axis[i].AxisBasic.Enable := TRUE;
		Axis[i].AxisPar.Deafult.Acceleration := 20.0;
		Axis[i].AxisPar.Deafult.Deceleration := 20.0;
		Axis[i].AxisPar.Deafult.Position := 10.0;
		Axis[i].AxisPar.Deafult.Distance := 20;
		Axis[i].AxisPar.Deafult.Homing.Mode := mcHOMING_DIRECT;
		Axis[i].AxisPar.Deafult.Homing.Position := 0;
	END_FOR;
END_ACTION
