LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux5 IS
PORT(
	mux5_sel:in std_logic_vector(2 downto 0);
	data1:in std_logic_vector(31 downto 0);
	data2:in std_logic_vector(31 downto 0);
	data3:in std_logic_vector(31 downto 0);
	data4:in std_logic_vector(31 downto 0);
    data5:in std_logic_vector(31 downto 0);
    data6:in std_logic_vector(31 downto 0);
	data:out std_logic_vector(31 downto 0)
	);
END mux5;

ARCHITECTURE shuju OF mux5 IS
  BEGIN 
  PROCESS(mux5_sel,data1,data2,data3,data4,data5,data6)
     BEGIN
			if mux5_sel="000" then 
				data<=data1;
			elsif mux5_sel="001" then 
				data<=data2; 
			elsif mux5_sel="010" then 
				data<=data3; 
			elsif mux5_sel="011" then 
				data<=data4; 	 
			elsif mux5_sel="100" then 
				data<=data5; 
			elsif mux5_sel="101" then 
				data<=data6; 	          
			else
				data<="00000000000000000000000000000000";
			end if;
	END PROCESS;
END shuju;