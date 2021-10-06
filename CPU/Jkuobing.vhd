LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Jkuobing IS
PORT(		
	data1:in std_logic_vector(25 downto 0);
	data2:in std_logic_vector(31 downto 0);
	data:out std_logic_vector(31 downto 0)
	);
END Jkuobing;

ARCHITECTURE zhi OF Jkuobing IS
  BEGIN 
  PROCESS(data1,data2)
     BEGIN
		data<=data2(31 downto 28)&data1&"00";                                                                                                                                                                                      
	END PROCESS;
END zhi;
