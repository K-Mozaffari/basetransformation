library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity mux2to1 is
generic (
	n : integer := 16
	);
	port (
		din0 : in std_logic_vector( n-1 downto 0);
		din1 : in std_logic_vector( n-1 downto 0);
		sel  : in std_logic;
		dout : out std_logic_vector( n-1 downto 0)

	);
end mux2to1;

architecture Behavioral of mux2to1 is

begin

	muxit: process (din0,din1,sel)
	begin 
	case sel is
		when '0' =>
			dout <= din0;
		when '1' =>
			dout <= din1;
                when others => 
			dout <= (others => '0');

	end case;

	end process;


end Behavioral;

