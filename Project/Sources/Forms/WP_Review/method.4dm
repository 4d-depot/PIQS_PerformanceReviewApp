
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		Case of 
			: (Form:C1466.type="Template")
				WParea:=WP New:C1317(Form:C1466.template.Template)
				
			: (Form:C1466.type="Compute")
				WParea:=WP New:C1317(Form:C1466.context.review.Document)
				WP SET DATA CONTEXT:C1786(WParea; Form:C1466.context)
				WP COMPUTE FORMULAS:C1707(WParea)
				
			: (Form:C1466.type="Freeze")
				WParea:=WP New:C1317(Form:C1466.DocumentFreeze)
				
		End case 
		
		
End case 