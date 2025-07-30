
ACTION actImageBinding: 
	ImageDirectory.On := 'Media/SymbolLib/Symbols/Accept.svg';
	ImageDirectory.Off := 'Media/SymbolLib/Edit/Close.svg';
	
	
	IF gHMI.Recipe.CurrentRecipe.DataRegistration = TRUE THEN
		ImageDirectory.Current.CurrentOnOff := ImageDirectory.On;
	ELSE
		ImageDirectory.Current.CurrentOnOff := ImageDirectory.Off;
	END_IF;
	
END_ACTION
