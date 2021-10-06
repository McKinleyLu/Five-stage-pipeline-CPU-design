LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY memwbreg IS
	PORT
	(   clk		        : IN	STD_LOGIC;
		reset		    : IN	STD_LOGIC;
		memwbwrite		: IN	STD_LOGIC;
	    aluoutput_input	: IN	STD_LOGIC_vector(31 downto 0);
		lmd_input		: IN	STD_LOGIC_vector(31 downto 0);
		ir_input		: IN	STD_LOGIC_vector(31 downto 0);
		
		aluoutput_output : OUT 	STD_LOGIC_vector(31 downto 0);
		ir_output		 : OUT	STD_LOGIC_vector(31 downto 0);
	    rd_output	     : OUT 	STD_LOGIC_vector(4 downto 0);
	    rt_output        : OUT 	STD_LOGIC_vector(4 downto 0);
		lmd_output	     : OUT 	STD_LOGIC_vector(31 downto 0)
	);
	
END memwbreg;
ARCHITECTURE a OF memwbreg IS 
BEGIN
PROCESS (reset,clk,memwbwrite)
BEGIN
  IF reset = '0' then
     aluoutput_output <= x"00000000"; 
     lmd_output <= x"00000000";
     rt_output  <= "00000";
     rd_output  <= "00000";
  elsif (clk'EVENT AND clk = '1') THEN
       IF memwbwrite = '1' THEN	
          aluoutput_output <= aluoutput_input;
          lmd_output <= lmd_input;
          ir_output <= ir_input;
          rt_output <= ir_input(20 downto 16);
          rd_output <= ir_input(15 downto 11);
       END IF;
  END IF;
END PROCESS;
END a;