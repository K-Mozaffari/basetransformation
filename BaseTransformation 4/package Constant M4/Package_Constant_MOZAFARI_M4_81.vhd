library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
package Package_Constant is
CONSTANT n:integer:=8;
CONSTANT a:integer:=1;
CONSTANT Rif:integer:=11;
CONSTANT C1:STD_LOGIC_VECTOR(n-a-1 DOWNTO 0):="1101101";
CONSTANT C2:STD_LOGIC_VECTOR(n-a-1 DOWNTO 0):="0001110";
CONSTANT C3:STD_LOGIC_VECTOR(2*(n-a)-1 DOWNTO 0):="00100000000000";
END PACKAGE;