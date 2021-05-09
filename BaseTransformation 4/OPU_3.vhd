library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.Package_Moduli_Set_4_w2.ALL;

ENTITY OPU_3 IS
GENERIC (n:INTEGER:=4;
         m:INTEGER:=1
         ); 
 PORT (x4in :IN  STD_LOGIC_VECTOR(2*n DOWNTO 0);
       Pin  :IN  STD_LOGIC_VECTOR(2*n-1 DOWNTO 0);
       Bl   :IN  STD_LOGIC_VECTOR(m-1 DOWNTO 0);
       Q1   :OUT STD_LOGIC_VECTOR(2*n DOWNTO 0); 
       Q2   :OUT STD_LOGIC_VECTOR(m+(4*n)-1 DOWNTO 0); 
       Q3   :OUT STD_LOGIC_VECTOR(m-1 DOWNTO 0);
       SIGN :OUT STD_LOGIC
       );

END OPU_3;

ARCHITECTURE STRUCTURAL OF OPU_3 IS

 BEGIN
Q1<=x4in;
Q2<=Bl&Pin&Pin;
Q3<= Bl;
SIGN<=Bl(m-1);

END STRUCTURAL;


