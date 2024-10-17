
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		Case of 
			: (Form:C1466.type="Template")
				WParea:=WP New:C1317(Form:C1466.template.Template)
				
				$context:=ds:C1482.Review.get(102).createContext()
				WP SET DATA CONTEXT:C1786(WParea; $context)
				WP COMPUTE FORMULAS:C1707(WParea)
				
				
			: (Form:C1466.type="Compute")
				WParea:=WP New:C1317(Form:C1466.review.Document)
				
				$context:=Form:C1466.review.createContext()
				WP SET DATA CONTEXT:C1786(WParea; $context)
				WP COMPUTE FORMULAS:C1707(WParea)
				
			: (Form:C1466.type="Freeze")
				WParea:=WP New:C1317(Form:C1466.review.DocumentFreeze)
				
		End case 
		
		Form:C1466.WPexpression:=JSON Parse:C1218(File:C1566("/RESOURCES/4DWP_Wizard/WPexpression.json").getText()).expression
		Form:C1466.dropFormula:=New object:C1471
		Form:C1466.dropFormula.values:=Form:C1466.WPexpression.extract("name")
		Form:C1466.dropFormula.index:=-1
		Form:C1466.dropFormula.currentValue:="Select a formula"
		
End case 