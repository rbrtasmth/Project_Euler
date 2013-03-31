# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

#  The largest factor must be less than:
max_factor <- as.integer(ceiling(sqrt(600851475143)))
#  Since 600851475143 isn't even, only check odd numbers:
potential_factors <- seq(max_factor, 1, by = -2)


#  Which of potential_factors are prime?
is_prime <- function(x){
	max_check <- as.integer(ceiling(sqrt(x)))
	if(x > 4){
		to_check <- c(2, seq(3, max_check, by = 2))
	} else {
		to_check <- c(2)
	}
	
	rval <- all(x %% to_check != 0)
	return(rval)
}
system.time(prime_factors <- sapply(potential_factors, is_prime))
factors <- potential_factors[prime_factors]


#  initialize search of prime factors
n_search <- length(factors)
largest_factor <- NA
found_largest <- FALSE
n <- 1
while(found_largest == FALSE){
	if(as.numeric(600851475143.0) %% factors[n] == 0){
		largest_factor <- factors[n]
		found_largest <- TRUE
	} else {
		n <- n + 1
	}
}
largest_factor