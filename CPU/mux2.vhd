LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux2 IS
PORT(
	mux2_sel:in std_logic_vector(1 downto 0);
	data1:in std_logic_vector(31 downto 0);
	data2:in std_logic_vector(31 downto 0);
	data3:in std_logic_vector(31 downto 0);
	data4:in std_logic_vector(31 downto 0);
    
	data:out std_logic_vector(31 downto 0)
	);
END mux2;

ARCHITECTURE shuju OF mux2 IS
  BEGIN 
  PROCESS(mux2_sel,data1,data2,data3,data4)
     BEGIN
			if mux2_sel="00" then 
				data<=data1;
			elsif mux2_sel="01" then 
				data<=data2; 
			elsif mux2_sel="10" then 
				data<=data3; 
			elsif mux2_sel="11" then 
				data<=data4; 	           
			else
				data<="00000000000000000000000000000000";
			end if;
	END PROCESS;
END shuju;