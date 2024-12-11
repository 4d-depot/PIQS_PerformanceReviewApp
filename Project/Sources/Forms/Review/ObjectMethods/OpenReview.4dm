
var $context : Object:=New object:C1471
var $review : Object
var $hwd : Integer

If (Form:C1466.CurrentReview=Null:C1517)
	ALERT:C41("Select a review.")
	
Else 
	
	$review:=New object:C1471("review"; Form:C1466.CurrentReview)
	$hwd:=Open form window:C675("FormReview"; Plain form window:K39:10)
	SET WINDOW TITLE:C213("Review: "+Form:C1466.CurrentReview.Employee.Firstname+" "+Form:C1466.CurrentReview.Employee.Lastname+" - "+String:C10(Form:C1466.CurrentReview.Date; "y"); $hwd)
	DIALOG:C40("FormReview"; $review)
	
End if 