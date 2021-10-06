LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux7 IS
PORT(
	mux7_sel:in std_logic;
	data1:in std_logic_vector(31 downto 0);
	data2:in std_logic_vector(31 downto 0);
	
	data:out std_logic_vector(31 downto 0)
	);
END mux7;

ARCHITECTURE shuju OF mux7 IS
  BEGIN 
  PROCESS(mux7_sel,data1,data2)
     BEGIN
			if mux7_sel='0' then 
				data<=data1;
			elsif mux7_sel='1' then 
				data<=data2;            
			else
				data<="00000000000000000000000000000000";
			end if;
	END PROCESS;
END shuju;