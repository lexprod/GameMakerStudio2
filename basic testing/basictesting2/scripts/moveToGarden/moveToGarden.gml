

if GardenTransition {
	
	if GardenHidden {
		//for dumb reasons I need to wait a shole step
			if RoomReady {
				show_debug_message("room is ready")
				loadGarden(gametargetgarden)
				RoomReady = false
				
				//turn off...I mean eventually
				GardenTransition = false
				GardenHidden = false
			} else {
				//we're hidden, switch the rooms
				if gateDestination == "rMap"{
					room_goto(rMap)
				} else {
					room_goto(rPuzzleGarden)
				}
				RoomReady = true
				gametargetgarden = gateDestination
			
				yPathComplete = false
				levelComplete = false
		
				killAllSavs()
			}
		
	} else {
		//testing
		GardenHidden = true
	}
}