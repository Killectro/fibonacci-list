//
//  Globals.swift
//  FibonacciList
//
//  Created by DJ Mitchell on 8/6/16.
//  Copyright © 2016 Killectro. All rights reserved.
//

import Foundation

/**
 * Takes a generic function and returns a memoized version of that function that saves previously computed results.
 *
 * NOTE: This generic implementation is restricted to functions that take one value as a parameter. Wrap your parameters in a struct that conforms to `Hashable` if you wish to pass an arbitrary number of arguments.
 */
func memoize<Key: Hashable, Value>(body: ((Key -> Value), Key) -> Value) -> (Key -> Value) {
    var cache = [Key:Value]()
    var result: (Key -> Value)!

    result = { x in
        if let existing = cache[x] { return existing }

        let new = body(result, x)
        cache[x] = new
        return new
    }

    return result
}
