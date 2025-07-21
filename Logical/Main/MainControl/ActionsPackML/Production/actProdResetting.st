
ACTION actProductionResetting: 
 //  odpalic regulator (zasilic osie) i wylaczyc wyjscia (tak zeby nic sie nie poruszalo)
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_RESETTING, PACKML_MODE_ALL) THEN
		
		
	  
	END_IF;
END_ACTION
