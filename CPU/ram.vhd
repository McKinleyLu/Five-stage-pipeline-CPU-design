LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ram is 
port 
(       clk,reset   :IN std_logic;
        MemWr	    :IN	STD_LOGIC;   
		Address     :IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
		W_Data	    :IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
		    			
		Read_data   :OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		jieguo     :OUT  STD_LOGIC_VECTOR(31 DOWNTO 0));
end ram;

architecture a of ram is
TYPE my_array IS ARRAY(31 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg : my_array;
	SIGNAL Adr: STD_LOGIC_VECTOR(8 DOWNTO 0) ;
  BEGIN	
    Adr<=Address(8 downto 0);
	PROCESS (reset,clk)	
	VARIABLE i : INTEGER;		
	BEGIN
		IF reset='0' THEN
				reg(0) <= "00000000"; reg(1) <= "00000000"; reg(2) <= "00000000"; reg(3) <= "00000101";	
				reg(4) <= "00000000"; reg(5) <= "00000000"; reg(6) <= "00000000"; reg(7) <= "00000001";	
			    reg(8) <= "00000000"; reg(9) <= "00000000"; reg(10)<= "00000000"; reg(11)<= "00000010";
				reg(12)<= "11111111"; reg(13)<= "11111111"; reg(14)<= "11111111"; reg(15)<= "11111111";
				reg(16)<= "00000000"; reg(17)<= "00000000"; reg(18)<= "00000000"; reg(19)<= "00000000";
			    reg(20)<= "00000000"; reg(21)<= "00000000"; reg(22)<= "00000000"; reg(23)<= "00000000";
				
				FOR i IN 31 DOWNTO 24 LOOP
				reg(i) <= "00000000";	
			    END LOOP;
		ELSE 
			IF clk'event AND clk='0' then
			    if MemWr='1' THEN           
				    reg(CONV_INTEGER(Adr))  <= W_Data(31 downto 24);
				    reg(CONV_INTEGER(Adr+1))<= W_Data(23 downto 16);
				    reg(CONV_INTEGER(Adr+2))<= W_Data(15 downto 8);
				    reg(CONV_INTEGER(Adr+3))<= W_Data(7 downto 0);
               end if;                
			END IF;	
		END IF;		
	END PROCESS;
	
	Read_data(31 downto 24)<=reg(CONV_INTEGER(Adr)); 
    Read_data(23 downto 16)<=reg(CONV_INTEGER(Adr+1)); 
    Read_data(15 downto 8) <=reg(CONV_INTEGER(Adr+2)); 
    Read_data(7 downto 0)  <=reg(CONV_INTEGER(Adr+3)); 
    
	jieguo(31 downto 24) <= reg(CONV_INTEGER(16));
	jieguo(23 downto 16) <= reg(CONV_INTEGER(17));
	jieguo(15 downto 8)  <= reg(CONV_INTEGER(18));
	jieguo(7 downto 0)   <= reg(CONV_INTEGER(19));

end a;