# 4-bit-MAC-unit
![4-bit MAC design](https://github.com/RukmiChavda/4-bit-MAC-unit/assets/82014536/b4de0fde-0ac0-4bf6-970c-923eff331579)

# MAC unit 
MAC stands for Multiplication and Accumulation. MAC is extremely used in all kinds of matrix operations, such as convolution for filtering, dot operations, and even polynomial evaluations. Fast Fourier Transform (FFT) and DTFT require a large number of multiplication and addition operations. The performance of the processor depends mainly on the MAC unit. The area occupancy, power consumption, and delay incurred in the MAC unit can influence the system's overall performance. 

![Diagram 1](https://github.com/RukmiChavda/4-bit-MAC-unit/assets/82014536/65c8947b-6a28-4721-b8d1-2b7618b8bb6d)

This project was developed based on 4-bit bus width. (N = 4-bit). Therefore in output  multiplier returns  8-bits (2N = 2(4) = 8-bits) and adder returns 9-bits (2N + 1 = 2(4) + 1 = 9-bits). According to that output MAC needs a 9-bit accumulator. This MAC design uses Wallance tree multiplier as multiplication unit, Carry save adder as adder unit, and for accumulator unit, it uses D flip-flops in PIPO register.

