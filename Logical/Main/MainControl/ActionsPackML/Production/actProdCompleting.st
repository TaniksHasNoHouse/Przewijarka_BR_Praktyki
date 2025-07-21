
ACTION actProductionCompleting: 
	// czeka az dojedzie do konca i zatrzymuje wszystko i przechodzi do complete
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_COMPLETING, PACKML_MODE_ALL) THEN
		
		
	  
	END_IF;
END_ACTION
