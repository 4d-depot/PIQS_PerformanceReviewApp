var $index : Integer
$index:=Form:C1466.currentGroup.value.indexOf(Form:C1466.currentSkill.first())
Form:C1466.currentGroup.value.remove($index)
Form:C1466.currentSkill:=Null:C1517