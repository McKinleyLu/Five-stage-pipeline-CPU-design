library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU0 is 
port (
A,B:in std_logic_vector(31 downto 0);
zero,symbol:buffer std_logic);
end ALU0;

architecture project of ALU0 is
signal temp3:std_logic_vector(31 downto 0);
begin
process(A,B,temp3)
begin

temp3<=A - B ;
symbol<=temp3(31);
 if temp3 =x"00000000" then
  zero<= '1';
 else 
  zero<='0';
 end if; 
 
 
end process;
end architecture project;
