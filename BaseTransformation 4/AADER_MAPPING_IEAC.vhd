library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use work.package_Constant.all;
use work.Package_Moduli_Set_4_w2.all;

ENTITY ADDER_MAPPING_IEAC IS
 GENERIC (n:INTEGER:=4;
          a:INTEGER:=2
           );           
PORT (Sx1          :IN  STD_LOGIC_VECTOR(n-a-1 DOWNTO 0);
      Cx1          :IN  STD_LOGIC_VECTOR(n-a-1 DOWNTO 0);
      RF1_BIN      :IN  STD_LOGIC_VECTOR(n-a   DOWNTO 0);
      C1_SIGN      :IN  STD_LOGIC_VECTOR(n-a   DOWNTO 0);
      C1_CARRY     :IN  STD_LOGIC_VECTOR(n-a    DOWNTO 0);
      C1_SIGN_CARRY:IN  STD_LOGIC_VECTOR(n-a    DOWNTO 0);  
      Cp           :IN  STD_LOGIC;
      SIGN         :IN  STD_LOGIC;
      x_1          :OUT STD_LOGIC_VECTOR((n-a) DOWNTO 0)
	    	    ); 
	    
END ADDER_MAPPING_IEAC;

ARCHITECTURE STRUCTURAL OF ADDER_MAPPING_IEAC IS
 SIGNAL S1,C1,OMUX_1:STD_LOGIC_VECTOR(n-a-1 DOWNTO 0);
 SIGNAL OMUX:STD_LOGIC_VECTOR(n-a DOWNTO 0);
 SIGNAL OMUX_2 :STD_LOGIC;
 SIGNAL SEL :STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN 
----------------------------------------------------------------
SEL<=Cp&SIGN;
OMUX_1<=OMUX(n-a-1 DOWNTO 0);
OMUX_2<=NOT(OMUX(n-a));

    CSA:CSA_WITH_IEAC GENERIC MAP (n-a)   PORT MAP (Sx1,Cx1,OMUX_1,S1,C1);
    CPA:CPA_WITH_IEAC GENERIC MAP (n-a)   PORT MAP (S1,C1,OMUX_2,x_1);
    MUX:MUX4TO1       GENERIC MAP (n-a+1) PORT MAP (RF1_BIN,C1_SIGN,C1_CARRY,C1_SIGN_CARRY,SEL,OMUX);



 
END STRUCTURAL;

