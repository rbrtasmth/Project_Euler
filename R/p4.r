# A palindromic number reads the same both ways.
# The largest palindrome made from the product
# of two 2-digit numbers is 9009 = 91 99.

# Find the largest palindrome made from the product
# of two 3-digit numbers.
library(stringr)

#  brute force function!
is_palindrome1 <- function(char){
	if(nchar(char) == 6){
		part1 <- str_sub(char, 1, 3)
		part2 <- str_sub(char, 4, 6)
		part2_reverse <- paste0(
			str_sub(part2, 3, 3),
			str_sub(part2, 2, 2),
			str_sub(part2, 1, 1)
		)
	} else {
		part1 <- str_sub(char, 1, 2)
		part2 <- str_sub(char, 4, 5)
		part2_reverse <- paste0(
			str_sub(part2, 3, 3),
			str_sub(part2, 2, 2),
			str_sub(part2, 1, 1)
		)
	}
	rval <- part1 == part2_reverse
	return(rval)
}

#  Try rev function...
is_palindrome2 <- function(char){
	char == paste(rev(strsplit(char, "")[[1]]), collapse = "")
}

#  Create a cartesian product of all 3-digits products
df1 <- data.frame(opts1 = rep(seq(100, 999, 1), 900),
                 opts2 = sort(rep(seq(100, 999, 1), 900)))
df2 <- unique(data.frame(products = df1$opts1 * df1$opts2))
df2$num_char <- as.character(df2$products)
system.time(df2$palindrome1 <- sapply(df2$num_char, is_palindrome1))
system.time(df2$palindrome2 <- sapply(df2$num_char, is_palindrome2)) #winner by almost a factor of 10x!
all(df2$palindrome1 == df2$palindrome2)

#  look at palindromes:
head(df2[df2$palindrome2,], 10)

#  largest:
palindrome_df <- df2[df2$palindrome2,]
palindrome_df[palindrome_df$palindrome2 & palindrome_df$products == max(palindrome_df$products),]

