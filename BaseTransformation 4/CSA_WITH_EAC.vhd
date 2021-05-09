library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.Package_Moduli_Set_4_w2.ALL;

ENTITY CSA_WITH_EAC IS---(2^n-1) 
 GENERIC(n:INTEGER:=4);
 PORT   (Xin,Yin,Zin:IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
         Sout,Cout:OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
         );
END CSA_WITH_EAC;

ARCHITECTURE STRUCTURAL OF CSA_WITH_EAC IS
  SIGNAL C:std_logic_vector(n-1 downto 0);
 BEGIN
   GADD: FOR i IN 0 TO n-1 GENERATE 
	  GF: FULL_ADDER PORT MAP(Xin(i),Yin(i),Zin(i),Sout(i),C(i));
	 END GENERATE;
   Cout(n-1 DOWNTO 0)<=C(n-2 DOWNTO 0)&C(n-1);
END STRUCTURAL;