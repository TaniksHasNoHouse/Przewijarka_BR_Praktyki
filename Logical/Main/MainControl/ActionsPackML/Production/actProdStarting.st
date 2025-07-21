
ACTION actProductionStarting: 
	//wlaczyc regulator naciagu (densery sie podnosza)
	//zadany naciag w paramaterach osiagniety jak jest utrzymany stabilnie (jako paraetr) 1s 
	//np bedzie stabilny i naciag bedzie trzymany 
	//TO pod koniec startingu bedzie sprawdzany 
	//jesli bedzie stabilnie TO execugte i dopiero tam sie kreci
	IF MpPackMLStateIsActive(gPackMLCore, mpPACKML_STATE_STARTING, PACKML_MODE_ALL) THEN
		
		
	  
	END_IF;
END_ACTION
