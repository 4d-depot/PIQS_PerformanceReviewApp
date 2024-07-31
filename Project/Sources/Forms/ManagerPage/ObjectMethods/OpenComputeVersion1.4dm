
var $context : Object:=New object:C1471

If (Form:C1466.CurrentReview=Null:C1517)
	ALERT:C41("Selectionne une review.")
	
Else 
	
	var $review : Object
	$review:=New object:C1471("review"; Form:C1466.CurrentReview)
	Open form window:C675("Review"; Plain form window:K39:10)
	DIALOG:C40("Review"; $review)
	
End if 