LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY exmemreg IS
	PORT
	(
	    clk		        : IN	STD_LOGIC;
		reset		    : IN	STD_LOGIC;
		exmemwrite		: IN	STD_LOGIC;
		aluouput_input	: IN	STD_LOGIC_vector(31 downto 0);
		ir_input		: IN	STD_LOGIC_vector(31 downto 0);
		b_input		    : IN	STD_LOGIC_vector(31 downto 0);
		
		b_output	     : OUT 	STD_LOGIC_vector(31 downto 0);
		ir_output	     : OUT 	STD_LOGIC_vector(31 downto 0);
		aluoutput_output : OUT 	STD_LOGIC_vector(31 downto 0)
	);
	
END exmemreg;

ARCHITECTURE a OF exmemreg IS 
BEGIN
PROCESS (reset,clk,exmemwrite,aluouput_input,ir_input,b_input)
BEGIN
  IF reset = '0' then 
     b_output  <= x"00000000";
     ir_output  <= x"00000000"; 
     aluoutput_output <= x"00000000"; 
      
 elsif (clk'EVENT AND clk = '1') THEN
       IF exmemwrite = '1' THEN	
          
       b_output <= b_input;	
       aluoutput_output <= aluouput_input;
       ir_output <= ir_input;
       
       else
        b_output  <= x"00000000";
        ir_output  <= x"00000000"; 
        aluoutput_output <= x"00000000"; 
       END IF;
  END IF;
END PROCESS;
END a;