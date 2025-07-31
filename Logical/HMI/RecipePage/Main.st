
PROGRAM _INIT
	MpRecepieXml_0.Enable := TRUE;
	MpRecepieXml_0.MpLink := ADR(MpLinkRecipes);
	MpRecepieXml_0.DeviceName := ADR('RECIPE');
	
	MpRecipeRegPar_0.Enable := TRUE;
	MpRecipeRegPar_0.MpLink := ADR(MpLinkRecipes);
	MpRecipeRegPar_0.PVName := ADR('gHMI.Recipe.CurrentRecipe');	
	
	MpRecipeUI_0.Enable := TRUE;
	MpRecipeUI_0.MpLink := ADR(MpLinkRecipes);
	MpRecipeUI_0.UIConnect := ADR(UIConnect);
	
	UIConnect.Recipe.Filter := '*.xml';
END_PROGRAM

PROGRAM _CYCLIC
	MpRecepieXml_0();
	MpRecipeRegPar_0();
	MpRecipeUI_0();
	actRecipeManage;
	
	RecipeControl.LoadRecipe := '';
	brsstrcat(ADR(RecipeControl.LoadRecipe), ADR('USER/'));
	brsstrcat(ADR(RecipeControl.LoadRecipe), ADR(MpRecepieXml_0.Info.LastLoadedRecipe));
	 
	IF UIConnect.Recipe.List.SelectedIndex >=3 THEN
		RecipeControl.TableControl.Offset := UIConnect.Recipe.List.SelectedIndex - 3; 
	ELSE
		RecipeControl.TableControl.Offset := 0;
	END_IF;
	
	actImageBinding;
	
	IF MpRecepieXml_0.Error THEN
		MpRecepieXml_0.ErrorReset := TRUE;
	ELSE
		MpRecepieXml_0.ErrorReset := FALSE;
	END_IF;
	
	IF MpRecipeRegPar_0.Error THEN
		MpRecipeRegPar_0.ErrorReset := TRUE;
	ELSE
		MpRecipeRegPar_0.ErrorReset := FALSE;
	END_IF;
	
	IF MpRecipeUI_0.Error THEN
		MpRecipeUI_0.ErrorReset := TRUE;
	ELSE
		MpRecipeUI_0.ErrorReset := FALSE;
	END_IF;
END_PROGRAM

PROGRAM _EXIT
	MpRecepieXml_0.Enable := FALSE;
	MpRecepieXml_0();
	MpRecipeRegPar_0.Enable := FALSE;
	MpRecipeRegPar_0();	
	MpRecipeUI_0.Enable := FALSE;
	MpRecipeUI_0();
END_PROGRAM

