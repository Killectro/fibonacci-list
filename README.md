# fibonacci-list
Implements a table view that calculates Fibonacci numbers as you scroll.

This simple application set out to solve the following problem:
```
Calculate and display the Fibonacci number from 1 -> N 
(where N is possible max for unsigned int in an iphone).
Display each Fib(n) in a table view. 
The scrolling MUST be smooth.
```

# Problems
1. Swift's Foundation does not have support for an arbitrarily sized integer such as Java's `BigInteger`, and as such can't natively store values anywhere near the size of even `fib(1000)` let alone `fib(UInt.max)`. An `NSDecimalNumber` object can represent up to 38 digits accurately, which is higher than any other native object but still can only accurately represent up to about `N = 190`.
2. The problem states we need to support up to `fib(UInt.max)` but a UITableView doesn't support an index beyond `Int.max`

# Result
This application solves a simplified version of the above problem. It implements a generic memoization function and uses that function to create a memoized, recursive Fibonacci implementation. Due to the lack of `BigInteger` support in Swift and in lieu of importing a third party library such as [swift-pons](https://github.com/dankogai/swift-pons) the app uses `NSDecimalNumber` to store the Fibonacci results.
