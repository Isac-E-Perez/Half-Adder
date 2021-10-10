library ieee;
use ieee.std_logic_1164.all;

entity ha is 
	port 
	(
		a: in std_ulogic; -- single beat signal
		b: in std_ulogic;
		o: out std_ulogic; -- sum 
		c: out std_ulogic -- carry out
	);
end ha;

-- describe the behavior of the entity created

architecture behave of ha is 
begin
	o <= a xor b; -- half adder
	c <= a and b; -- carry out
end behave;

-- note: check if syntax error in code. syntax check: ghdl -s filename.vhdl
