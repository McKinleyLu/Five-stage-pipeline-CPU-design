LIBRARY  IEEE;
USE  IEEE.STD_LOGIC_1164.ALL;     
USE  IEEE.STD_LOGIC_ARITH.ALL;   
USE  IEEE.STD_LOGIC_UNSIGNED.ALL;   
entity add0 is
port ( pcin: in std_logic_vector(31 downto 0);
	   addsel: in std_logic;
	   q:    out std_logic_vector(31 downto 0));
end add0;

architecture al of add0 is

begin

alu_proc: process(addsel,pcin)
  begin
  if addsel='0'then
   q<=pcin-4;
   else
   q<=pcin+4;
   end if;
end process;

end  al;