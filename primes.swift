/*
Written by Matthew Crepeau
12/7/2015
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
for var i = 1; i < n; i+=2 {    // For the second refinement, start with odd numbers only
        primes.append(i)        // Step 1 (see readme for steps)
}

var j = 0
var p = 1       // Step 2

while p*p < n { // p*p is part of the first refinement
        j = 0
        while p+j < n && (primes[(p + j)/2] <= p || primes[(p + j)/2] == 0) {   // Step 4
                j += 2;
        }
        p = p + j
        for var i = p; p*i < n; i+=2 {  // Step 3 (set i = p for the first refinement, increment by 2p for second refinement)
                primes[(p*i)/2] = 0     // Mark non-primes as 0
        }
}

print("2")      // manually print the only even prime
// Print the non-marked numbers
for var i = 3; i < n; i+=2 {
        if primes[(i/2)] != 0 {
                print("\(primes[(i/2)])")
        }
}
