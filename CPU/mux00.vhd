LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux00 IS
PORT(
	mux00_sel:in std_logic_vector(1 downto 0);
	data1:in std_logic_vector(31 downto 0);
	data2:in std_logic_vector(31 downto 0);
	data3:in std_logic_vector(31 downto 0);
	data4:in std_logic_vector(31 downto 0);
    
	data:out std_logic_vector(31 downto 0)
	);
END mux00;

ARCHITECTURE shuju OF mux00 IS
  BEGIN 
  PROCESS(mux00_sel,data1,data2,data3,data4)
     BEGIN
			if mux00_sel="00" then 
				data<=data1;
			elsif mux00_sel="01" then 
				data<=data2; 
			elsif mux00_sel="10" then 
				data<=data3; 
			elsif mux00_sel="11" then 
				data<=data4; 	           
			else
				data<="00000000000000000000000000000000";
			end if;
	END PROCESS;
END shuju;