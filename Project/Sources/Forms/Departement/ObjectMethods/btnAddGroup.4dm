var $group : Text
$group:=Request:C163("Please enter the group:")
If (Form:C1466.currentItem.Skill.skill=Null:C1517)
	Form:C1466.currentItem.Skill.skill:={group: $group}
Else 
	Form:C1466.currentItem.Skill.skill.push({group: $group})
End if 