LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY register_set IS
PORT(  	clk		: 	IN  STD_LOGIC;
		   reset: IN  STD_LOGIC;
		   RegWr: IN  STD_LOGIC;
		   Ra  :   IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		   Rb:  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		   Rw:  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		   busW:   IN	STD_LOGIC_VECTOR(31 DOWNTO 0);--��д��mi ma
		   
		   A :   out	STD_LOGIC_VECTOR(31 DOWNTO 0);
		   B :   out	STD_LOGIC_VECTOR(31 DOWNTO 0);
		   C :   out	STD_LOGIC_VECTOR(31 DOWNTO 0);
		   rs :   out	STD_LOGIC_VECTOR(31 DOWNTO 0);
		   rt :   out	STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END register_set;

ARCHITECTURE register_set_body OF register_set IS
    TYPE my_array IS ARRAY(15 DOWNTO 0) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal  reg : my_array;
BEGIN	
	PROCESS (clk,reset,RegWr,Ra,Rb,Rw,busW)		
	BEGIN
	  IF reset='0' THEN--chu shi hua 
		   reg(0)<=  "00000000000000000000000000000000";
		   reg(1)<=  "00000000000000000000000000000001";
		   reg(2)<=  "00000000000000000000000000000000";
		   reg(3)<=  "00000000000000000000000000000000";
		   reg(4)<=  "00000000000000000000000000000000";
		   reg(5)<=  "00000000000000000000000000000000";
		   reg(6)<=  "00000000000000000000000000000000";
		   reg(7)<=  "00000000000000000000000000000010";
		   reg(8)<=  "00000000000000000000000000010000";
		   reg(9)<=  "00000000000000000000000000110100";
		   reg(10)<= "00000000000000000000000000111100";
		   reg(11)<= "00000000000000000000000000000000";
		   reg(12)<= "00000000000000000000000000000011";
		   reg(13)<= "00000000000000000000000000000110";
		   reg(14)<= "00000000000000000000000000000000";
		   reg(15)<= "00000000000000000000000000000000";
	  elsif (CLK' event and CLK='0' and RegWr='1') then
	       reg(CONV_INTEGER(Rw))<=busW;--xieru
	       end if;
	END PROCESS;	
	rs<= reg(CONV_INTEGER(Ra));
	rt<= reg(CONV_INTEGER(Rb));
	A<=reg(3);
	B<=reg(4);
	C<=reg(11);
END register_set_body;
