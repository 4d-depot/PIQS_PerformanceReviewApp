//%attributes = {}


$es:=ds:C1482.Review.get(1)

For each ($review; $es)
	
	// Generate Skill
	$obj:=New object:C1471
	$skillSettings:=$review.Employee.Departement.Skill
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
	
End for each 