
PROGRAM _INIT
	HMI.ManualPage.Buttons.Strings.OFF := 'OFF';
	HMI.ManualPage.Buttons.Strings.ON := 'ON';
	 
END_PROGRAM

PROGRAM _CYCLIC
	IF HMI.ManualPage.Buttons.Mot1Active = TRUE THEN
		HMI.ManualPage.Buttons.Strings.Btn1 := HMI.ManualPage.Buttons.Strings.ON;
	ELSE
		HMI.ManualPage.Buttons.Strings.Btn1 := HMI.ManualPage.Buttons.Strings.OFF;
	END_IF;
	
	IF HMI.ManualPage.Buttons.Mot2Active = TRUE THEN
		HMI.ManualPage.Buttons.Strings.Btn2 := HMI.ManualPage.Buttons.Strings.ON;
	ELSE
		HMI.ManualPage.Buttons.Strings.Btn2 := HMI.ManualPage.Buttons.Strings.OFF;
	END_IF;
	
	IF HMI.ManualPage.Buttons.Mot3Active = TRUE THEN
		HMI.ManualPage.Buttons.Strings.Btn3 := HMI.ManualPage.Buttons.Strings.ON;
	ELSE
		HMI.ManualPage.Buttons.Strings.Btn3 := HMI.ManualPage.Buttons.Strings.OFF;
	END_IF;
	
	 
END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM

