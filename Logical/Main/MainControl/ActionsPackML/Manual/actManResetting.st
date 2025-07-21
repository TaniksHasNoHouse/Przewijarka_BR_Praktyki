
ACTION actManResetting: 
	//Resetting nic sie nie zasila i przechodzi do IDLE (pozniej sprawdzic czy soft dziala)
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_RESETTING, PACKML_MODE_ALL) THEN
		
		
	  
	END_IF;
END_ACTION
