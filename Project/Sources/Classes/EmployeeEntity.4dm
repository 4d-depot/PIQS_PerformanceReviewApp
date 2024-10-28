Class extends Entity

exposed Function get lastReview->$last : Object
	var $sel : cs:C1710.ReviewSelection
	
	$last:=New object:C1471
	$sel:=ds:C1482.Review.query("ID_Employee = :1"; This:C1470.ID).orderBy("Date desc")
	If ($sel.length>0)
		//$last.Date:=$sel.first().Date
		$last.Date:=String:C10($sel.first().Date; System date abbreviated:K1:2)
		$last.Status:=$sel.first().Status.Name
	End if 