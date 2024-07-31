
var $context : Object:=New object:C1471

If (Form:C1466.CurrentReview=Null:C1517)
	ALERT:C41("Selectionne la dernière review.")
	
Else 
	
	// Create review
	
	//$review:=ds.Review.new()
	//$review.ID_Employee:=Form.CurrentReview.ID_Employee
	//$review.ID_PreviousReview:=Form.CurrentReview.ID
	//$review.save()
	
	// Generate skill
	$obj:=New object:C1471
	$skillSettings:=ds:C1482.Settings.query("ID = :1"; Form:C1466.CurrentReview.Employee.Departement.ID).first().Skill
	
	For each ($obj; $skillSettings.skill)
		$skillGroup:=ds:C1482.SkillGroup.new()
		$skillGroup.Name:=$obj.group
		$skillGroup.save()
		
		For each ($name; $obj.value)
			$skill:=ds:C1482.Skill.new()
			$skill.Name:=$name
			$skill.ID_SkillGroup:=$skillGroup.ID
			$skill.ID_Review:=$review.ID
			$skill.save()
			
		End for each 
		
	End for each 
	
	
	
	
	// Create context
	//$context.context:=New object
	//$context.type:="Compute"
	//$context.context:=Form.CurrentReview.createContext()
	
	//// Copy template
	//$context.context.review.document:=WP New($template)
	
	//Open form window("WP_Review")
	//DIALOG("WP_Review"; $context)
	
End if 