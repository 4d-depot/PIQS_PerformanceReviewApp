
var $context : Object:=New object:C1471

If (Form:C1466.CurrentReview=Null:C1517)
	ALERT:C41("Selectionne une review.")
	
Else 
	
	$context.type:="Compute"
	$context.context:=Form:C1466.CurrentReview.createContext()
	
	Open form window:C675("WP_Review")
	DIALOG:C40("WP_Review"; $context)
	
End if 