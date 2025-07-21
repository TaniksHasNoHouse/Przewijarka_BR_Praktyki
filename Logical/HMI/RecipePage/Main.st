
PROGRAM _INIT
	MpRecepieXml_0.Enable := TRUE;
	MpRecepieXml_0.MpLink := ADR(MpLinkRecipes);
	MpRecepieXml_0.DeviceName := ADR('Recipe');
	MpRecepieXml_0.FileName := ADR('RecipePage');
	
	MpRecipeRegPar_0.Enable := TRUE;
	MpRecipeRegPar_0.MpLink := ADR(MpLinkRecipes);
	MpRecipeRegPar_0.PVName := ADR('RecipePage:MaterialWindingRecipe');
	
	MpRecipeUI_0.Enable := TRUE;
	MpRecipeUI_0.MpLink := ADR(MpLinkRecipes);
	MpRecipeUI_0.UIConnect := ADR(UIConnect);
END_PROGRAM

PROGRAM _CYCLIC
	MpRecepieXml_0();
	MpRecipeRegPar_0();
	MpRecipeUI_0();
	 
	actImageBinding;
END_PROGRAM

PROGRAM _EXIT
	MpRecepieXml_0.Enable := FALSE;
	MpRecepieXml_0();
	MpRecipeRegPar_0.Enable := FALSE;
	MpRecipeRegPar_0();	
	MpRecipeUI_0.Enable := FALSE;
	MpRecipeUI_0();
END_PROGRAM

