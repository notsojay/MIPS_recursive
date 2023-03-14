# mips_recursive
1. Complete fib_recur function, which recursively calculates the N-th Fibonacci number from a given positive integer input n. This is the high-level description of the recursive Fibonacci.

```python
	           def fib_recur(n):
                   	if n <= 1:
                        	return n;
                   	else:
                        	 return fib_recur(n-1)+fib_recur(n-2);
```

>> a0: the argument for the given positive integer input, n

2. Complete catalan_recur function, which recursively calculates the N-th Catalan numberLinks to an external site. from a given positive integer input n. Catalan number sequence occurs in various counting problemsLinks to an external site.. The sequence can be recursively defined by the following equation.

{\displaystyle C_{0}=1\quad {\text{and}}\quad C_{n+1}=\sum _{i=0}^{n}C_{i}C_{n-i}\quad {\text{for }}n\geq 0}

 And this is the high-level description of the recursive Catalan.
 
```python
	          def catalan_recur(n):
                  	if n <= 1:
                      		return 1;
                 	else:
                      		res = 0
                  	for i in range(n):  # i = 0 ~ (n-1)
                      		res += catalan_recur(i) * catalan_recur(n-i-1)
                      		return res;
```

>> a0: the argument for the given positive integer input, n
