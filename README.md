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
1. Swift's Foundation does not have support for an arbitrarily sized integer such as Java's `BigInteger`, and as such can't natively store values anywhere near the size of even `fib(1000)` let alone `fib(UInt.max)`. An `NSDecimalNumber` object can represent up to 38 digits accurately, which is higher than any other native object but still can only accurately represent up to about `n = 190`.
2. The problem states we need to support up to `fib(UInt.max)` but a UITableView doesn't support an index beyond `Int.max`

# Result
This application solves a simplified version of the above problem. It implements a generic memoization function and uses that function to create a memoized, recursive Fibonacci implementation. Due to the lack of `BigInteger` support in Swift and in lieu of importing a third party library such as [swift-pons](https://github.com/dankogai/swift-pons) the app uses `NSDecimalNumber` to store the Fibonacci results.

# Improvements
 There are a few improvements to the app that could be made to more closely match the exact spec as well as improve performance at extremely high `n` values, but that I thought were out of the scope of a small assignment such as this.
 1. Use [swift-pons](https://github.com/dankogai/swift-pons) or something similar to account for huge Fibonacci values.
 2. Use a sliding range of fibonacci results rather than a typical list. This range would shift as the user scrolls and discard results that are more than a certain distance away from the user's current scroll position. This would ensure that the app's memory footprint would never grow so large that the OS will kill it, and it would grant us the ability to support displaying `fib(UInt.max)` since our table view's indices would no longer be tightly coupled with the `n` value we are calculating. This is a highly unusual and fairly complex implementation of a table view and as such I thought it would be out of the scope of this assignment, but I also thought it worth pointing out here.

# Installation Instructions
Run the following commands to download the repository and open the project in Xcode.
```
git clone git@github.com:Killectro/fibonacci-list.git
cd fibonacci-list
open FibonacciList/FibonacciList.xcodeproj
```
