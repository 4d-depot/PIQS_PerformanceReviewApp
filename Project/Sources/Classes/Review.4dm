Class extends DataClass

Function event restrict() : cs:C1710.ReviewSelection
	var $obj : Object
	
	If (Session:C1714=Null:C1517)
		$obj:=Storage:C1525
	Else 
		$obj:=Session:C1714.storage
	End if 
	
	If ($obj.Employee.role=Null:C1517)
		return Null:C1517
	End if 
	
	Case of 
		: (($obj.Employee.role="HR") && (Session:C1714.hasPrivilege("hr")))
			return This:C1470.all().orderBy("Date desc")
			
		: ($obj.Employee.role="Manager")
			return This:C1470.query("Employee.ID_Supervisor = :1"; $obj.Employee.ID).orderBy("Date desc")
			
		: ($obj.Employee.role="Collaborator")
			return This:C1470.query("ID_Employee = :1"; $obj.Employee.ID).orderBy("Date desc")
			
		Else 
			return Null:C1517
			
	End case 
	
exposed Function loadReviews($departement : cs:C1710.DepartementEntity; $year : Integer; $status : cs:C1710.ReviewStatusEntity) : cs:C1710.ReviewSelection
	
	Case of 
		: (($departement=Null:C1517) & ($status=Null:C1517))
			return This:C1470.query("Date >= :1 AND Date <= :2"; String:C10($year)+"/01/01"; String:C10($year)+"/12/31")
			
		: (($Departement#Null:C1517) && ($status=Null:C1517))
			return This:C1470.query("Employee.ID_Departement = :1 AND Date >= :2 AND Date <= :3"; $departement.ID; String:C10($year)+"/01/01"; String:C10($year)+"/12/31")
			
		: (($Departement=Null:C1517) && ($status#Null:C1517))
			return This:C1470.query("ID_Status = :1 AND Date >= :2 AND Date <= :3"; $status.ID; String:C10($year)+"/01/01"; String:C10($year)+"/12/31")
			
		: (($Departement#Null:C1517) && ($status#Null:C1517))
			return This:C1470.query("Employee.ID_Departement = :1 AND ID_Status = :2 AND Date >= :3 AND Date <= :4"; $Departement.ID; $status.ID; String:C10($year)+"/01/01"; String:C10($year)+"/12/31")
			
	End case 
	
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
	
	$reviews:=This:C1470.query("Employee.isActive = :1 AND ID_Status = :2 AND Date >= :3 AND Date <= :4 )"; True:C214; 3; String:C10($year)+"/01/01"; String:C10($year)+"/12/31")
	For each ($review; $reviews)
		$review.generatePDF()
	End for each 
	
	