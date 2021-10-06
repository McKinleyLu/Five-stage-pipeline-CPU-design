library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decoder is 
port (
data:in std_logic_vector(31 downto 0);
rs:out std_logic_vector(4 downto 0);
rt:out std_logic_vector(4 downto 0);
shamt:out std_logic_vector(4 downto 0);
imm:out std_logic_vector(15 downto 0);
instr:out std_logic_vector(25 downto 0)
);
end decoder;

ARCHITECTURE mealy  OF decoder is
 BEGIN	
	PROCESS (data)			
	BEGIN
   rs<=data(25 downto 21);
   rt<=data(20 downto 16);
   shamt<=data(10 downto 6);
   imm<=data(15 downto 0);
   instr<=data(25 downto 0);
     
     END PROCESS;
END mealy; 