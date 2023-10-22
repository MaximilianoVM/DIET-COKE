import numpy as np 
import random as rand
import statistics as stats

#if i play a game with P(win)=p. 
#For each round game ends when i 
#lose 2 times in a row
#What's the expected # of rounds i can play? 

#ANALITIC SOLUTION: 
#let e = E(R)
# e = (1+e)p + 2(1-p)(1-p) + (2+e)(1-p)p
# then e = (2-p)/(1-p)^2

def e_Real(p):
    e = (2-p) / ( (1-p)**2 )
    return e

#NUMERICAL SOLUTION

def e_Monte_Carlo(n, p=1/2):
    Rounds = [] 
    for _ in range(int(n)): 
        r=0 
        n_loss=0
        while n_loss != 2: 
            r+=1
            if rand.uniform(0,1) < p:
                n_loss = 0
            else: 
                n_loss += 1
        Rounds.append(r)
    return(stats.mean(Rounds))


#a ver 
print('Real:        ', e_Real(1/2))
print('MonteCarlo:  ', e_Monte_Carlo(1e6, 1/2))