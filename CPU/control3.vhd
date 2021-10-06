LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL,IEEE.NUMERIC_STD.ALL;

ENTITY control3 IS
PORT( 
      
	  IR : IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
	  regwrite: out std_logic;                         
	   
	  mux7_s: out std_logic;
	  mux8_s: OUT  STD_LOGIC                
	);	         
END control3;

ARCHITECTURE ct OF control3 IS
	
BEGIN
		
	PROCESS(IR)		
	BEGIN
	
		if ir(31 downto 26)="010000" or ir(31 downto 0)= x"00000000" or (ir(31 downto 26)<"001111" and ir(31 downto 26)>"001001") then
		    regwrite<='0';
		else
		    regwrite<='1';
		end if; -- �ж��Ƿ���Ҫ���¼Ĵ������ָ��
		
		
		--�жϽ�˭����Ĵ�����
		if ir(31 downto 26)="001111"  then
		    mux7_s<='0';--ѡ��lmd������
		else
		    mux7_s<='1';
		end if;
		
		if ir(31 downto 26)="000000"  then  -- ѡ��rd��ΪĿ���ַ
		    mux8_s<='0';
		elsif ir(31 downto 26)="000001"  then  -- ѡ��rd��ΪĿ���ַ
		    mux8_s<='0';
	    elsif ir(31 downto 26)="000010"  then  -- ѡ��rd��ΪĿ���ַ
		    mux8_s<='0';
		else   --ѡ��rt��ΪĿ���ַ
		    mux8_s<='1'; 
		end if ;
	
	END PROCESS;

	end;