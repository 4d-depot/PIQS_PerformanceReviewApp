var $index : Integer

$index:=Form:C1466.currentItem.Skill.skill.indexOf(Form:C1466.currentGroup)
Form:C1466.currentItem.Skill.skill.remove($index)
Form:C1466.currentGroup:=Null:C1517