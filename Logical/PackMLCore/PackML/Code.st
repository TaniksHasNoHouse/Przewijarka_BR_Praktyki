
PROGRAM _INIT
	(* Insert code here *)
	MpPackMLCore_0(MpLink := ADR(gPackMLCore), Enable := TRUE);
	MpPackMLMode_0(MpLink := ADR(gPackMLCore), Enable := TRUE ,ModeID := 2);
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	MpPackMLCore_0(MpLink := ADR(gPackMLCore), Enable := TRUE); 
	MpPackMLMode_0(MpLink := ADR(gPackMLCore), Enable := TRUE ,ModeID := 1, );
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	MpPackMLCore_0(MpLink := ADR(gPackMLCore), Enable := FALSE);
	MpPackMLMode_0(MpLink := ADR(gPackMLCore), Enable := FALSE);
END_PROGRAM

