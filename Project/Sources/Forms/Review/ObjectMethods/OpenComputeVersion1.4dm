
var $context : Object:=New object:C1471
var $review : Object
var $hwd : Integer

If (Form:C1466.CurrentReview=Null:C1517)
	ALERT:C41("Selectionne une review.")
	
Else 
	
	
	$review:=New object:C1471("review"; Form:C1466.CurrentReview)
	$hwd:=Open form window:C675("FormReview"; Plain form window:K39:10)
	DIALOG:C40("FormReview"; $review)
	
End if 