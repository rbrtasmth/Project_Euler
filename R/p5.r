# 2520 is the smallest number that can be divided by each of the numbers
# from 1 to 10 without any remainder.

# What is the smallest positive number that
# is evenly divisible by all of the numbers from 1 to 20?

#  The prime factorization for all numbers less than 20:
# 20 = 5*2^2
# 19 = 19
# 18 = 2*3^2
# 17 = 17
# 16 = 2^4
# 15 = 3*5
# 14 = 2*7
# 13 = 13
# 12 = 3*2^2
# 11 = 11
# 10 = 2*5
# 9 = 3^2
# 8 = 2^3
# 7 = 7
# 6 = 2*3
# 5 = 5
# 4 = 2^2
# 3 = 3
# 2 = 2

#  Thus we just need to check numbers less than:
n <- prod(11:20)
#  Which are divisible by the prime factors less than 20:
prim_fac <- 2*3*5*7*11*13*17*19
#  which gives potential candidate numbers of:
all_facs <- seq(0, n, prim_fac)[-1]

#  Find min which is divisible by the non prime numbers:
min(all_facs[(all_facs %% 12) == 0 &
  (all_facs %% 14) == 0 &
  (all_facs %% 15) == 0 &
  (all_facs %% 16) == 0 &
  (all_facs %% 18) == 0 &
  (all_facs %% 20) == 0])
