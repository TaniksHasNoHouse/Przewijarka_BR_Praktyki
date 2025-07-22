
ACTION actImageBinding: 
	ImageDirectory.LeftArrow := 'Media/SymbolLib/Arrow/ArrowLeft.svg';
	ImageDirectory.RightArrow := 'Media/SymbolLib/Arrow/ArrowRight.svg';
	ImageDirectory.On := 'Media/SymbolLib/Symbols/Accept.svg';
	ImageDirectory.Off := 'Media/SymbolLib/Edit/Close.svg';
	
	IF MaterialWindingRecipe.Direction = TRUE THEN
		ImageDirectory.Current.CurrentArrow := ImageDirectory.RightArrow;
	ELSE 
		ImageDirectory.Current.CurrentArrow := ImageDirectory.LeftArrow;
	END_IF;
	
	IF MaterialWindingRecipe.DataRegistration = TRUE THEN
		ImageDirectory.Current.CurrentOnOff := ImageDirectory.On;
	ELSE
		ImageDirectory.Current.CurrentOnOff := ImageDirectory.Off;
	END_IF;
	
END_ACTION
