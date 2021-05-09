library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use work.package_Constant.all;
use work.Package_Moduli_Set_4_w2.all;

ENTITY CSA_IEAC2_TREE IS
GENERIC(n:INTEGER:=4;
        a:INTEGER:=2;
        m:INTEGER:=1;
        rQ1_4:INTEGER:=1;
        R2_4:INTEGER:=1;
        R3_4:INTEGER:=1
        );
         
PORT (Q1 :IN  STD_LOGIC_VECTOR(2*n   DOWNTO 0);
      Q2 :IN  STD_LOGIC_VECTOR(m+(4*n)-1 DOWNTO 0);
      Q3 :IN  STD_LOGIC_VECTOR(m-1 DOWNTO 0);
      Sx4:OUT STD_LOGIC_VECTOR(2*(n-a)-1 DOWNTO 0);
      Cx4:out STD_LOGIC_VECTOR(2*(n-a)-1 DOWNTO 0)
	    	    ); 
	    
END CSA_IEAC2_TREE;

ARCHITECTURE STRUCTURAL OF CSA_IEAC2_TREE IS

 SIGNAL SQ :DATA_2n_2a_VECTOR(R3_4   DOWNTO 1);
 SIGNAL S,C:DATA_2n_2a_VECTOR(R3_4-2 DOWNTO 1);
 

BEGIN 
--------------------------------------------------------------------------------------- 
DIVIDER_Q1:FOR i IN 1 TO rQ1_4 GENERATE
                 G_x4:DIVIDER_BIT_P GENERIC MAP(2*n+1,2*(n-a),i) PORT MAP (Q1,SQ(i));
           END GENERATE DIVIDER_Q1;

DIVIDER_Q2:FOR j IN (rQ1_4+1) TO R2_4 GENERATE
              G_B:DIVIDER_BIT_P     GENERIC MAP(m+(4*n),2*(n-a),(J-rQ1_4)) PORT MAP (Q2,SQ(j));
           END GENERATE DIVIDER_Q2;

DIVIDER_Q3:FOR w IN (R2_4+1) TO R3_4 GENERATE
                 G_B:DIVIDER_BIT_P_R GENERIC MAP(m,2*(n-a),(w-R2_4)) PORT MAP (Q3,SQ(w));
           END GENERATE DIVIDER_Q3;

------------------------------------------------------------------------------------------
CSA_Q:FOR x IN 3 TO R3_4 GENERATE
           GCSA_FIRST: IF x=3 GENERATE
           G:CSA_WITH_IEAC     GENERIC MAP (2*(n-a))      PORT MAP (SQ(3),SQ(2),SQ(1),S(1),C(1));
       END GENERATE GCSA_FIRST; 
GCSA_REST:IF x>3 GENERATE 
              G1:CSA_WITH_IEAC GENERIC MAP (2*(n-a))      PORT MAP (S(x-3),C(x-3),SQ(x),S(x-2),C(x-2)); 
          END GENERATE GCSA_REST; 
      END GENERATE CSA_Q;
      Sx4<=S(R3_4-2);
      Cx4<=C(R3_4-2); 

 
END STRUCTURAL;

