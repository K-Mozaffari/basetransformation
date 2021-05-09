library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.Package_Moduli_Set_4_w2.ALL;

ENTITY OPU_2 IS 
 GENERIC (n:INTEGER:=5;
	  m:INTEGER:=1
          );
 PORT (P   :IN   STD_LOGIC_VECTOR(2*n-1 DOWNTO 0);
       x2in:IN   STD_LOGIC_VECTOR(2*n-1 DOWNTO 0);
       x4in:IN   STD_LOGIC_VECTOR(2*n   DOWNTO 0);
       B1  :OUT  STD_LOGIC_VECTOR(m-1   DOWNTO 0);
       B2  :OUT  STD_LOGIC_VECTOR(m-1   DOWNTO 0);
       B3  :OUT  STD_LOGIC_VECTOR(m-1   DOWNTO 0)
              );
END OPU_2;

ARCHITECTURE STRUCTURAL OF OPU_2 IS
  SIGNAL x2_NOT :STD_LOGIC_VECTOR(m-1   DOWNTO 0);

 BEGIN
   x2_NOT<=NOT(x2in(m-1   DOWNTO 0));
   B1<=x4in(m-1 DOWNTO 0);
   B2<=P(m-1 DOWNTO 0);
   B3<=x2_NOT(m-1 DOWNTO 0);
END STRUCTURAL;


