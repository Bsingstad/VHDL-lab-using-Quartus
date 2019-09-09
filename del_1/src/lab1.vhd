library IEEE;
    use IEEE.std_logic_1164.all;

    entity lab1 is
      port (
		sw : in STD_logic_vector(9 downto 0);
		led : out STD_logic_vector(9 downto 0)
          -- YOUR TASK:
          -- Insert the needed port declarations
          -- Use identifier names led and sw when naming the ports.
          );
        end entity lab1;

    architecture top_level of lab1 is

    begin
	  --PIN_C10 => PIN_A8;
		led <= sw;
      -- YOUR TASK:
      -- Insert statement to assign all switches to the LEDs.

    end architecture top_level;