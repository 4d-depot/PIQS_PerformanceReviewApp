Class extends EntitySelection

exposed Function progressStatus() : Object
	var $radius : Integer
	var $strokeWidth : Integer
	var $innerRadius : Integer
	var $circumference : Integer
	var $arc : Integer
	var $offset : Integer
	
	var $dashArray : Text
	var $transform : Text
	var $percent : Integer
	
	var $svg : Text
	
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
	
	$svg+="<text x=\""+String:C10($radius)+"\" y=\""+String:C10($radius)+"\" fill=\"#1267ff\" dominant-baseline=\"middle\" text-anchor=\"middle\" font-family=\"Poppins, Open Sans, sans-serif\" font-size=\""+String:C10($radius/2)+"\">"+String:C10($percent)+"%</text>"
	
	$svg+="</svg>"
	
	//Folder(fk desktop folder).file("fff.svg").setText($svg)
	
	//var $xml : Text
	//var $pict : Picture
	//$xml:=DOM Parse XML variable($svg)
	//SVG EXPORT TO PICTURE($xml; $pict)
	//CONVERT PICTURE($pict; ".png")
	//PICTURE TO BLOB($pict; $blob; ".png")
	//Folder(fk desktop folder).file("fff.png").setContent($blob)
	
	var $o : Object
	$o:={text: "e"; image: $svg}
	return $o