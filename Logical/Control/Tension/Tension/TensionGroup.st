PROGRAM _INIT
    
	(**************************************************   walkowskij, Review   **************************************************)
	
	// "The PV 'gAxis_x' does not exist" - blad spowodowany brakiem ponizszych zmiennych w pamieci PLC, wystarczy uzyc w kodzie
	// przyszlosciowo -> w kodzie przyda sie uzyc MpAxisBasic i przypiac te zmienne zeby moc sterowac recznie jogiem bo MpTension chyba tego nie umozliwia
	gAxis_1;
	gAxis_2;
	gAxis_3;
	
	//blad 6804 - Memory access violation occurred
	// w AutomationHelp opis prowadzi do bledow 6801, 6802 or 6803
	// chodzi o to, ze task uzytkownika (i bloki funkcyjne w nim zawarte) potrzebuja wiecej pamieci stosu (STACK) niz jest dostepne w danej task classie
	// X20CP0483->Configuration->Resources->Cyclic task classes->Cyclic #1 -> Stack -> zmienilem z domyslnego 8192 na 30000 i wyglada na to, ze pomoglo
	
	
	//-1064291125: "Linked components" error
	// blad spowodowany tym, ze w kodzie mieliscie wywolanie najpierw bloku funkcyjnego TensionGroup a dopiero nizej TensionController
	// z grupami w mappach jest tak, ze najpierw trzeba wywolywac bloki wszystkich blokow nalezacych do grupy a dopiero potem blok calej grupy
	// zamienilem miejscami i juz jest ok
	
	
	//Nie potrzebujecie bloku MTWinderDancerController
	// Dancer da sie obsluzyc przez MpTensionController -> w konfiguracji mappy jest to ustawione i wystarczy zmappowac odpowiednie zmienne
	// generalnie biblioteka MTWinder jest starszym rozwiazaniem, ktore jest zastapione przez MpTension
	// najlepiej usunac biblioteki MtWinder i MtTypes z projektu zeby nie bylo konfliktow z bibliotekami Mp
	
	
	(**************************************************   review end   **************************************************)
	
	TensionController[0].MpLink := ADR(gTensionCtrl_Unwinder);
	TensionController[1].MpLink := ADR(gTensionCtrl_Master);
	TensionController[2].MpLink := ADR(gTensionCtrl_Rewinder);
	TensionGroup.MpLink := ADR(gTensionGroup_1);
  
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
    
		TensionController[i].Enable := TRUE;

	END_FOR;
    
	GroupLineVelocity := 0.0;
  
END_PROGRAM

PROGRAM _CYCLIC
	IF TensionGroup.Error THEN
	  step := ERROR;
	END_IF;
	GroupLineVelocity := gLineSpeed;
	CASE step OF
		INIT:
			TensionGroup.Enable := TRUE;
			TensionGroup.Home := FALSE;
			TensionGroup.Power := FALSE;
			step := HOME;
		HOME:	
			TensionGroup.Home := TRUE;
			IF TensionGroup.IsHomed THEN
				TensionGroup.Home := FALSE;
				step := POWER;
			END_IF;
		POWER:
			TensionGroup.Power := TRUE;
			IF TensionGroup.PowerOn THEN
				step := WAIT_FOR_COMMAND;
			END_IF;
			
		WAIT_FOR_COMMAND:
			IF TensionGroup.InLineVelocity THEN
	  			TensionGroup.Control := TRUE;
			END_IF;
			GroupLineVelocity := gLineSpeed;
		ERROR:
			TensionGroup.Power := FALSE;
			TensionGroup.Home := FALSE;
			step := ERROR_RESET;
		ERROR_RESET:
			TensionGroup.ErrorReset := TRUE;
			IF NOT TensionGroup.Error THEN
				TensionGroup.ErrorReset := FALSE;
				step := INIT;
			END_IF;
	END_CASE;
	
	Analog1;
	Analog2;
	
	
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
		TensionController[i]();
	END_FOR;
	TensionGroup();
  

     
END_PROGRAM

PROGRAM _EXIT
    
	TensionGroup.Enable := FALSE;
	TensionGroup();
  
	FOR i := 0 TO INDEX_NR_OF_ZONES DO
    
		TensionController[i].Enable := FALSE;
		TensionController[i]();

	END_FOR;
     
END_PROGRAM

