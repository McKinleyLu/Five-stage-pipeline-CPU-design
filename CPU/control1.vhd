LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL,IEEE.NUMERIC_STD.ALL;
--USE WORK.CPU_DEFS.ALL;

ENTITY control1 IS
PORT( 
      --reset       : IN     STD_LOGIC;
	  IR     : IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
	  exmemir:IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
	  memwbir:IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
	  
	  exmem_rwrite :OUT  STD_LOGIC;                          
	   
	  mux4_s: OUT  STD_LOGIC_vector(2 downto 0);                       
	  mux5_s :  OUT  STD_LOGIC_vector(2 downto 0);
	  mux6_s :  OUT  STD_LOGIC_vector(1 downto 0);
	  alu_sel:  OUT  STD_LOGIC_vector(3 downto 0)
	);	         
END control1;

ARCHITECTURE ct OF control1 IS
	
BEGIN
		
	PROCESS(IR,exmemir,memwbir)		
	BEGIN
		exmem_rwrite<='1';
		
		if ir(31 downto 26)="000000" then 
			 case ir(5 downto 0) is
			   when "000000" => alu_sel<="0001";--ADD
			   when "000100" => alu_sel<="0001";--ADDU
			   when "001000" => alu_sel<="0010";--SUB
			   when "001100" => alu_sel<="0010";--SUBU
			   when "010000" => alu_sel<="1010";--SLT
			   when others =>alu_sel<="0000";
			   end case;
	    elsif ir(31 downto 26)="000001" then
			 case ir(5 downto 0) is
			   when "000000" => alu_sel<="0011";--AND
			   when "000100" => alu_sel<="0110";--NOT
			   when "001000" => alu_sel<="0100";--OR
			   when "001100" => alu_sel<="0101";--XOR
			   when others =>alu_sel<="0000";
			   end case;
		 elsif ir(31 downto 26)="000010" then
			 case ir(5 downto 0) is
			   when "000000" => alu_sel<="0111";--SLL
			   when "000100" => alu_sel<="0111";--SLLV
			   when "001000" => alu_sel<="1000";--SRA
			   when "001100" => alu_sel<="1000";--SRAV
			   when "010000" => alu_sel<="1001";--SRL
			   when "010100" => alu_sel<="1010";--SRLV
			   when others =>alu_sel<="0000";
			   end case;
	     elsif ir(31 downto 26)="000100" then
               alu_sel<="0001";--ADDI
		 elsif ir(31 downto 26)="000101" then
               alu_sel<="0001";--ADDIU
		 elsif ir(31 downto 26)="000110" then
               alu_sel<="1010";--SLTI
		 elsif ir(31 downto 26)="000111" then
               alu_sel<="0011";--ANDI
		 elsif ir(31 downto 26)="001000" then
               alu_sel<="0100";--ORI
		 elsif ir(31 downto 26)="001001" then
			   alu_sel<="0101";--XORI
		 elsif ir(31 downto 26)="001111" then
		 	   alu_sel<="0001";--LW   			   	   	   
		 end if;
		 
		 
		 --来自exmem的aluoutput的值1
		 
		 if ir(31 downto 26)="000010" then--移位指令 
	        mux4_s<="100";
	  elsif exmemir(31 downto 26)="000000" and exmemir(15 downto 11)=ir(25 downto 21) then--算数运算R
		    mux4_s<="001";
	  elsif exmemir(31 downto 26)="000001" and exmemir(15 downto 11)=ir(25 downto 21) then--逻辑运算R
		    mux4_s<="001";
	  elsif exmemir(31 downto 26)="000010" and exmemir(15 downto 11)=ir(25 downto 21) then--移位指令 
	        mux4_s<="001";
	  elsif exmemir(31 downto 26)="000100" and exmemir(20 downto 16)=ir(25 downto 21) then--ADDI
	        mux4_s<="001";
	  elsif exmemir(31 downto 26)="000101" and exmemir(20 downto 16)=ir(25 downto 21) then--ADDIU
	        mux4_s<="001";
	  elsif exmemir(31 downto 26)="000110" and exmemir(20 downto 16)=ir(25 downto 21) then--SLTI
	        mux4_s<="001";
	  elsif exmemir(31 downto 26)="000111" and exmemir(20 downto 16)=ir(25 downto 21) then--ANDI
	        mux4_s<="001";
	  elsif exmemir(31 downto 26)="001000" and exmemir(20 downto 16)=ir(25 downto 21) then--ORI
	        mux4_s<="001";
	  elsif exmemir(31 downto 26)="001001" and exmemir(20 downto 16)=ir(25 downto 21) then--XORI
	        mux4_s<="001";
	   --来自memwb的aluoutput的值  
	  elsif memwbir(31 downto 26)="000000" and memwbir(15 downto 11)=ir(25 downto 21) then--算数运算R
	        mux4_s<="010";
	  elsif memwbir(31 downto 26)="000001" and memwbir(15 downto 11)=ir(25 downto 21) then--逻辑运算R
		    mux4_s<="010";
	  elsif memwbir(31 downto 26)="000010" and memwbir(15 downto 11)=ir(25 downto 21) then--移位指令 
	        mux4_s<="010";
	  elsif memwbir(31 downto 26)="000100" and memwbir(20 downto 16)=ir(25 downto 21) then--ADDI
	        mux4_s<="010";
	  elsif memwbir(31 downto 26)="000101" and memwbir(20 downto 16)=ir(25 downto 21) then--ADDIU
	        mux4_s<="010";
	  elsif memwbir(31 downto 26)="000110" and memwbir(20 downto 16)=ir(25 downto 21) then--SLTI
	        mux4_s<="010";
	  elsif memwbir(31 downto 26)="000111" and memwbir(20 downto 16)=ir(25 downto 21) then--ANDI
	        mux4_s<="010";
	  elsif memwbir(31 downto 26)="001000" and memwbir(20 downto 16)=ir(25 downto 21) then--ORI
	        mux4_s<="010";
	  elsif memwbir(31 downto 26)="001001" and memwbir(20 downto 16)=ir(25 downto 21) then--XORI
	        mux4_s<="010";
	    --来自memwb的lmd的值       
	  elsif memwbir(31 downto 26)="001111" and memwbir(20 downto 16)=ir(25 downto 21) then
		    mux4_s<="011";    
	  else       
		    mux4_s<="000"; --自己的寄存器a中的值
	  end if ;		           
	   
	   
	     if ir(31 downto 26)="000100" then--ADDI
	        mux5_s<="001"; --imm
	  elsif ir(31 downto 26)="000101" then--ADDIU
	        mux5_s<="001";
	  elsif ir(31 downto 26)="000110" then--SLTI
	        mux5_s<="001";
	  elsif ir(31 downto 26)="000111" then--ANDI
	        mux5_s<="001";
	  elsif ir(31 downto 26)="001000" then--ORI
	        mux5_s<="001";
	  elsif ir(31 downto 26)="001001" then--XORI
	        mux5_s<="001";
	  elsif ir(31 downto 26)="001111" then --LW
	        mux5_s<="001";
	  elsif ir(31 downto 26)="010000" then --SW
	        mux5_s<="001";  
	    --来自exmem的aluoutput的值       
	  elsif exmemir(31 downto 26)="000000" and exmemir(15 downto 11)=ir(20 downto 16) then--算数运算R
		    mux5_s<="010";
	  elsif exmemir(31 downto 26)="000001" and exmemir(15 downto 11)=ir(20 downto 16) then--逻辑运算R
		    mux5_s<="010";
	  elsif exmemir(31 downto 26)="000100" and exmemir(20 downto 16)=ir(20 downto 16) then--ADDI
	        mux5_s<="010";
	  elsif exmemir(31 downto 26)="000101" and exmemir(20 downto 16)=ir(20 downto 16) then--ADDIU
	        mux5_s<="010";
	  elsif exmemir(31 downto 26)="000110" and exmemir(20 downto 16)=ir(20 downto 16) then--SLTI
	        mux5_s<="010";
	  elsif exmemir(31 downto 26)="000111" and exmemir(20 downto 16)=ir(20 downto 16) then--ANDI
	        mux5_s<="010";
	  elsif exmemir(31 downto 26)="001000" and exmemir(20 downto 16)=ir(20 downto 16) then--ORI
	        mux5_s<="010";
	  elsif exmemir(31 downto 26)="001001" and exmemir(20 downto 16)=ir(20 downto 16) then--XORI
	        mux5_s<="010";
	      --来自memwb的aluoutput的值  
	  elsif memwbir(31 downto 26)="000000" and memwbir(15 downto 11)=ir(20 downto 16) then--算数运算R
	        mux5_s<="011";
	  elsif memwbir(31 downto 26)="000001" and memwbir(15 downto 11)=ir(20 downto 16) then--逻辑运算R
		    mux5_s<="011";
	  elsif memwbir(31 downto 26)="000100" and memwbir(20 downto 16)=ir(20 downto 16) then--ADDI
	        mux5_s<="011";
	  elsif memwbir(31 downto 26)="000101" and memwbir(20 downto 16)=ir(20 downto 16) then--ADDIU
	        mux5_s<="011";
	  elsif memwbir(31 downto 26)="000110" and memwbir(20 downto 16)=ir(20 downto 16) then--SLTI
	        mux5_s<="011";
	  elsif memwbir(31 downto 26)="000111" and memwbir(20 downto 16)=ir(20 downto 16) then--ANDI
	        mux5_s<="011";
	  elsif memwbir(31 downto 26)="001000" and memwbir(20 downto 16)=ir(20 downto 16) then--ORI
	        mux5_s<="011";
	  elsif memwbir(31 downto 26)="001001" and memwbir(20 downto 16)=ir(20 downto 16) then--XORI
	        mux5_s<="011";
	     --来自memwb的lmd的值       
	  elsif memwbir(31 downto 26)="001111" and memwbir(20 downto 16)=ir(20 downto 16) then
		    mux5_s<="100";
	  elsif ir(31 downto 26)="000010" then--移位指令 
	        mux5_s<="101";  
      else    
		    mux5_s<="000"; --自己的寄存器a中的值
	  end if;
	  
	  
          --来自exmem的aluoutput的值  
	     if ir(31 downto 26)="010000" and exmemir(31 downto 26)="000000" and exmemir(15 downto 11)=ir(20 downto 16) then--算数运算R
	        mux6_s<="01"; 
	  elsif ir(31 downto 26)="010000" and exmemir(31 downto 26)="000001" and exmemir(15 downto 11)=ir(20 downto 16) then--逻辑运算R
		    mux6_s<="01"; 
	  elsif ir(31 downto 26)="010000" and exmemir(31 downto 26)="000010" and exmemir(15 downto 11)=ir(20 downto 16) then--移位指令 
	        mux6_s<="01"; 
	  elsif ir(31 downto 26)="010000" and exmemir(31 downto 26)="000100" and exmemir(20 downto 16)=ir(20 downto 16) then--ADDI
	        mux6_s<="01"; 
	  elsif ir(31 downto 26)="010000" and exmemir(31 downto 26)="000101" and exmemir(20 downto 16)=ir(20 downto 16) then--ADDIU
	        mux6_s<="01"; 
	  elsif ir(31 downto 26)="010000" and exmemir(31 downto 26)="000110" and exmemir(20 downto 16)=ir(20 downto 16) then--SLTI
	        mux6_s<="01"; 
	  elsif ir(31 downto 26)="010000" and exmemir(31 downto 26)="000111" and exmemir(20 downto 16)=ir(20 downto 16) then--ANDI
	        mux6_s<="01";
	  elsif ir(31 downto 26)="010000" and exmemir(31 downto 26)="001000" and exmemir(20 downto 16)=ir(20 downto 16) then--ORI
	        mux6_s<="01"; 
	  elsif ir(31 downto 26)="010000" and exmemir(31 downto 26)="001001" and exmemir(20 downto 16)=ir(20 downto 16) then--XORI
	        mux6_s<="01"; 
	      --来自memwb的aluoutput的值  
	  elsif ir(31 downto 26)="010000" and memwbir(31 downto 26)="000000" and memwbir(15 downto 11)=ir(20 downto 16) then--算数运算R
	        mux6_s<="10"; 
	  elsif ir(31 downto 26)="010000" and memwbir(31 downto 26)="000001" and memwbir(15 downto 11)=ir(20 downto 16) then--逻辑运算R
		    mux6_s<="10"; 
	  elsif ir(31 downto 26)="010000" and memwbir(31 downto 26)="000010" and memwbir(15 downto 11)=ir(20 downto 16) then--移位指令 
	        mux6_s<="10";
	  elsif ir(31 downto 26)="010000" and memwbir(31 downto 26)="000100" and memwbir(20 downto 16)=ir(20 downto 16) then--ADDI
	        mux6_s<="10"; 
	  elsif ir(31 downto 26)="010000" and memwbir(31 downto 26)="000101" and memwbir(20 downto 16)=ir(20 downto 16) then--ADDIU
	        mux6_s<="10"; 
	  elsif ir(31 downto 26)="010000" and memwbir(31 downto 26)="000110" and memwbir(20 downto 16)=ir(20 downto 16) then--SLTI
	        mux6_s<="10"; 
	  elsif ir(31 downto 26)="010000" and memwbir(31 downto 26)="000111" and memwbir(20 downto 16)=ir(20 downto 16) then--ANDI
	        mux6_s<="10"; 
	  elsif ir(31 downto 26)="010000" and memwbir(31 downto 26)="001000" and memwbir(20 downto 16)=ir(20 downto 16) then--ORI
	        mux6_s<="10";
	  elsif ir(31 downto 26)="010000" and memwbir(31 downto 26)="001001" and memwbir(20 downto 16)=ir(20 downto 16) then--XORI
	        mux6_s<="10";
	        --来自memwb的lmd的值       
	  elsif ir(31 downto 26)="010000" and memwbir(31 downto 26)="001111" and memwbir(20 downto 16)=ir(20 downto 16) then
		    mux6_s<="11";
      else    
		    mux6_s<="00"; --自己的寄存器a中的值
	  end if;
	       
	END PROCESS;
end ct;