library ieee;
use ieee.std_logic_1164.all;

entity ha_tb is -- no input or output signals
end ha_tb;

architecture test of ha_tb is
	component ha 
		port 
		(
			a: in std_ulogic; -- single beat signal
			b: in std_ulogic;
			o: out std_ulogic; -- sum 
			c: out std_ulogic -- carry out
		);
	end component;
	
	-- create a number of signals I will use in my testbench
	
	signal a, b, o, c : std_ulogic;
begin -- describe the behavior of my testbench
	half_adder: ha port map (a => a, b => b, o => o, c => c);
	
	process begin
	
	a <= 'X';
	b <= 'X';
	wait for 1 ns;
	
	a <= '0';
	b <= '0';
	wait for 1 ns;
	
	a <= '0';
	b <= '1';
	wait for 1 ns;
	
	a <= '1';
	b <= '0';
	wait for 1 ns;
	
	a <= '1';
	b <= '1';
	wait for 1 ns;
	
	assert false  report "Reached end of test";
	wait;
	
	end process;
end test;

-- cls to clear terminal screen. 

-- analyze the half adder: ghdl -a filename.vhdl
-- no messages means everything is good and ready to go

-- to execute the testbench: elaborate: ghdl -e filename 
