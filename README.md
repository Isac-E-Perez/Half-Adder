# Half Adder Project

### About:

For this project, I created a logic circuit and used VHDL code to implement the following circuit whose output is the sum and carry.

**Digtial Design Simulation**

![0](https://user-images.githubusercontent.com/89553126/136720282-64545bd5-8a01-4e51-92d9-9ad6a60663e6.PNG)

### Note:
If you use MinGW 32 bit (like I did), you would also need to use GTKWave 32 bit and GHDL 32 bit for the code to work on Windows. 

The circuit diagram was made in Simulink and the following simulation is provided in the files.

### Result:

In VHDL, a and b are the inputs (IN), and o and c are the output (OUT) of my project.  

**I/O's are specified here (the circuit is specified using a Hardware Description Language)**

```VHDL
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
```

**Internal description of the logic circuit is specified here**

```VHDL
-- describe the behavior of the entity created

architecture behave of ha is 
begin
	o <= a xor b; -- half adder
	c <= a and b; -- carry out
end behave;

-- note: check if syntax error in code. syntax check: ghdl -s filename.vhdl
```

Afterwards, I worked on the behavioral (functional) simulation. Here, I will only verify the logical operation of the circuit. Stimuli is provided to the logic circuit, so I can verify the outputs behave as I expect. The VHDL file called '*ha_tb*' is where I specified the stimuli to the logic circuit.

```VHDL
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

-- to elaborate: ghdl -e filename (testbench)

-- to execute the testbench: ghdl -r filename (testbench)

-- now we want to verify the unit using a waveform viewer: ghdl -r filename (testbench) --vcd=filename.vcd

-- to check out waveform use GTKWave program: gtkwave filename.vcd
```

The entity block has no input or output singals going into or out of the 'testbench', which makes sense since 'testbench' is a complete unit. The 'testbench' will go ahead and send the signals to the logic circuit in which it will read back those signals. Afterwards, I could check out whether these signals are correct. Therefore, I don't need anything going into or out of the testbench. Additionally, the process statement is a concurrent statement which is constituted of sequential statements exclusively.

Finally, I verified the unit outputted by using a waveform viewer. Additionally, I verified that the logic was correct with the digital design simulation.

**Test where the variables started with forced unknowns**

![0](https://user-images.githubusercontent.com/89553126/136716713-9a4b099c-b1db-4485-95f8-7093f68bfaea.PNG)

**Test where the variables started at 0**

![1](https://user-images.githubusercontent.com/89553126/136716714-3cd6131b-36d9-4e3d-9847-868f1597bd40.PNG)

![1](https://user-images.githubusercontent.com/89553126/136720365-83850361-0f62-4152-ab39-8a8c79747942.PNG)

**Test where the variables started at *a* = 0 and *b* = 1**

![2](https://user-images.githubusercontent.com/89553126/136716716-8e8b0e60-3517-4d14-bfea-a43b0c669565.PNG)

![2](https://user-images.githubusercontent.com/89553126/136720377-5b149233-d8b3-4828-8998-43a1c0389f48.PNG)

**Test where the variables started at *a* = 1 and *b* = 0**

![3](https://user-images.githubusercontent.com/89553126/136716718-9e2f2e1e-73aa-496c-b7cf-5f4da912e051.PNG)

![3](https://user-images.githubusercontent.com/89553126/136720380-dabd5df5-c3e9-4644-bf09-5175cdb53a22.PNG)

**Test where the variables started at *a* = 1 and *b* = 1**

![4](https://user-images.githubusercontent.com/89553126/136716719-2ea3dd1f-6f07-483d-bf26-dab53e9f42a9.PNG)

![4](https://user-images.githubusercontent.com/89553126/136720385-55985df6-2f6b-461c-a49b-c8cbe9c06697.PNG)

I should be expecting these outputs for the conditions therefore, I know my half adder code is logically correct.
