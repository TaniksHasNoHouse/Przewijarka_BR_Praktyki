
PROGRAM _INIT
	(* Insert code here *)
    
	Tension.TensionController[0].MpLink := ADR(gTensionCtrl_Unwinder);
	Tension.TensionController[1].MpLink := ADR(gTensionCtrl_TransportDancer);
	Tension.TensionController[4].MpLink := ADR(gTensionCtrl_Rewinder);
	Tension.TensionGroup.MpLink := ADR(gTensionGroup_1);
  
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
    
		Tension.TensionController[i].Enable := TRUE;

	END_FOR;
    
	Tension.GroupLineVelocity := 0.0;
END_PROGRAM

PROGRAM _CYCLIC
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
		CASE Control.WorkStep[i] OF
			WAIT_FOR_WORK_COMMAND:
				IF TestAll THEN
	  				Control.WorkStep[i] := TEST_COMMAND;
				END_IF;
			TEST_COMMAND:
				Tension.TensionController[0].MoveVelocity := TRUE;
				IF NOT TestAll THEN
					Control.WorkStep[i] := WAIT_FOR_WORK_COMMAND;
					Tension.TensionController[0].MoveVelocity := FALSE;
				END_IF;
		END_CASE;

	END_FOR;
	
    
	Tension.TensionGroup();
  
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
    
		Tension.TensionController[i]();

	END_FOR;

END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	    
	Tension.TensionGroup.Enable := FALSE;
	Tension.TensionGroup();
  
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
    
		Tension.TensionController[i].Enable := FALSE;
		Tension.TensionController[i]();

	END_FOR;
     
END_PROGRAM

