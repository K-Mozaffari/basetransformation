

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.math_real.all;
use work.package_Constant.all;
use work.func.all;

package Package_Moduli_Set_4_w2 is

 
 


subtype DATA_n_a is std_logic_vector(n-a-1 downto 0);
type DATA_n_a_VECTOR  is array(natural range <>) of DATA_n_a;

subtype DATA_2n_2a is std_logic_vector(2*(n-a)-1 downto 0);
type DATA_2n_2a_VECTOR  is array(natural range <>) of DATA_2n_2a;
--------------------------------------------------------------------------------

COMPONENT ADDER_MAPPING_EAC  
  GENERIC (n:INTEGER:=4;
           a:INTEGER:=2
           );     
 PORT (Sx3          :IN  STD_LOGIC_VECTOR(n-a-1 DOWNTO 0);
       Cx3          :IN  STD_LOGIC_VECTOR(n-a-1 DOWNTO 0);
       C3_SIGN      :IN  STD_LOGIC_VECTOR(n-a-1 DOWNTO 0);
       C3_CARRY     :IN  STD_LOGIC_VECTOR(n-a-1 DOWNTO 0);
       C3_SIGN_CARRY:IN  STD_LOGIC_VECTOR(n-a-1 DOWNTO 0);
       Cp           :IN  STD_LOGIC;
       SIGN         :IN  STD_LOGIC;
       x_3          :OUT STD_LOGIC_VECTOR(n-a-1 DOWNTO 0)
       );
	    
END COMPONENT;

COMPONENT ADDER_MAPPING_IEAC  
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
	    
END COMPONENT;

COMPONENT ADDER_MAPPING_IEAC2  
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
	    
END COMPONENT;

COMPONENT BASE_TRANSFORMATION_M4_W2   
  GENERIC (n:INTEGER:=4;
           a:INTEGER:=2;
           m:INTEGER:=1;
           RQ1:INTEGER:=1;
           R2:INTEGER:=1;
           R3:INTEGER:=1;
           rQ1_4:INTEGER:=1;
           R2_4:INTEGER:=1;
           R3_4:INTEGER:=1
         );
 PORT (x1_in :IN  STD_LOGIC_VECTOR(n     DOWNTO 0);
       x2_in :IN  STD_LOGIC_VECTOR(2*n-1   DOWNTO 0);
       x3_in :IN  STD_LOGIC_VECTOR(n-1   DOWNTO 0);
       x4_in :IN  STD_LOGIC_VECTOR(2*n  DOWNTO 0);
       x1_out:OUT STD_LOGIC_VECTOR(n-a   DOWNTO 0);
       x2_out:OUT STD_LOGIC_VECTOR(2*n-a-1 DOWNTO 0);
       x3_out:OUT STD_LOGIC_VECTOR(n-a-1 DOWNTO 0);
       x4_out:OUT STD_LOGIC_VECTOR(2*(n-a) DOWNTO 0)
       );
END COMPONENT;

COMPONENT CPA_FA   
GENERIC( n:INTEGER:=4);
PORT(Xin,Yin:IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
     Cin    :IN  STD_LOGIC;
     Sout   :OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
     Cout   :OUT STD_LOGIC
     );
END COMPONENT;

COMPONENT CPA_HA   
 GENERIC( n:INTEGER:=4);
 PORT(Xin :IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
      Yin :IN  STD_LOGIC;
      Sout:OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);Cout: OUT STD_LOGIC
      );
END COMPONENT;

COMPONENT CPA_WITH_EAC   ---(2^2n-1)
 GENERIC(n:INTEGER:=2);
 PORT (Xin,Yin:IN   STD_LOGIC_VECTOR(n-1 DOWNTO 0);
       Sout   :OUT  STD_LOGIC_VECTOR(n-1 DOWNTO 0)
       );
END COMPONENT;

COMPONENT CPA_WITH_IEAC   ---(2^n+1)
GENERIC(n:INTEGER:=3);
PORT (Xin,Yin:IN   STD_LOGIC_VECTOR(n-1 DOWNTO 0);Cin:IN STD_LOGIC;
      Sout   :OUT  STD_LOGIC_VECTOR(n DOWNTO 0)
      );
END COMPONENT;

COMPONENT CSA  ---(2^n) 
 GENERIC(n:INTEGER:=4);
 PORT   (Xin,Yin,Zin:IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
         Sout,Cout  :OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
         );
END COMPONENT;

COMPONENT CSA_EAC_TREE  
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
	    
END COMPONENT;

COMPONENT CSA_IEAC2_TREE  
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
	    
END COMPONENT;

COMPONENT CSA_IEAC_TREE  
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
      Sx1 :OUT STD_LOGIC_VECTOR((n-a-1) DOWNTO 0);
      Cx1 :OUT STD_LOGIC_VECTOR((n-a-1) DOWNTO 0)
	    	    ); 
	    
END COMPONENT;

