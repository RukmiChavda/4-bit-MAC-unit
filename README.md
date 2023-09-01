# 4-bit-MAC-unit
![4-bit MAC design](https://github.com/RukmiChavda/4-bit-MAC-unit/assets/82014536/b4de0fde-0ac0-4bf6-970c-923eff331579)

# Simulation of MAC unit
![simulation](https://github.com/RukmiChavda/4-bit-MAC-unit/assets/82014536/131f8350-687e-4ade-8d88-395ecc04953a)

# Schematics
![4 MAC](https://github.com/RukmiChavda/4-bit-MAC-unit/assets/82014536/5272d8d3-0bfc-4d19-a974-d1774ae0cdce)


# MAC unit 
MAC stands for Multiplication and Accumulation. MAC is extremely used in all kinds of matrix operations, such as convolution for filtering, dot operations, and even polynomial evaluations. Fast Fourier Transform (FFT) and DTFT require a large number of multiplication and addition operations. The performance of the processor depends mainly on the MAC unit. The area occupancy, power consumption, and delay incurred in the MAC unit can influence the system's overall performance. 

![Diagram 1](https://github.com/RukmiChavda/4-bit-MAC-unit/assets/82014536/65c8947b-6a28-4721-b8d1-2b7618b8bb6d)

This project was developed based on a 4-bit bus width. (N = 4-bit). Therefore in output  multiplier returns  8-bits (2N = 2(4) = 8-bits) and adder returns 9-bits (2N + 1 = 2(4) + 1 = 9-bits). According to that output MAC needs a 9-bit accumulator. This MAC design uses the Wallace tree multiplier as a multiplication unit, the Carry save adder as an adder unit, and for the accumulator unit, it uses D flip-flops in the PIPO register.

# Wallance tree multiplier
Wallace tree multipliers are very popular as multipliers because of their speed and modularity. Wallace tree multipliers are similar to the conventional multiplication technique but there is one extra part of partial products reduction. The partial product tree of  N2 bits is
formed and adjacent rows are grouped into either a three-row group or a two-row group. The full adder or half adder is applied according to the number of bits in the group. And if there is only one bit, then it is not processed at the present stage but passed to the next stage. This reduction process is repeated until the number of rows is reduced to two. Any carry-propagating adder is used for the addition of the remaining two rows to generate the product. 

![Diagram 4](https://github.com/RukmiChavda/4-bit-MAC-unit/assets/82014536/07cf8ed1-05ff-472a-9c98-5d7cef3ca1f4)

# Carry save adder
A carry-save adder is designed to compute the sum of three or more n-bit binary numbers and it differs from other digital adders in a way that results in two outputs namely sum and carry which are a sequence of partial sum bits and a sequence of carry bits respectively. here 4-bit conventional CSA shown in figure 1.5 has 2-half adders and 6-full adders. This structure consists of a ripple carry adder (RCA) in the final stage which yields a large carry propagation delay. 

![Diagram 2](https://github.com/RukmiChavda/4-bit-MAC-unit/assets/82014536/7f978d12-eb15-4a6c-84d1-12be4d8b9dff)

#Accumulator 
The accumulator is a register that stores the sum of products. Parallel In Parallel Out(PIPO) shift registers are widely used as accumulators as they are fast and output is given within a single clock pulse. To develop a 9-bit PIPO shift register it uses 9  D flip-flops. In the design D flip-flop works at the positive edge of the clock pulse and reset occurs at the negative edge of the clock pulse. 

![Diagram 3](https://github.com/RukmiChavda/4-bit-MAC-unit/assets/82014536/1e335f4d-1fe1-46c7-b7cd-63cac7933252)

# Code Structure 

![Diagram 8](https://github.com/RukmiChavda/4-bit-MAC-unit/assets/82014536/18501ee1-6f7c-4b0d-a0e7-118b3bfa6bd6)

# Introduction to Qflow
A digital synthesis flow is a set of tools and methods used to turn a circuit design written in a high-level behavioral language like Verilog or VHDL into a physical circuit, which can either be configuration code for an FPGA or a layout in a specific fabrication process technology, that would become part of a fabricated circuit chip but majorly EDA tools which required to design a chip have very expensive licensing which is not affordable to small scale companies or students. It is generating a huge gap in the market.

Qflow is a set of open-source EDA tools. It has a complete set of tools for synthesizing digital circuits starting from the Verilog source and ending in a physical layout for a specific target fabrication process. Using the Qflow toolchain, it is not possible to create the next generation of multi-gigahertz microprocessors, But the qflow toolchain is perfectly capable of handling digital subsystems needed by many chips, including host-to-device communications (SPI and I2C, for example), signal processing (digital filters, sigma-delta modulators), arithmetic logic units, and much more. 

One noticeable point is that Qflow is run on the Ubuntu operating system. It is not available in any other operating system. It does not require any high-end machines to run the toolchain. Qflow controls five tools in a one-liner flow which is capable to wire the Verilog program to generate the GDSII file. 

![Qflow2](https://github.com/RukmiChavda/4-bit-MAC-unit/assets/82014536/eafc62ac-baf5-4e3d-9858-0de4d28a5497)


# 
