library IEEE;
    use IEEE.std_logic_1164.all;
	 use IEEE.numeric_std.all;
	use ieee.std_logic_unsigned.all; 

    entity lab1 is
      port (
			--sw : in STD_logic_vector(3 downto 0);
			--cout   :out std_logic_vector (3 downto 0); -- Output of the counter
			hex 		 : out STD_logic_vector(6 downto 0);
			clk       : in std_logic;  -- 50 MHz clk
			arst_n    : in std_logic;  -- external active low reset key0
			ext_ena_n : in std_logic  -- external active low enable key1
          );
        end entity lab1;
		  
		  	  
    architecture Behavioral of lab1 is
	 
	 signal counter 	: std_logic_vector(3 downto 0);	--counter that
	 signal r0_input	: std_logic;	--internal signal for edge detector
	 signal r1_input	: std_logic;	--internal signal for edge detector
    begin
	
	
	
	 process (clk, arst_n) begin 
            
			if (arst_n = '0') then
			
         	counter <= "0000";
         
			elsif (rising_edge(clk)) then 
				   r0_input           <= ext_ena_n;
					r1_input           <= r0_input;
            	if (r1_input='1' and r0_input='0') then	--rising edge detector
						counter <= counter + 1;
					
				end if;
         
			end if;
        
		  
	 end process;
		 
	 process(counter) 
	 begin
	 
	 case counter is 
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
		   
