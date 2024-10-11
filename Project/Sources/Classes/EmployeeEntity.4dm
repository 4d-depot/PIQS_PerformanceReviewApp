Class extends Entity

exposed Function get lastReview->$last : Object
	$last:=New object:C1471
	$sel:=ds:C1482.Review.query("ID_Employee = :1"; This:C1470.ID).orderBy("Date desc")
	If ($sel.length>0)
		$last.Date:=$sel.first().Date
		$last.Status:=$sel.first().Status.Name
	End if 