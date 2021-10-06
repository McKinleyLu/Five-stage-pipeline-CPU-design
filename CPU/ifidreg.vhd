LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ifidreg IS
	PORT
	(   clk	        : IN	STD_LOGIC;
		clear       : IN    STD_LOGIC;
		ifidwrite	: IN	STD_LOGIC;
		reset	    : IN	STD_LOGIC;
		
		npc_input   : IN	STD_LOGIC_vector(31 downto 0);
		ir_input    : IN	STD_LOGIC_vector(31 downto 0);
		
	    ir_output	: OUT 	STD_LOGIC_vector(31 downto 0);
		npc_output	: OUT 	STD_LOGIC_vector(31 downto 0)
	);
	
END ifidreg;

ARCHITECTURE a OF ifidreg IS 
BEGIN
PROCESS (reset,clk,clear,ifidwrite)
BEGIN
  IF reset = '0' then
     npc_output <= x"00000000"; 
     ir_output  <= x"00000000"; 
  elsif (clk'EVENT AND clk = '1') THEN
       IF ifidwrite = '1' AND clear = '1' THEN
          npc_output <= x"00000000"; 
          ir_output  <= x"00000000"; 
       elsif ifidwrite = '1' and clear='0' then
          npc_output <= npc_input;
          ir_output  <= ir_input;
       END IF; 	
  END IF;
END PROCESS;
END a;