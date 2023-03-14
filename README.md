# mips_recursive
## fib_recur:
Complete fib_recur function, which recursively calculates the N-th Fibonacci number from a given positive integer input n. This is the high-level description of the recursive Fibonacci.

```python
	           def fib_recur(n):
                   	if n <= 1:
                        	return n;
                   	else:
                        	 return fib_recur(n-1)+fib_recur(n-2);
```
>> a0: the argument for the given positive integer input, n

## catalan_recur:
Complete catalan_recur function, which recursively calculates the N-th Catalan numberLinks to an external site. from a given positive integer input n. Catalan number sequence occurs in various counting problemsLinks to an external site.. The sequence can be recursively defined by the following equation.

<img width="520" alt="截屏2023-03-14 04 02 10" src="https://user-images.githubusercontent.com/71242774/224981776-a0a10eeb-62e6-4905-a37e-f29550fa4969.png">

 And this is the high-level description of the recursive Catalan:
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
