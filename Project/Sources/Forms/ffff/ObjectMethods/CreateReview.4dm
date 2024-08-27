
var $context : Object:=New object:C1471

If (Form:C1466.CurrentReview=Null:C1517)
	ALERT:C41("Selectionne la dernière review.")
	
Else 
	
	// Create review
	//var $review : cs.ReviewEntity
	//$review:=ds.Review.new()
	//$review.createReview(Form.CurrentEmployee.ID)
	
	$review:=ds:C1482.Review.get(16)
	
	// Generate skill
	$obj:=New object:C1471
	$skillSettings:=ds:C1482.Settings.query("ID = :1"; Form:C1466.CurrentEmployee.Departement.ID).first().Skill
	
	For each ($obj; $skillSettings.skill)
		
		For each ($name; $obj.value)
			$skill:=ds:C1482.Skill.new()
			$skill.Name:=$name
			$skill.Group:=$obj.group
			$skill.ID_Score:=(Random:C100%4)+1
			$skill.ID_Review:=$review.ID
			$skill.save()
			
		End for each 
		
	End for each 
	
	
	
	
End if 