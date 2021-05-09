library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use work.package_Constant.all;
use work.Package_Moduli_Set_4_w2.all;

ENTITY ADDER_MAPPING_IEAC2 IS
 GENERIC (n:INTEGER:=4;
          a:INTEGER:=2
           );           
PORT (Sx4          :IN  STD_LOGIC_VECTOR(2*(n-a)-1 DOWNTO 0);
      Cx4          :IN  STD_LOGIC_VECTOR(2*(n-a)-1 DOWNTO 0);
      RF4_BIN      :IN  STD_LOGIC_VECTOR(2*(n-a)   DOWNTO 0);
      C4_SIGN      :IN  STD_LOGIC_VECTOR(2*(n-a)   DOWNTO 0);
      C4_CARRY     :IN  STD_LOGIC_VECTOR(2*(n-a)   DOWNTO 0);
      C4_SIGN_CARRY:IN  STD_LOGIC_VECTOR(2*(n-a)   DOWNTO 0);
      Cp           :IN  STD_LOGIC;
      SIGN         :IN  STD_LOGIC;
      x_4          :OUT STD_LOGIC_VECTOR(2*(n-a)   DOWNTO 0)
	    	    ); 
	    
END ADDER_MAPPING_IEAC2;

ARCHITECTURE STRUCTURAL OF ADDER_MAPPING_IEAC2 IS
 SIGNAL OMUX        :STD_LOGIC_VECTOR(2*(n-a)   DOWNTO 0);
 SIGNAL S1,C1,OMUX_1:STD_LOGIC_VECTOR(2*(n-a)-1 DOWNTO 0);
 SIGNAL OMUX_2      :STD_LOGIC;
 SIGNAL SEL         :STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN 
SEL<=Cp&SIGN;
OMUX_1<=OMUX(2*(n-a)-1 DOWNTO 0);
OMUX_2<=NOT(OMUX(2*(n-a)));
      CSA:CSA_WITH_IEAC GENERIC MAP (2*(n-a))  PORT MAP (Sx4,Cx4,OMUX_1,S1,C1);
      CPA:CPA_WITH_IEAC GENERIC MAP (2*(n-a))  PORT MAP (S1,C1,OMUX_2,x_4);
      MUX:MUX4TO1       GENERIC MAP (2*(n-a)+1)PORT MAP (RF4_BIN,C4_SIGN,C4_CARRY,C4_SIGN_CARRY,SEL,OMUX);
END STRUCTURAL;

