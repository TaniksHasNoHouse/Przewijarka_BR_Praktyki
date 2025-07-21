
ACTION actManIdle: 
	// odpalenie mozliwosci ruszania wszystkim
	// proponuje dwie opcje: 1 nawiajnie recznie ze sterowaniem trzema osiami
	// 						 2 ruszanie kazda z osi osobno
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_IDLE, PACKML_MODE_ALL) THEN
		
		
	  
	END_IF;
	
END_ACTION
