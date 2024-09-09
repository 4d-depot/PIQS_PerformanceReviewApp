Class extends EntitySelection

exposed Function generateAllReview()
	$employees:=ds:C1482.Employee.all()  // Todo ajout active status
	
	For each ($employee; $employees)
		$review:=ds:C1482.Review.new()
		$review.Review.createReview($employee.ID)
	End for each 