LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL,IEEE.NUMERIC_STD.ALL;

ENTITY control2 IS
PORT(       
	  IR : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	  memwb_rwrite :OUT  STD_LOGIC; 
	  wren: out std_logic                   	 
	);	         
END control2;

ARCHITECTURE ct OF control2 IS
	
BEGIN
		
	PROCESS(IR)		
	BEGIN
		memwb_rwrite<='1';
		wren<='0';
		
		if 	ir(31 downto 26)="010000" then
		   wren<='1';
		else
		   wren<='0';
		end if;	

	END PROCESS;
end;