Class extends EntitySelection

exposed Function progressStatus() : Text
	var $radius : Integer
	var $strokeWidth : Integer
	var $innerRadius : Integer
	var $circumference : Integer
	var $arc : Integer
	var $offset : Integer
	
	var $dashArray : Text
	var $transform : Text
	var $percent : Integer
	
	$radius:=100
	$percent:=20
	
	$strokeWidth:=$radius*0.2
	$innerRadius:=$radius-($strokeWidth/2)
	$circumference:=$innerRadius*2*3.14
	
	$offset:=$circumference*((100-$percent)/100)
	
	$transform:="rotate(90, "+String:C10($radius)+", "+String:C10($radius)+")"
	
	$svg:="<svg xmlns=\"http://www.w3.org/2000/svg\" height=\""+String:C10($radius*2)+"\" width=\""+String:C10($radius*2)+"\">"
	
	$svg+="<circle cx=\""+String:C10($radius)+"\" cy=\""+String:C10($radius)+"\" r=\""+String:C10($innerRadius)+"\""
	$svg+=" fill=\"transparent\" stroke=\"#e0e0e0\""
	$svg+=" stroke-width=\""+String:C10($strokeWidth)+"px\"/>‍"
	
	$svg+="<circle cx=\""+String:C10($radius)+"\" cy=\""+String:C10($radius)+"\" r=\""+String:C10($innerRadius)+"\""
	$svg+=" fill=\"transparent\" stroke=\"#1267ff\""
	$svg+=" stroke-width=\""+String:C10($strokeWidth)+"\" stroke-linecap=\"round\""
	$svg+=" stroke-dashoffset=\""+String:C10($offset)+"\" stroke-dasharray=\""+String:C10($circumference)+"\" transform=\""+$transform+"\"/>‍"
	
	$svg+="<text x=\""+String:C10($radius)+"\" y=\""+String:C10($radius)+"\" fill=\"#1267ff\" dominant-baseline=\"middle\" text-anchor=\"middle\"font-family=\"Poppins, Open Sans, sans-serif\" font-size=\""+String:C10($radius/2)+"\">"+String:C10($percent)+"%</text>"
	
	$svg+="</svg>"
	
	Folder:C1567(fk desktop folder:K87:19).file("fff.svg").setText($svg)
	
	return $svg
	
	
exposed Function dashboardStatus() : Object
	var $col : Collection
	$col:=This:C1470.distinct("ID_Status"; dk count values:K85:36)
	
	$obj:=New object:C1471
	$obj.series:=$col.extract("count")
	$obj.options:=New object:C1471
	$obj.options.labels:=$col.extract("value").map(Formula:C1597(ds:C1482.ReviewStatus.get($1.value).Name))
	
	return $obj
	
	
exposed Function dashboardScore() : Object
	
	If (Session:C1714=Null:C1517)
		$obj:=Storage:C1525
	Else 
		$obj:=Session:C1714.storage
	End if 
	
	If ($obj.Employee=Null:C1517)
		Use ($obj)
			$obj.Employee:=New shared object:C1526
		End use 
	End if 
	
	Use ($obj.Employee)
		$obj.Employee.role:="Collaborator"
	End use 
	
	$obj:=New object:C1471
	$obj.options:=New object:C1471
	$obj.options.xaxis:=New object:C1471
	$obj.options.xaxis.categories:=["2020"; "2021"; "2022"; "2023"; "2024"]
	$obj.series:=New collection:C1472
	$p:=This:C1470.query("ID_Employee = :1"; This:C1470.first().ID_Employee).orderBy("Date").extract("ID_ScoreGoal")
	$obj.series.push({name: String:C10($o); data: $p})
	
	return $obj
	
exposed Function dashboardScore2() : Object
	
	If (Session:C1714=Null:C1517)
		$obj:=Storage:C1525
	Else 
		$obj:=Session:C1714.storage
	End if 
	
	If ($obj.Employee=Null:C1517)
		Use ($obj)
			$obj.Employee:=New shared object:C1526
		End use 
	End if 
	
	Use ($obj.Employee)
		$obj.Employee.role:="Manager"
	End use 
	
	$col:=This:C1470.distinct("ID_Employee")
	
	$obj:=New object:C1471
	$obj.options:=New object:C1471
	$obj.options.xaxis:=New object:C1471
	$obj.options.xaxis.categories:=$col
	$obj.series:=New collection:C1472
	
	For each ($o; $col)
		$p:=This:C1470.query("ID_Employee = :1 AND Date >= :2 AND Date <= :3"; $o; String:C10($year)+"/01/01"; String:C10($year)+"/12/31").orderBy("Date").extract("ID_ScoreGoal")
		$obj.series.push({name: String:C10($o); data: $p})
	End for each 
	
	return $obj