txd = "txdname"


if XExporter!= undefined do destroyDialog XExporter
rollout XExporter"JS Exporter" --width:162 height:300
(
	button JSP "Export JSP Lines" align:#center width:150 height:26
	edittext txd_txt "TXD Name:" align:#center fieldWidth:80 labelOnTop:false
	button JSD "Export JSD Lines" align:#center width:150 height:26
	button Meta "Export Meta Lines" align:#center width:150 height:26
	pickbutton ReplaceSelect "Select Source Element" align:#center width:150 height:26
	button Replace "Instance Selected as source" align:#center width:150 height:26

	
	on ReplaceSelect picked obj do
	(
		if obj != undefined do
		(

		obj.wirecolor = red

		ReplaceSelect.text = obj.name
	)
	)



	on Replace pressed do
	(

		for obj in selection do
		(
			instancereplace obj ReplaceSelect.object
		)

		actionMan.executeAction 0 "40472"

	)
	
	
	on JSP pressed do
	(

		for obj in selection do
		(
		 	xangle = quatToEuler (obj.rotation)
		 	xpos = obj.pos
			xname = formattedprint(obj.Name)
	
			
		 	format (xname + "," + (formattedprint("0,-1")) + "," + (formattedprint xpos.x) + "," + (formattedprint xpos.y) + "," + (formattedprint xpos.z) + "," + (formattedprint -xangle.x) + "," + (formattedprint -xangle.y) + "," + (formattedprint -xangle.z)+"\n")

		)

		actionMan.executeAction 0 "40472"

	)
	
	on JSD pressed do
	(

		for obj in selection do
		(
			xname = formattedprint(obj.Name)
		
		 	format  (xname + "," + xname + "," + txd_txt.text + "," + xname + ",300,nil,nil,true\n")
		)

		actionMan.executeAction 0 "40472"

	)
	
	on Meta pressed do
	
	
	(

		for obj in selection do
		(

			xname = formattedprint(obj.Name)

		 	format  ("	<file src='Content/models/"+xname+".dff' type='client' />\n")

		)
		
		format  ("\n")
		format  ("\n")
		
		for obj in selection do
		(
			xname = formattedprint(obj.Name)

		 	format  ("	<file src='Content/coll/"+xname+".col' type='client' />\n")
		)

		actionMan.executeAction 0 "40472"

	)
)
	
createDialog XExporter