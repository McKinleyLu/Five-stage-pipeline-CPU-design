LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL,IEEE.NUMERIC_STD.ALL;
--USE WORK.CPU_DEFS.ALL;

ENTITY Control0 IS
PORT( 
	  IR      : IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
	  idexir  : IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
	  exmemir : IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
	 
	  zero : in std_logic;
	  sign : in std_logic;
	
	  addsel,pc_rwrite,ifid_rwrite,idex_rwrite,ifid_clear,idex_clear :OUT  STD_LOGIC;                          
	  
	  ExtOp  :  OUT  STD_LOGIC_vector(1 downto 0);     
	  mux0_s :  OUT  STD_LOGIC_vector(1 downto 0);                       
	  mux1_s :  OUT  STD_LOGIC_vector(1 downto 0);
	  mux2_s :  OUT  STD_LOGIC_vector(1 downto 0);
	  mux3_s :  OUT  STD_LOGIC    
	);	         
END control0;

ARCHITECTURE ct OF control0 IS
	
BEGIN
		
	PROCESS(IR,idexir,exmemir,zero,sign)		
	BEGIN
	    addsel<='1';
		pc_rwrite <= '1';
		ifid_rwrite<= '1';
		ifid_clear<= '0';
		idex_rwrite<= '1';
		idex_clear<= '0'; 
		ExtOp <="10";
		mux0_s<="00";
  
  
  
    if idexir(31 downto 26)="001111"  and (idexir(20 downto 16)=ir(20 downto 16) or idexir(20 downto 16)=ir(25 downto 21)) then 
        --上一条为LW，且下一条要用到LW中的数据
		   pc_rwrite <= '0';
		   ifid_rwrite<= '0';
		   ifid_clear<='0';
		   idex_rwrite<= '1';
		   idex_clear<= '1'; 
		   addsel<='1';
	 elsif  ir(31 downto 26)<"001111" and  ir(31 downto 26)>"001001" then
	     -- 为条件跳转，等待地址确定
	    addsel<='1';
	    pc_rwrite <= '1';
	    ifid_rwrite<= '1';
	    ifid_clear<='1';
	    idex_rwrite<= '1';
	    idex_clear<= '0';       
	
	 elsif ir(31 downto 26)="010001" then--J
	    addsel<='1';
	    pc_rwrite <= '1';
	    ifid_rwrite<= '1';
	    ifid_clear<='1';
	    idex_rwrite<= '1';
	    idex_clear<= '0';    
	 elsif ir(31 downto 26)="000011" then--JR
	    addsel<='1';
	    pc_rwrite <= '1';
	    ifid_rwrite<= '1';
	    ifid_clear<='1';
	    idex_rwrite<= '1';
	    idex_clear<= '0';    	   
	 else
		   pc_rwrite <= '1';
		   ifid_rwrite<= '1';
		   ifid_clear<='0';
		   idex_rwrite<= '1';
		   idex_clear<= '0';
		   addsel<='1';  
	end if;
	
	
   
    if ir(31 downto 26)<"001111" and ir(31 downto 26)>"001001" then--当前条为条件跳转
        if ir(31 downto 26)="001010" then--BEQ
         mux3_s <='1';
	     if idexir(15 downto 11)=ir(25 downto 21)then--ADD BEQ 
	     mux1_s <="01";
	     elsif exmemir(15 downto 11)=ir(25 downto 21) then --ADD ADD BEQ 
         mux1_s<="10"; 
         elsif exmemir(31 downto 26)="001111" and (exmemir(20 downto 16)=ir(25 downto 21)) then --LW ADD BEQ   
         mux1_s<="11";
         else
         mux1_s<="00";
         end if;
       elsif ir(31 downto 26)="001011" then--BGEZ
        mux3_s <='0';
         if idexir(15 downto 11)=ir(25 downto 21)then--ADD BGEZ
	     mux1_s <="01";
	     elsif exmemir(15 downto 11)=ir(25 downto 21) then --ADD ADD BGEZ
         mux1_s<="10"; 
         elsif exmemir(31 downto 26)="001111" and (exmemir(20 downto 16)=ir(25 downto 21)) then --LW ADD BGEZ 
         mux1_s<="11";
         else
         mux1_s<="00";
         end if;
       elsif ir(31 downto 26)="001100" then--BGTZ   
         mux3_s <='0';
          if idexir(15 downto 11)=ir(25 downto 21)then--ADD BGTZ
	      mux1_s <="01";
	      elsif exmemir(15 downto 11)=ir(25 downto 21) then --ADD ADD BGTZ
          mux1_s<="10"; 
          elsif exmemir(31 downto 26)="001111" and (exmemir(20 downto 16)=ir(25 downto 21)) then --LW ADD BGTZ 
          mux1_s<="11";
          else
          mux1_s<="00";
          end if;
       elsif ir(31 downto 26)="001101" then--BLEZ
         mux3_s <='0';
          if idexir(15 downto 11)=ir(25 downto 21)then--ADD BLEZ
	      mux1_s <="01";
	      elsif exmemir(15 downto 11)=ir(25 downto 21) then --ADD ADD BLEZ
          mux1_s<="10"; 
          elsif exmemir(31 downto 26)="001111" and (exmemir(20 downto 16)=ir(25 downto 21)) then --LW ADD BLEZ  
          mux1_s<="11";
          else
          mux1_s<="00";
          end if;
       elsif ir(31 downto 26)="001110" then--BLTZ
         mux3_s <='0';
          if idexir(15 downto 11)=ir(25 downto 21)then--ADD BLTZ
	      mux1_s <="01";
	      elsif exmemir(15 downto 11)=ir(25 downto 21) then --ADD ADD BLTZ
          mux1_s<="10"; 
          elsif exmemir(31 downto 26)="001111" and (exmemir(20 downto 16)=ir(25 downto 21)) then --LW ADD BLTZ
          mux1_s<="11";
          else
          mux1_s<="00";
          end if;
        end if; 
       
       if ir(31 downto 26)="001010" and zero='1'then--BEQ
        mux0_s<="01"; 
       elsif ir(31 downto 26)="001011" and (zero='1' or sign='0')then--BGEZ
        mux0_s<="01"; 
       elsif ir(31 downto 26)="001100" and (sign='0' and zero='0') then--BGTZ   
        mux0_s<="01"; 
       elsif ir(31 downto 26)="001101" and (zero='1' or sign='1') then--BLEZ
        mux0_s<="01"; 
       elsif ir(31 downto 26)="001110" and sign='1'then--BLTZ
        mux0_s<="01"; 
       else
        mux0_s<="00";
         pc_rwrite <='0';
      end if; 
     elsif ir(31 downto 26)="000011" then --当前条为JR
	   if idexir(15 downto 11)=ir(25 downto 21) then--ADD JR
	     mux0_s<="11"; 
	     mux2_s <="01"; 
	   elsif exmemir(15 downto 11)=ir(25 downto 21) then --ADD ADD JR  
         mux0_s<="11";
         mux2_s<="10"; 
       elsif exmemir(31 downto 26)="001111" and (exmemir(20 downto 16)=ir(25 downto 21)) then
         mux0_s<="11";
         mux2_s<="11"; 
       else  --JR
         mux0_s<="11";
         mux2_s<="00";
       end if; 
     elsif ir(31 downto 26)="010001" then --当前条为J
	   mux0_s <= "10";
	   
	 else
	   mux0_s<="00";
	   mux1_s<="00";
	   mux2_s<="00";
	   mux3_s<='0'; 
	   ExtOp<="10";  
	 end if; 
   
  END PROCESS;
end ct;
		