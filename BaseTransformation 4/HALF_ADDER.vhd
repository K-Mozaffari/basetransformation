library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY HALF_ADDER IS
  PORT (Xin,Yin  :IN  STD_LOGIC;
        Sout,Cout:OUT STD_LOGIC
        );
END HALF_ADDER;
ARCHITECTURE STRUCTURAL OF HALF_ADDER IS
  BEGIN 
    Sout<=Xin XOR Yin;
    Cout<= Xin AND Yin;
END  STRUCTURAL;
  
