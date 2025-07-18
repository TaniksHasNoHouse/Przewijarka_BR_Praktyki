
PROGRAM _INIT
	actInitAxes;
END_PROGRAM

PROGRAM _CYCLIC
	actPrepForWork;
	FOR i := 0 TO 2 DO
		IF Control.Step[i] = READY_FOR_USE THEN
			Control.Step[i] = WAIT_FOR_COMMAND;	
		END_IF;
		CASE Control.Step[i] OF
			WAIT_FOR_COMMAND:
		END_CASE;
		Axis[0].AxisBasic.MpLink := ADR(gAxis_1);
		Axis[1].AxisBasic.MpLink := ADR(gAxis_2);
		Axis[2].AxisBasic.MpLink := ADR(gAxis_3);
		Axis[i].AxisBasic.Parameters := ADR(Axis[i].AxisPar.Deafult);
		Axis[i].AxisBasic();
	END_FOR;
END_PROGRAM

PROGRAM _EXIT
	 
END_PROGRAM

