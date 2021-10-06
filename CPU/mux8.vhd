LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux8 IS
PORT(
	mux8_sel:in std_logic;
	data1:in std_logic_vector(4 downto 0);
	data2:in std_logic_vector(4 downto 0);
	
	data:out std_logic_vector(4 downto 0)
	);
END mux8;

ARCHITECTURE shuju OF mux8 IS
  BEGIN 
  PROCESS(mux8_sel,data1,data2)
     BEGIN
			if mux8_sel='0' then 
				data<=data1;
			elsif mux8_sel='1' then 
				data<=data2;            
			else
				data<="00000";
			end if;
	END PROCESS;
END shuju;