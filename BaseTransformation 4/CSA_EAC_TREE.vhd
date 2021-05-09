library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use work.package_Constant.all;
use work.Package_Moduli_Set_4_w2.all;

ENTITY CSA_EAC_TREE IS
GENERIC (n:INTEGER:=4;
         a:INTEGER:=2;
         m:INTEGER:=2;
         RQ1:INTEGER:=1;
         R2:INTEGER:=1;
         R3:INTEGER:=1
         );
         
 PORT (Q1  :IN  STD_LOGIC_VECTOR(2*n   DOWNTO 0);
       Q2  :IN  STD_LOGIC_VECTOR(m+(4*n)-1 DOWNTO 0);
       Q3  :IN  STD_LOGIC_VECTOR(m-1 DOWNTO 0);
       Sx3 :OUT STD_LOGIC_VECTOR((n-a)-1 DOWNTO 0);
       Cx3 :OUT STD_LOGIC_VECTOR((n-a)-1 DOWNTO 0)
       );
	    
END CSA_EAC_TREE;

ARCHITECTURE STRUCTURAL OF CSA_EAC_TREE IS

   SIGNAL SQ :DATA_n_a_VECTOR(R3   DOWNTO 1);
   SIGNAL S,C:DATA_n_a_VECTOR(R3-2 DOWNTO 1);
   SIGNAL SZ :DATA_n_a_VECTOR(R3   DOWNTO R2+1); 
 

 BEGIN 
   DIVIDER_Q1:FOR i IN 1 TO rQ1 GENERATE
                    DIV_Q1:DIVIDER_BIT GENERIC MAP(2*n+1,(n-a),i) PORT MAP (Q1,SQ(i));
              END GENERATE DIVIDER_Q1;
 
   DIVIDER_Q2:FOR j IN (rQ1+1) TO R2 GENERATE
                 DIV_Q2:DIVIDER_BIT        GENERIC MAP((m+(4*n)),(n-a),(J-rQ1)) PORT MAP (Q2,SQ(j));
              END GENERATE DIVIDER_Q2;
 
   DIVIDER_Q3:FOR  z IN  R2+1 TO R3 GENERATE
                 DIV_Q3:DIVIDER_BIT        GENERIC MAP(m,(n-a),(z-R2)) PORT MAP (Q3,SZ(z));
                 SQ(z)<=NOT(SZ(z));
              END GENERATE DIVIDER_Q3; 

-----------------------
   CSA_Q:FOR x IN 3 TO R3 GENERATE
             GCSA_FIRST:IF x=3 GENERATE
                            G:CSA_WITH_EAC GENERIC MAP (n-a)      PORT MAP (SQ(3),SQ(2),SQ(1),S(1),C(1));
                        END GENERATE GCSA_FIRST; 
             GCSA_REST:IF x>3 GENERATE 
                           G1:CSA_WITH_EAC GENERIC MAP (n-a)      PORT MAP (S(x-3),C(x-3),SQ(x),S(x-2),C(x-2)); 
                       END GENERATE GCSA_REST; 
                  END GENERATE CSA_Q;

          Sx3<=S(R3-2);
	  Cx3<=C(R3-2);
END STRUCTURAL;