COMPONENT CSA_WITH_EAC  ---(2^n-1) 
 GENERIC(n:INTEGER:=4);
 PORT   (Xin,Yin,Zin:IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
         Sout,Cout:OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
         );
END COMPONENT;

COMPONENT CSA_WITH_IEAC  ---(2^n+1) 
 GENERIC(n:INTEGER:=4);
 PORT   (Xin,Yin,Zin:IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
         Sout,Cout  :OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
         );
END COMPONENT;

COMPONENT DETECTOR_ONE   
 GENERIC (n:INTEGER:=3);
 PORT (Xin : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
       Dout: OUT STD_LOGIC
       );
END COMPONENT;

COMPONENT DIVIDER_BIT  
 GENERIC( n:INTEGER:=6; 
         n_a:INTEGER:=3;
         i:INTEGER:=1
        );
 PORT   (x_in :IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	 x_out:OUT STD_LOGIC_VECTOR((i*(n_a))-1 DOWNTO (i-1)*(n_a))
	 ); 
END COMPONENT;

COMPONENT DIVIDER_BIT_P  
 GENERIC(n:INTEGER:=6; 
         n_a:INTEGER:=3;
         i:INTEGER:=2
         );
 PORT    (x_in :IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	  x_out:OUT STD_LOGIC_VECTOR((i*(n_a))-1 DOWNTO (i-1)*(n_a))
	 ); 
END COMPONENT;

COMPONENT DIVIDER_BIT_P_R  
 GENERIC(n:INTEGER:=6; 
        n_a:INTEGER:=3;
        i:INTEGER:=2
         );
 PORT (x_in :IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
       x_out:OUT STD_LOGIC_VECTOR((i*(n_a))-1 DOWNTO (i-1)*(n_a))
       ); 
END COMPONENT;

COMPONENT FULL_ADDER   
  PORT (Xin,Yin,Cin:IN STD_LOGIC;
        Sout,Cout  :out STD_LOGIC
        );
END COMPONENT;

COMPONENT HALF_ADDER  
  PORT (Xin,Yin  :IN  STD_LOGIC;
        Sout,Cout:OUT STD_LOGIC
        );
END COMPONENT;

COMPONENT mux2to1  
generic (
	n : integer := 16
	);
	port (
		din0 : in std_logic_vector( n-1 downto 0);
		din1 : in std_logic_vector( n-1 downto 0);
		sel  : in std_logic;
		dout : out std_logic_vector( n-1 downto 0)

	);
end COMPONENT;



COMPONENT mux4to1  
generic (
	n : integer := 16
	);
	port (
		din0 : in std_logic_vector( n-1 downto 0);
		din1 : in std_logic_vector( n-1 downto 0);
		din2 : in std_logic_vector( n-1 downto 0);
		din3 : in std_logic_vector( n-1 downto 0);
		sel  : in std_logic_VECTOR(1 DOWNTO 0 );
		dout : out std_logic_vector( n-1 downto 0)

	);
end COMPONENT;

COMPONENT OPU_1   
 GENERIC (n:INTEGER:=5 );
 PORT (x1 :IN  STD_LOGIC_VECTOR(n     DOWNTO 0);
       x3 :IN  STD_LOGIC_VECTOR(n-1   DOWNTO 0);
       x4 :IN  STD_LOGIC_VECTOR(2*n   DOWNTO 0);
       P1 :OUT STD_LOGIC_VECTOR(2*n-1 DOWNTO 0);
       P2 :OUT STD_LOGIC_VECTOR(2*n-1 DOWNTO 0);
       P31:OUT STD_LOGIC_VECTOR(2*n-1 DOWNTO 0);
       P32:OUT STD_LOGIC_VECTOR(2*n-1 DOWNTO 0)
      );
END COMPONENT;

COMPONENT OPU_2   
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
END COMPONENT;

COMPONENT OPU_3  
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

END COMPONENT;

COMPONENT UNIT_BL  ---(Adder 2^n)
 GENERIC (n : INTEGER := 3
	  );
 PORT    (	B1_in : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		B2_in : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		B3_in : IN  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		Cp    : IN  STD_LOGIC;
		BL_out: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	  );
END COMPONENT;

COMPONENT UNIT_PCp  ---(Adder 2^2n-1)
 GENERIC (n : INTEGER := 3
	 );
	PORT (	P1_in : IN  STD_LOGIC_VECTOR(2*n-1 DOWNTO 0);
		P2_in : IN  STD_LOGIC_VECTOR(2*n-1 DOWNTO 0);
		P31_in: IN  STD_LOGIC_VECTOR(2*n-1 DOWNTO 0);
		P32_in: IN  STD_LOGIC_VECTOR(2*n-1 DOWNTO 0);
		P_out : OUT STD_LOGIC_VECTOR(2*n-1 DOWNTO 0);
		Cp    : OUT STD_LOGIC
	      );
END COMPONENT;


END PACKAGE;



