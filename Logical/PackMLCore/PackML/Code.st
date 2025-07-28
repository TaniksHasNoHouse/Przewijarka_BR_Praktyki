
PROGRAM _INIT
	(* Insert code here *)
	MpPackMLCore_0(MpLink := ADR(gPackMLCore), Enable := TRUE);
	MpPackMLMode_0(MpLink := ADR(gPackMLCore), Enable := TRUE);
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	MpPackMLCore_0(); 
	MpPackMLMode_0(MpLink := ADR(gPackMLCore), Enable := TRUE, ModeID := PACKML_MODE_PRODUCTION);
	MpPackMLMode_1(MpLink := ADR(gPackMLCore), Enable := TRUE, ModeID := PACKML_MODE_MANUAL);
	actGetStatus;
	actInterface;
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	MpPackMLCore_0(Enable := FALSE);
	MpPackMLMode_0(Enable := FALSE);
END_PROGRAM

