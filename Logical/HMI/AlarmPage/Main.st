

PROGRAM _INIT
	(* MpLink przekazujemy przez referencjê ADR *)
	MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := TRUE);
END_PROGRAM

PROGRAM _CYCLIC
	(* Tu wrzucamy warunki do wywo³añ alarmów*)
	MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := TRUE);
	MpAlarmXCore_0();
END_PROGRAM

PROGRAM _EXIT
	(* W sekcji exit trzeba wywo³aæ/wy³aczyæ blok funkcyjny (Enable := FALSE) *)
	MpAlarmXCore_0(MpLink := ADR(gAlarmXCore), Enable := FALSE);
END_PROGRAM

