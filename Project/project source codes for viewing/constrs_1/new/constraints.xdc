##leds
set_property PACKAGE_PIN L1 [get_ports { led_code[15]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[15]}]
set_property PACKAGE_PIN P1 [get_ports { led_code[14]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[14]}]    
set_property PACKAGE_PIN N3 [get_ports { led_code[13]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[13]}]
set_property PACKAGE_PIN P3 [get_ports { led_code[12]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[12]}] 
set_property PACKAGE_PIN U3 [get_ports { led_code[11]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[11]}]
set_property PACKAGE_PIN W3 [get_ports { led_code[10]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[10]}]
set_property PACKAGE_PIN V3 [get_ports { led_code[9]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[9]}]
set_property PACKAGE_PIN V13 [get_ports { led_code[8]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[8]}]    
set_property PACKAGE_PIN V14 [get_ports { led_code[7]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[7]}]
set_property PACKAGE_PIN U14 [get_ports { led_code[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[6]}] 
set_property PACKAGE_PIN U15 [get_ports { led_code[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[5]}]
set_property PACKAGE_PIN W18 [get_ports { led_code[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[4]}]   
 set_property PACKAGE_PIN V19 [get_ports { led_code[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[3]}]
set_property PACKAGE_PIN U19 [get_ports { led_code[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[2]}] 
set_property PACKAGE_PIN E19 [get_ports { led_code[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[1]}]
set_property PACKAGE_PIN U16 [get_ports { led_code[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports { led_code[0]}]  

##switches        
set_property PACKAGE_PIN R2 [get_ports {input_code[15]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[15]}]
set_property PACKAGE_PIN T1 [get_ports {input_code[14]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[14]}]  
set_property PACKAGE_PIN U1 [get_ports {input_code[13]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[13]}]
set_property PACKAGE_PIN W2 [get_ports {input_code[12]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[12]}]
set_property PACKAGE_PIN R3 [get_ports {input_code[11]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[11]}]
set_property PACKAGE_PIN T2 [get_ports {input_code[10]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[10]}]  
set_property PACKAGE_PIN T3 [get_ports {input_code[9]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[9]}]
set_property PACKAGE_PIN V2 [get_ports {input_code[8]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[8]}]
set_property PACKAGE_PIN W13 [get_ports {input_code[7]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[7]}]
set_property PACKAGE_PIN W14 [get_ports {input_code[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[6]}]  
set_property PACKAGE_PIN V15 [get_ports {input_code[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[5]}]
set_property PACKAGE_PIN W15 [get_ports {input_code[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[4]}]
set_property PACKAGE_PIN W17 [get_ports {input_code[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[3]}]
set_property PACKAGE_PIN W16 [get_ports {input_code[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[2]}]  
set_property PACKAGE_PIN V16 [get_ports {input_code[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[1]}]
set_property PACKAGE_PIN V17 [get_ports {input_code[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {input_code[0]}]   
     
##clock   
set_property PACKAGE_PIN W5 [get_ports {clock}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {clock}]
    	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]

##7 segment display - digits        
set_property PACKAGE_PIN W7 [get_ports {digit[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {digit[6]}]
set_property PACKAGE_PIN W6 [get_ports {digit[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {digit[5]}]
set_property PACKAGE_PIN U8 [get_ports {digit[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {digit[4]}]
set_property PACKAGE_PIN V8 [get_ports {digit[3]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {digit[3]}]
set_property PACKAGE_PIN U5 [get_ports {digit[2]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {digit[2]}]
set_property PACKAGE_PIN V5 [get_ports {digit[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {digit[1]}]
set_property PACKAGE_PIN U7 [get_ports {digit[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {digit[0]}]

##7 segment display - displays    
set_property PACKAGE_PIN U2 [get_ports {display[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {display[0]}]
set_property PACKAGE_PIN U4 [get_ports {display[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {display[1]}]
set_property PACKAGE_PIN V4 [get_ports {display[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {display[2]}]
set_property PACKAGE_PIN W4 [get_ports {display[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {display[3]}]

##Buttons    
set_property PACKAGE_PIN T18 [get_ports {buttons[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {buttons[0]}]
set_property PACKAGE_PIN T17 [get_ports {buttons[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {buttons[1]}]
set_property PACKAGE_PIN U17 [get_ports {buttons[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {buttons[2]}]
set_property PACKAGE_PIN W19 [get_ports {buttons[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {buttons[3]}]
set_property PACKAGE_PIN U18 [get_ports {buttons[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {buttons[4]}]
    
## VGA     
set_property PACKAGE_PIN G19 [get_ports {r[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {r[0]}]
set_property PACKAGE_PIN H19 [get_ports {r[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {r[1]}]
set_property PACKAGE_PIN J19 [get_ports {r[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {r[2]}]
set_property PACKAGE_PIN N19 [get_ports {r[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {r[3]}]
set_property PACKAGE_PIN N18 [get_ports {b[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]
set_property PACKAGE_PIN L18 [get_ports {b[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]
set_property PACKAGE_PIN K18 [get_ports {b[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {b[2]}]
set_property PACKAGE_PIN J18 [get_ports {b[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {b[3]}]
set_property PACKAGE_PIN J17 [get_ports {g[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {g[0]}]
set_property PACKAGE_PIN H17 [get_ports {g[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {g[1]}]
set_property PACKAGE_PIN G17 [get_ports {g[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {g[2]}]
set_property PACKAGE_PIN D17 [get_ports {g[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {g[3]}]
    
set_property PACKAGE_PIN P19 [get_ports hsync]
    set_property IOSTANDARD LVCMOS33 [get_ports hsync]
set_property PACKAGE_PIN R19 [get_ports vsync]
    set_property IOSTANDARD LVCMOS33 [get_ports vsync]
    