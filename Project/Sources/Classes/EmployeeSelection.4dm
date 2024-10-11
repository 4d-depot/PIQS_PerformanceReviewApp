Class extends EntitySelection

exposed Function generateAllReview()
	$employees:=ds:C1482.Employee.all()  // Todo ajout active status
	
	For each ($employee; $employees)
		$review:=ds:C1482.Review.new()
		$review.Review.createReview($employee.ID)
	End for each 
	
	
exposed Function generatePDF()
	$employees:=ds:C1482.Employee.all()
	For each ($employee; $employees)
		
		
		$sel:=ds:C1482.Review.query("ID_Employee = :1 AND DocumentPDF is not null AND ID_Status = :2"; $employee.ID; 3).orderBy("Date desc")
		
		$review:=$sel.firsl()
		$review.Review.generatePDF()
	End for each 