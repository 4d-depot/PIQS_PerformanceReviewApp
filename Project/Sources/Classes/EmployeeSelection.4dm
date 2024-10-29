Class extends EntitySelection

exposed Function generateAllReview($year : Integer)
	var $employees : cs:C1710.EmployeeSelection
	var $employee : cs:C1710.EmployeeEntity
	var $review : cs:C1710.ReviewEntity
	
	$employees:=ds:C1482.Employee.query("isActive = :1"; True:C214)
	For each ($employee; $employees)
		$review:=ds:C1482.Review.new()
		$review.createReview($employee.ID; $year)
	End for each 
	
	
exposed Function generateAllPDF($year : Integer)
	var $reviews : cs:C1710.ReviewSelection
	var $review : cs:C1710.ReviewEntity
	
	$reviews:=ds:C1482.Review.query("Employee.isActive = :1 AND ID_Status = :2 AND Date >= :3 AND Date <= :4 )"; True:C214; 3; String:C10($year)+"/01/01"; String:C10($year)+"/12/31")
	For each ($review; $reviews)
		$review.generatePDF()
	End for each 
	