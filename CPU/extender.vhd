library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity extender is 
port (datain:in std_logic_vector(4 downto 0);
	  dataout:out std_logic_vector(31 downto 0)
	);
END extender;

ARCHITECTURE shuju OF extender IS
  BEGIN 
  PROCESS(datain)
     BEGIN
     dataout<="000000000000000000000000000"&datain;
     END PROCESS;
END shuju;