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

<img width="416" alt="Screen Shot 2021-10-10 at 8 33 52 PM" src="https://user-images.githubusercontent.com/89553126/136721364-99b9f984-636e-4793-9610-510a316d134f.png">

**Internal description of the logic circuit is specified here**

<img width="563" alt="Screen Shot 2021-10-10 at 8 37 44 PM" src="https://user-images.githubusercontent.com/89553126/136721561-58a3ddc1-7e8e-43a0-b5f5-69850576dc99.png">

Afterwards, I worked on the behavioral (functional) simulation. Here, I will only verify the logical operation of the circuit. Stimuli is provided to the logic circuit, so I can verify the outputs behave as I expect. The VHDL file called '*ha_tb*' is where I specified the stimuli to the logic circuit.

<img width="489" alt="Screen Shot 2021-10-10 at 8 40 57 PM" src="https://user-images.githubusercontent.com/89553126/136721769-7e18015a-ba77-451a-8dc5-10e713cb0831.png">

<img width="792" alt="Screen Shot 2021-10-10 at 8 41 27 PM" src="https://user-images.githubusercontent.com/89553126/136721784-590a3116-67b9-4bbc-aea6-d66b6b5a06ab.png">

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
