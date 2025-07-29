//ACTION actInterface:
//	IF gHMI.ControlBtn.AutoManual THEN
//		MpPackMLMode_0.ModeID := PACKML_MODE_MANUAL;
//	ELSE
//		MpPackMLMode_0.ModeID := PACKML_MODE_PRODUCTION;
//	END_IF;
//END_ACTION

ACTION actInterface:
// Zerowanie obu wejœæ Activate na pocz¹tku cyklu (zalecane!)
	MpPackMLMode_0.Activate := FALSE;
	MpPackMLMode_1.Activate := FALSE;

	// Maszyna stanów
	CASE step OF

		0: // STAN OCZEKIWANIA NA ZMIANÊ PRZYCISKU
			// Detekcja zbocza narastaj¹cego (0 -> 1)
			IF (NOT prevBtn) AND gHMI.ControlBtn.AutoManual THEN
				MpPackMLMode_1.Activate := TRUE;  // aktywuj na 1 cykl Mode_1
				step := 1;
				// Detekcja zbocza opadaj¹cego (1 -> 0)
			ELSIF prevBtn AND (NOT gHMI.ControlBtn.AutoManual) THEN
				MpPackMLMode_0.Activate := TRUE;  // aktywuj na 1 cykl Mode_0
				step := 2;
			END_IF

		1: // MODE_1: impuls Activate wys³any, zerujemy w nastêpnym cyklu
			MpPackMLMode_1.Activate := FALSE;
			step := 0;

		2: // MODE_0: impuls Activate wys³any, zerujemy w nastêpnym cyklu
			MpPackMLMode_0.Activate := FALSE;
			step := 0;
	END_CASE;

	// Zapamiêtaj stan przycisku na kolejn¹ iteracjê
	prevBtn := gHMI.ControlBtn.AutoManual;

END_ACTION