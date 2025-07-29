
ACTION actDisplayFiles: 
	MpRecepieXml_Data.Enable := TRUE;
	MpRecepieXml_Data.MpLink := ADR(MpLinkRecipes);
	MpRecepieXml_Data.DeviceName := ADR('DATA');
	
	MpRecipeUI_Data.Enable := TRUE;
	MpRecipeUI_Data.MpLink := ADR(MpLinkRecipes);
	MpRecipeUI_Data.UIConnect := ADR(UIConnectData);
	
	UIConnectData.Recipe.Filter := '*.csv';
	
	MpRecepieXml_Data();
	MpRecipeUI_Data();

END_ACTION
