LIBRARY  IEEE;
USE  IEEE.STD_LOGIC_1164.ALL;     
USE  IEEE.STD_LOGIC_ARITH.ALL;   
USE  IEEE.STD_LOGIC_UNSIGNED.ALL;   
entity add1 is
port ( npcin: in std_logic_vector(31 downto 0);
       imm:  in std_logic_vector(31 downto 0);
	   q:     out std_logic_vector(31 downto 0));
end add1;

architecture al of add1 is

begin

alu_proc: process(npcin,imm)
  begin
   q<=npcin+imm;
end process;

  
end  al;