library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.package_Constant.all;
use WORK.Package_Moduli_Set_4_w2.ALL;


ENTITY TEST_BASE IS 
---generic (DR: NATURAL:=1000);
END TEST_BASE;
 ARCHITECTURE ST OF TEST_BASE IS 


SIGNAL x1_in:  STD_LOGIC_VECTOR(n       DOWNTO 0);
SIGNAL x2_in:   STD_LOGIC_VECTOR(2*n-1   DOWNTO 0);
SIGNAL x3_in :  STD_LOGIC_VECTOR(n-1     DOWNTO 0);
SIGNAL x4_in :  STD_LOGIC_VECTOR(2*n     DOWNTO 0);
SIGNAL x1_out : STD_LOGIC_VECTOR(n-a     DOWNTO 0);
SIGNAL x2_out:  STD_LOGIC_VECTOR(2*n-a-1 DOWNTO 0);
SIGNAL x3_out:  STD_LOGIC_VECTOR(n-a-1   DOWNTO 0);
SIGNAL x4_out:  STD_LOGIC_VECTOR(2*(n-a) DOWNTO 0);

signal x1_int,x2_int,x3_int,x4_int:integer;
signal x:integer;



signal m1_1:integer :=(2**n+1);
signal m2_1:integer :=(2**(2*n));
signal m3_1:integer :=(2**n-1);
signal m4_1:integer :=((2**(2*n))+1);

signal m1_2:integer :=(2**(n-a)+1);
signal m2_2:integer :=(2**(2*n-a));
signal m3_2:integer :=(2**(n-a)-1);
signal m4_2:integer :=(2**(2*(n-a))+1);
signal t:integer;
signal dd:integer:=(2**(n)+1)*(2**(2*n))*(2**(n)-1)*(2**(2*(n))+1);


signal x1_B,x2_B,x3_B,x4_B:integer;
begin
PROCESS 
 
VARIABLE dr1:integer :=(2**n+1)*(2**(2*n))*(2**n-1)*(2**(2*n)+1);

VARIABLE dr2:integer :=(2**(n-a)+1)*(2**(2*n-a))*(2**(n-a)-1)*(2**(2*(n-a))+1);

BEGIN 
G0:for i in 0 to (dr2/2) loop
x<=i;
t<=0;
wait for 1 ns;
assert (x1_int=x1_B) report "x1 fault" severity  failure;
assert (x2_int=x2_B) report "x2 fault" severity  failure;
assert (x3_int=x3_B) report "x3 fault" severity  failure;
assert (x4_int=x4_B) report "x4 fault" severity  failure;
end loop;

G1:for i in (dr1-dr2/2)  to dr1-1 loop
x<=i;
t<=dd;
wait for 1 ns;
assert (x1_int=x1_B) report "x1 fault" severity  failure;
assert (x2_int=x2_B) report "x2 fault" severity  failure;
assert (x3_int=x3_B) report "x3 fault" severity  failure;
assert (x4_int=x4_B) report "x4 fault" severity  failure;
end loop;
WAIT;
END PROCESS;
x1_in<=conv_std_logic_vector((x mod m1_1),n+1);
x2_in<=conv_std_logic_vector((x mod m2_1),2*n);
x3_in<=conv_std_logic_vector((x mod m3_1),n);
x4_in<=conv_std_logic_vector((x mod m4_1),2*n+1);

x1_B<=((x-t) mod m1_2);
x2_B<=((x-t) mod m2_2);
x3_B<=((x-t) MOD m3_2);
x4_B<=((x-t) MOD m4_2);

G1:BASE_TRANSFORMATION_M4_W2 GENERIC MAP(n,a,m,RQ1,R2,R3,RQ1_4,R2_4,R3_4) PORT MAP (x1_in,x2_in,x3_in,x4_in,x1_out,x2_out,x3_out,x4_out);
x1_int<=(conv_integer(x1_out));
x2_int<=(conv_integer(x2_out));
x3_int<= (conv_integer(x3_out));
x4_int<= (conv_integer(x4_out));


end ST;