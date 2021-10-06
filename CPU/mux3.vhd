LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux3 IS
PORT(
	mux3_sel:in std_logic;
	datain:in std_logic_vector(31 downto 0);
	dataout:out std_logic_vector(31 downto 0)
	);
END mux3;

ARCHITECTURE shuju OF mux3 IS
  BEGIN 
  PROCESS(mux3_sel,datain)
     BEGIN
			if mux3_sel='0' then 
				dataout<=x"00000000";
			elsif mux3_sel='1' then 
				dataout<=datain;           
			else
				dataout<="00000000000000000000000000000000";
			end if;
	END PROCESS;
END shuju;