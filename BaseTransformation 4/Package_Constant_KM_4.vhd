

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.math_real.all;
use work.func.all;

package package_Constant is

 
 CONSTANT n:INTEGER:=5;
 CONSTANT a:INTEGER:=2;
 CONSTANT m:INTEGER:=INTEGER(ROF(2*n-(5*a)));
 CONSTANT C_SIGN:INTEGER:=(2**m)*(2**(4*a)-1);
 CONSTANT C_CARRY:INTEGER:=(2**(2*n)+1);
------------------------------------------------------------------------------------------
 CONSTANT rQ1:INTEGER:=integer(CEIL(real(REAL(2*n+1  )/REAL(n-a))));
 CONSTANT rQ2:INTEGER:=integer(CEIL(real(REAL((m+(4*n))  )/REAL(n-a)))); 
 CONSTANT rQ3:INTEGER:=integer(CEIL(real(REAL((m)  )/REAL(n-a))));
 
 CONSTANT R2 :INTEGER:=integer(rQ1+rQ2);
 CONSTANT R3 :INTEGER:=integer(R2+rQ3);

  CONSTANT NO_Q1_1:INTEGER:=(COUNTER_EVEN(rQ1));
  CONSTANT NO_Q2_1:INTEGER:=(COUNTER_EVEN(rQ2));
  CONSTANT NO_Q3_1:INTEGER:=(COUNTER_ODD (rQ3));
  CONSTANT NO_TOTAL_1 :INTEGER:=( NO_Q1_1+NO_Q2_1+NO_Q3_1);

  CONSTANT RF1      :INTEGER:=(n_csa(R3+1,NO_TOTAL_1)-1);---cin Input  Extra csa 
 
--***************************************************************************************************************
  CONSTANT rQ1_4:INTEGER:=integer(CEIL(real(REAL(2*n+1)/REAL(2*(n-a)))));
  CONSTANT rQ2_4:INTEGER:=integer(CEIL(real(REAL((m+(4*n))  )/REAL(2*(n-a))))); 
  CONSTANT rQ3_4:INTEGER:=integer(CEIL(real(REAL(m  )/REAL(2*(n-a)))));

  CONSTANT R2_4 :INTEGER:=integer(rQ1_4+rQ2_4);
  CONSTANT R3_4 :INTEGER:=integer(rQ1_4+rQ2_4+rQ3_4);

  CONSTANT NO_Q1_4:INTEGER:=(COUNTER_EVEN(rQ1_4));
  CONSTANT NO_Q2_4:INTEGER:=(COUNTER_EVEN(rQ2_4));
  CONSTANT NO_Q3_4:INTEGER:=(COUNTER_ODD (rQ3_4));
  CONSTANT N_O_TOTAL_4 :INTEGER:=( NO_Q1_4+NO_Q2_4+NO_Q3_4);

  CONSTANT RF4      :INTEGER:=(n_csa(R3_4+1,N_O_TOTAL_4)-1);---cin Input  Extra csa 
  --------------------------------------------------------------------------------------------------------
  CONSTANT RF1_BIN      :STD_LOGIC_VECTOR(n-a DOWNTO 0):=(conv_std_logic_vector(((RF1)mod(2**(n-a)+1)),(n-a+1)));
  CONSTANT C1_SIGN      :STD_LOGIC_VECTOR(n-a DOWNTO 0):=(conv_std_logic_vector(((RF1-C_SIGN)mod(2**(n-a)+1)),(n-a+1)));
  CONSTANT C1_CARRY     :STD_LOGIC_VECTOR(n-a DOWNTO 0):=(conv_std_logic_vector(((RF1+C_CARRY)mod(2**(n-a)+1)),(n-a+1)));
  CONSTANT C1_SIGN_CARRY:STD_LOGIC_VECTOR(n-a DOWNTO 0):=(conv_std_logic_vector(((RF1+C_CARRY-C_SIGN)mod(2**(n-a)+1)),(n-a+1)));

  CONSTANT C3_SIGN      :STD_LOGIC_VECTOR(n-a-1 DOWNTO 0):=not(conv_std_logic_vector( ((C_SIGN)mod(2**(n-a)-1)),(n-a)));
  CONSTANT C3_CARRY     :STD_LOGIC_VECTOR(n-a-1 DOWNTO 0):=(conv_std_logic_vector( ((C_CARRY)mod(2**(n-a)-1)),(n-a)));
  CONSTANT C3_SIGN_CARRY:STD_LOGIC_VECTOR(n-a-1 DOWNTO 0):=(conv_std_logic_vector( ((C_CARRY-C_SIGN)mod(2**(n-a)-1)),(n-a)));

  CONSTANT RF4_BIN:STD_LOGIC_VECTOR(2*(n-a)       DOWNTO 0):=   (conv_std_logic_vector( ((RF4)mod(2**(2*(n-a))+1)),2*(n-a)+1));
  CONSTANT C4_SIGN:STD_LOGIC_VECTOR(2*(n-a) DOWNTO 0):=   (conv_std_logic_vector( ((RF4-C_SIGN)mod(2**(2*(n-a))+1)),2*(n-a)+1));
  CONSTANT C4_CARRY:STD_LOGIC_VECTOR(2*(n-a) DOWNTO 0):=(conv_std_logic_vector( ((RF4+C_CARRY)mod(2**(2*(n-a))+1)),2*(n-a)+1));
  CONSTANT C4_SIGN_CARRY:STD_LOGIC_VECTOR(2*(n-a) DOWNTO 0):=(conv_std_logic_vector( ((RF4+C_CARRY-C_SIGN)mod(2**(2*(n-a))+1)),2*(n-a)+1));




 

END PACKAGE;



