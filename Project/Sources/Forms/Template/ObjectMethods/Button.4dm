var $context : Object:=New object:C1471
var $hwd : Integer

If (Form:C1466.CurrentTemplate=Null:C1517)
	ALERT:C41("Select template.")
	
Else 
	
	If (Form:C1466.WPexpression=Null:C1517)
		Form:C1466.WPexpression:=JSON Parse:C1218(File:C1566("/RESOURCES/4DWP_Wizard/WPexpression.json").getText()).expression
		Form:C1466.dropFormula:=New object:C1471
		Form:C1466.dropFormula.values:=Form:C1466.WPexpression.extract("name")
		Form:C1466.dropFormula.index:=-1
		Form:C1466.dropFormula.currentValue:="Select a formula"
	End if 
	
	WParea:=WP New:C1317(Form:C1466.CurrentTemplate.Template)
	
	$context:=ds:C1482.Review.get(102).createContext()
	WP SET DATA CONTEXT:C1786(WParea; $context)
	WP COMPUTE FORMULAS:C1707(WParea)
	
End if 