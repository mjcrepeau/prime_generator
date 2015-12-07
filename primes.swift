/*
Written by Matthew Crepeau
12/3/2015
Calculates the prime numbers between 2 and n
*/
import Darwin   // Needed to call exit()

var n = 0

if Process.arguments.count != 2 {
        print("A simple prime number generator!")
        print("Usage: primes [n]")
        print("Generates the prime numbers between 2 and n")
        exit(0)
} else {
        n = Int(Process.arguments[1])!
}

var primes: [Int] = []          // Array to hold the primes
for var i = 0; i < n; i++ {
        primes.append(i)        // Step 1 (see readme for steps)
}

var j = 0
var p = 1       // Step 2

while p*p < n { // p*p is part of the first refinement
        j = 0
        while p+j < n && (primes[p + j] <= p || primes[p + j] == 0) {   // Step 4
                j++
        }
        p = p + j
        for var i = p; p*i < n; i++ {   // Step 3 (set i = p for the first refinement)
                primes[p*i] = 0         // Mark non-primes as 0
        }
}

// Print the non-marked numbers
for var i = 2; i < n; i++ {
        if primes[i] != 0 {
                print("\(primes[i])")
        }
}
