library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab1_tb is
end;

architecture testbench of lab1_tb is
  signal clk          : std_logic;
  signal arst_n       : std_logic;
  signal ext_ena_n    : std_logic;
  --signal led          : std_logic_vector(9 downto 0);
  --signal sw           : std_logic_vector(9 downto 0);
  signal clk_ena      : boolean;
  constant clk_period : time := 20 ns;  -- 50 MHz


  signal hex : std_logic_vector(6 downto 0);
  signal counter : std_logic_vector(3 downto 0);


  component lab1 is
    port (
      clk       : in  std_logic;
      arst_n    : in  std_logic;
      ext_ena_n : in  std_logic;
      --led       : out std_logic_vector(9 downto 0);
      --sw        : in  std_logic_vector(9 downto 0);
      hex       : out std_logic_vector(6 downto 0));
  end component lab1;

begin

  UUT : entity work.lab1
    port map (
      clk       => clk,
      arst_n    => arst_n,
      ext_ena_n => ext_ena_n,
      --led       => led,
      --sw        => sw,
      hex      => hex);


  -- create a 50 MHz clock
  clk <= not clk after clk_period/2 when clk_ena else '0';


  stimuli_process : process
  begin
    --set default values
    clk_ena   <= false;
    arst_n    <= '1';
    ext_ena_n <= '1';
    --sw        <= "0101010101";

    --enable clk and wait for 3 clk periods
    clk_ena <= true;
    wait for 3*clk_period;

    --assert arst_n for 3 clk periods
    arst_n <= '0';
    wait for 3*clk_period;

    --deassert arst_n for 3 clk periods
    arst_n <= '1';
    wait for 3*clk_period;

    --enable counter and wait for 20 clk_periods
    ext_ena_n <= '0';
    wait for 20*clk_period;

     --disable counter and wait for 5 clk_periods
    ext_ena_n <= '1';
    wait for 5*clk_period;

    --assert arst_n for 3 clk periods
    arst_n <= '0';
    wait for 3*clk_period;

    --deassert arst_n for 10 clk periods
    arst_n <= '1';
    wait for 3*clk_period;

    --disable clk
    clk_ena <= false;

    --end of simulation
    wait;
  end process stimuli_process;
end architecture testbench;