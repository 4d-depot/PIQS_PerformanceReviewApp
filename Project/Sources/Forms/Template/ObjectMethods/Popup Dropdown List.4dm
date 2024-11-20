Case of 
		
	: (Form event code:C388=On Clicked:K2:4)
		var $range : Object
		
		GOTO OBJECT:C206(*; "WParea")
		
		$range:=WP Selection range:C1340(*; "WParea")
		WP Insert formula:C1703($range; Formula from string:C1601(Form:C1466.WPexpression[Form:C1466.dropFormula.index].formula); wk replace:K81:177)
		
End case 