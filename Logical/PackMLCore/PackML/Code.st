
PROGRAM _INIT
	(* Insert code here *)
	MpPackMLCore_0(MpLink := ADR(gPackMLCore), Enable := TRUE);
	MpPackMLMode_0(MpLink := ADR(gPackMLCore), Enable := TRUE);
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	MpPackMLCore_0(); 
	MpPackMLMode_0(MpLink := ADR(gPackMLCore), Enable := TRUE ,ModeID := PACKML_MODE_PRODUCTION, Start := gMainLogic.Cmd.Start, Stop := gMainLogic.Cmd.Stop, Reset := gMainLogic.Cmd.Reset, Abort := gMainLogic.Cmd.Abort);
	MpPackMLMode_1(MpLink := ADR(gPackMLCore), Enable := TRUE, ModeID := PACKML_MODE_MAINTENANCE, Start := gMainLogic.Cmd.Start, Stop := gMainLogic.Cmd.Stop, Reset := gMainLogic.Cmd.Reset, Abort := gMainLogic.Cmd.Abort);
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	MpPackMLCore_0(Enable := FALSE);
	MpPackMLMode_0(Enable := FALSE);
	MpPackMLMode_1(Enable := FALSE);
END_PROGRAM

