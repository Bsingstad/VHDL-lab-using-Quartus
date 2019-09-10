  #Toggle switches
        set_location_assignment PIN_C10 -to sw[0]
		set_location_assignment PIN_C11 -to sw[1]
		set_location_assignment PIN_D12 -to sw[2]
		set_location_assignment PIN_C12 -to sw[3]

        # YOUR TASK: Enter the pin assignments for the remaining SW pins

        #LED outputs
        set_location_assignment PIN_C14 -to hex[0]
		set_location_assignment PIN_E15 -to hex[1]
		set_location_assignment PIN_C15 -to hex[2]
		set_location_assignment PIN_C16 -to hex[3]
		set_location_assignment PIN_E16 -to hex[4]
		set_location_assignment PIN_D17 -to hex[5]
		set_location_assignment PIN_C17 -to hex[6]
		# set_location_assignment PIN_D15 -to hex[7]
		
		
        # YOUR TASK: Enter the pin assignments for the remaining LED pins

        #To avoid that the FPGA is driving an unintended value on pins that are not in use:
        set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"