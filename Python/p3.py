# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

#  math libs:
from math import ceil, sqrt

#  Time code:
import time
start_time = time.clock()

#  Function to check whether a number is prime (simple exhaustive search)
def is_prime(x):
	#  largest number to check for divisibility 
	max_int = int(ceil(sqrt(x))) + 1
	
	#  Search for a factor, stop early if one is found
	search_range = [2] + range(3, max_int, 2)
	rval = True
	if(x != 2 and x != 3):
		for i in search_range:
			if x % i == 0:
				rval = False
				break
	#  return bool
	return rval


#  Find largest prime factor. Method:
#   1. Seach for a factor (descending)
#   2. Once a factor is found, check if prime. If not, continue search for next factor
def find_factor(y):
	max_int = int(ceil(sqrt(y)))
	
	#  if y is odd, only search odd numbers
	if(y % 2 != 0):
		search_range = [2] + range(3, max_int, 2)
	else:
		search_range = range(2, max_int)
	
	#  Search
	rval = 0
	for k in reversed(search_range):
		if y % k == 0:
			if is_prime(k):
				rval = k
				break
	return rval

print find_factor(600851475143)

end_time = time.clock()
print("Elapsed time was:  %g seconds" % (end_time - start_time))
	
# for j in range(1, 10):
	# print '\nis %d prime?\t' % j, is_prime(j)
		