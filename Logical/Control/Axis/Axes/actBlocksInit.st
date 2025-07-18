
ACTION actBlocksInit:
	FOR i := 0 TO 2 DO
		Axis[i].AxisBasic.Parameters := ADR(Axis[i].AxisPar.Deafult);
		Axis[i].AxisBasic();
	END_FOR;
	Axis[0].AxisBasic.MpLink := ADR(gAxis_1);
	Axis[1].AxisBasic.MpLink := ADR(gAxis_2);
	Axis[2].AxisBasic.MpLink := ADR(gAxis_3);
	
END_ACTION
