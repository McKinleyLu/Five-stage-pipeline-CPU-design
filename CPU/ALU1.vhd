library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU1 is 
port (
A,B:in std_logic_vector(31 downto 0);
ALUOP:in std_logic_vector(3 downto 0);
result:buffer std_logic_vector(31 downto 0));
end ALU1;

architecture project of ALU1 is
signal temp1,temp2,temp3:std_logic_vector(32 downto 0);
signal symbol:std_logic;
begin
process(A,B,ALUOP,symbol,temp1,temp2,temp3)
begin

if  ALUOP="0001" then----(A+B)
temp1<='0' & A ;
temp2<='0' & B;
temp3<=temp1 + temp2;
result<=temp3(31 downto 0);

elsif ALUOP="0010" then      ----(A-B)
temp1<='0' & A ;
temp2<='0' & B;
temp3<=temp1 - temp2;
result<=temp3(31 downto 0);
  
elsif ALUOP="1010" then        ----(bijiao)
temp1<='0' & A ;
temp2<='0' & B;
temp3<=temp1 - temp2; 
symbol<=temp3(31);  
 if symbol='1' then
  result<="00000000000000000000000000000001";
 else
  result<="00000000000000000000000000000000";
 end if;

 elsif ALUOP="0011"then
 result<=A and B;

 elsif ALUOP="0100"then
 result<=A or B;

 elsif ALUOP="0101" then
 result<=A xor B;

 elsif ALUOP="0110"then
 result<=not A+1;

 elsif ALUOP="0111" then
 result<=TO_STDLOGICVECTOR(TO_BITVECTOR(A) SLL CONV_INTEGER(B));

 elsif ALUOP= "1000" then
 result<=TO_STDLOGICVECTOR(TO_BITVECTOR(A) SRL CONV_INTEGER(B));

 elsif ALUOP="1001" then
 result<=TO_STDLOGICVECTOR(TO_BITVECTOR(A) SRA CONV_INTEGER(B));
 
 else
result<=A;

end if;

end process;
end architecture project;
