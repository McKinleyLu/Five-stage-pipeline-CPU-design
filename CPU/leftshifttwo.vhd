LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY leftshifttwo IS
PORT(	
	datainput:in std_logic_vector(31 downto 0);
	dataoutput:out std_logic_vector(31 downto 0)
	);
END leftshifttwo;

ARCHITECTURE zhi OF leftshifttwo IS
  BEGIN 
  PROCESS(datainput)
     BEGIN
		dataoutput<=TO_STDLOGICVECTOR(TO_BITVECTOR(datainput) SLL(2));
	END PROCESS;
END zhi;
