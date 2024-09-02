
var $context : Object:=New object:C1471

If (Form:C1466.CurrentReview=Null:C1517)
	ALERT:C41("Selectionne une review.")
	
Else 
	
	Form:C1466.CurrentReview.generateFreezeDocument()
	
End if 