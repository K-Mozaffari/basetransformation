library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Package_Moduli_Set_4_W2.all;

ENTITY DIVIDER_BIT_P_R IS
 GENERIC(n:INTEGER:=6; 
        n_a:INTEGER:=3;
        i:INTEGER:=2
         );
 PORT (x_in :IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
       x_out:OUT STD_LOGIC_VECTOR((i*(n_a))-1 DOWNTO (i-1)*(n_a))
       ); 
END DIVIDER_BIT_P_R;

ARCHITECTURE STRUCTURAL OF DIVIDER_BIT_P_R IS
   SIGNAL GND:STD_LOGIC_VECTOR(i*(n_a)-1 DOWNTO n):=(OTHERS=>'0');
   SIGNAL x_O:STD_LOGIC_VECTOR((i*(n_a))-1 DOWNTO (i-1)*(n_a));
  BEGIN 
    G0:IF i*n_a<n or i*n_a=n  GENERATE
           x_O<=x_in(i*(n_a)-1 DOWNTO (i-1)*n_a);
       END GENERATE G0;
    G1:IF  i*n_a>n GENERATE
           x_O<=GND(i*(n_a)-1 DOWNTO n )& x_in(n-1 DOWNTO (i-1)*n_a);
       END GENERATE G1;

    GE_EVEN:IF (i Mod 2 )=0 GENERATE
                x_out<= (x_O);
            END GENERATE GE_EVEN;

    GE_ODD:IF (i Mod 2 )>0   GENERATE
               x_out<=NOT(x_O);
           END GENERATE GE_ODD;
END STRUCTURAL;

