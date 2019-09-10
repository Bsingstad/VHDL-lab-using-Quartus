library IEEE;
    use IEEE.std_logic_1164.all;

    entity lab1 is
      port (
		sw : in STD_logic_vector(3 downto 0);
		hex : out STD_logic_vector(6 downto 0)
          );
        end entity lab1;

    architecture Behavioral of lab1 is

    begin
	 
	 process(sw)
	 begin
	 
	 case sw is
		when "0000" =>
		hex <= "1000000"; ---0
		when "0001" =>
		hex <= "1111001"; ---1
		when "0010" =>
		hex <= "0100100"; ---2
		when "0011" =>
		hex <= "0110000"; ---3
		when "0100" =>
		hex <= "0011001"; ---4
		when "0101" =>
		hex <= "0010010"; ---5
		when "0110" =>
		hex <= "0000010"; ---6
		when "0111" =>
		hex <= "1111000"; ---7
		when "1000" =>
		hex <= "0000000"; ---8
		when "1001" =>
		hex <= "0010000"; ---9
		when others =>
		hex <= "1111111"; ---null
	 end case;


	end process;

   end Behavioral;