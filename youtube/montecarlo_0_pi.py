#ritvikamath: https://www.youtube.com/watch?v=EaR3C4e600k

import numpy as np 
import random

N = int(1e6)
in_circ = 0
P = np.pi / 4 #area_circ / area_cuadr

for _ in range(N): 
    x = random.uniform(-1,1)
    y = random.uniform(-1,1) #van a caer en el cuadrado de 2x2
    if x**2 + y**2 <= 1: 
        in_circ += 1
        
P_aprox = in_circ/N

print('P =       ', P)
print('P_aprox = ', P_aprox)