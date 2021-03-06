
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.Package_Moduli_Set_4_w2.ALL;

ENTITY CPA_FA IS 
GENERIC( n:INTEGER:=4);
PORT(Xin,Yin:IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
     Cin    :IN  STD_LOGIC;
     Sout   :OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
     Cout   :OUT STD_LOGIC
     );
END CPA_FA;

ARCHITECTURE STRUCTURAL OF CPA_FA IS 
  SIGNAL C:STD_LOGIC_VECTOR(n DOWNTO 0);
 BEGIN
  C(0)<=CIN;
  G:FOR i IN 0 TO n-1 GENERATE 
	G_C: FULL_ADDER PORT MAP (Xin(i),Yin(i),C(i),Sout(i),C(i+1));
  END GENERATE G;
        Cout<=C(n);
END STRUCTURAL;
