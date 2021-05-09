library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.Package_Moduli_Set_4_w2.ALL;

ENTITY DETECTOR_ONE IS 
 GENERIC (n:INTEGER:=3);
 PORT (Xin : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
       Dout: OUT STD_LOGIC
       );
END DETECTOR_ONE;

ARCHITECTURE STRUCTURAL OF DETECTOR_ONE IS 
  SIGNAL D:STD_LOGIC_VECTOR(n-2 DOWNTO 0);
 BEGIN 
   G: IF n>1 GENERATE
D(0)<= (Xin(0) and Xin(1));
G0:FOR i IN 1 TO n-2 GENERATE
         D(i)<=(D(i-1) and Xin (i+1));
   END GENERATE ;
Dout<=D(n-2);
END GENERATE G;

 GX: IF n=1 GENERATE
Dout<=Xin(n-1);
END GENERATE GX;
END STRUCTURAL;