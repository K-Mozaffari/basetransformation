library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity mux4to1 is
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
end mux4to1;

architecture Behavioral of mux4to1 is

begin

	muxit: process (din0,din1,din2,din3,sel)
	begin 
	case sel is
		when "00" =>
			dout <= din0;
		when "01" =>
			dout <= din1;
		when "10" =>
			dout <= din2;
		when "11" =>
			dout <= din3;
                when others => 
			dout <= (others => '0');

	end case;

	end process;


end Behavioral;

