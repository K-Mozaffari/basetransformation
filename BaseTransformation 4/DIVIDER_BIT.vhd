library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Package_Moduli_Set_4_W2.all;

ENTITY DIVIDER_BIT IS
 GENERIC( n:INTEGER:=6; 
         n_a:INTEGER:=3;
         i:INTEGER:=1
        );
 PORT   (x_in :IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	 x_out:OUT STD_LOGIC_VECTOR((i*(n_a))-1 DOWNTO (i-1)*(n_a))
	 ); 
END DIVIDER_BIT;

ARCHITECTURE STRUCTURAL OF DIVIDER_BIT IS
   SIGNAL GND:STD_LOGIC_VECTOR(i*(n_a)-1 DOWNTO n):=(OTHERS=>'0');
  BEGIN 
 G0:IF i*n_a<n or i*n_a=n  GENERATE
       x_out<=x_in(i*(n_a)-1 DOWNTO (i-1)*n_a);
    END GENERATE G0;
 G1:IF  i*n_a>n GENERATE
       x_out<=GND(i*(n_a)-1 DOWNTO n )& x_in(n-1 DOWNTO (i-1)*n_a);
    END GENERATE G1;
END STRUCTURAL;

