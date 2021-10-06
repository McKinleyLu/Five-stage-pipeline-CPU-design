LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY idexreg IS
	PORT
	(   clk		    : IN	STD_LOGIC;
		reset		: IN	STD_LOGIC;
		idexclear		: IN	STD_LOGIC;
		idexwrite	: IN	STD_LOGIC;
		
		rs_input    : IN	STD_LOGIC_vector(31 downto 0);
		rt_input	: IN	STD_LOGIC_vector(31 downto 0);
		shamt_input	: IN	STD_LOGIC_vector(31 downto 0);
		
		imm_input	: IN	STD_LOGIC_vector(31 downto 0);
		ir_input	: IN	STD_LOGIC_vector(31 downto 0);
		
	    rs_output	: OUT 	STD_LOGIC_vector(31 downto 0);
		rt_output	: OUT 	STD_LOGIC_vector(31 downto 0);
		shamt_output: OUT 	STD_LOGIC_vector(31 downto 0);
		ir_output	: OUT 	STD_LOGIC_vector(31 downto 0);
		imm_output	: OUT 	STD_LOGIC_vector(31 downto 0)
	);
	
END idexreg;
ARCHITECTURE a OF idexreg IS 
BEGIN
PROCESS (reset,clk,idexclear,idexwrite)
BEGIN
  IF reset = '0' then
     rs_output  <= x"00000000"; 
     rt_output  <= x"00000000"; 
     imm_output <= x"00000000"; 
     ir_output  <= x"00000000"; 
    shamt_output<= x"00000000"; 
  elsif (clk'EVENT AND clk = '1') THEN
       IF idexwrite = '1' and idexclear='0' THEN	
          rs_output <= rs_input;
          rt_output <= rt_input;	
          imm_output <= imm_input;
          ir_output <= ir_input;
          shamt_output<=shamt_input;	
       elsif idexwrite = '1' and idexclear='1' then
          rs_output  <= x"00000000"; 
          rt_output  <= x"00000000"; 
          imm_output <= x"00000000"; 
          ir_output  <= x"00000000";
          shamt_output<= x"00000000"; 
       END IF;
  END IF;
END PROCESS;
END a;