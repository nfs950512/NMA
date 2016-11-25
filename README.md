# NMA

Nov 25:
Current Status - Able to go through Nios 2 program. Handshake resolved. vectadd() ends
Pending Work - Testing for correctness of sum array s[], resolve bug2.

Current Bugs -
1. Wasnt able to program board (Fixed)
2. Handshake protocol doesnt work (Partially Fixed)
	--io_control.sv:239, cannot replace len[3:0] with len for some reason
