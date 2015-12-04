/*
Written by Matthew Crepeau
12/3/2015
Calculates the prime numbers between 2 and n

Compile with: xcrun -sdk macosx swiftc -g primes.swift

Applies the following algorithm for the Sieve of Eratosthenes:
1. Create a list of consecutive integers from 2 through n: (2, 3, 4, ..., n).
2. Initially, let p equal 2, the first prime number.
3. Starting from p, enumerate its multiples by counting to n in increments of p,
        and mark them in the list (these will be 2p, 3p, 4p, etc.;
        the p itself should not be marked).
4. Find the first number greater than p in the list that is not marked.
        If there was no such number, stop.
        Otherwise, let p now equal this new number (which is the next prime), and repeat from step 3.

TODO:
1. As a refinement, it is sufficient to mark the numbers in step 3 starting from p2,
        as all the smaller multiples of p will have already been marked at that point.
        This means that the algorithm is allowed to terminate in step 4 when p2 is greater than n.
2. Another refinement is to initially list odd numbers only, (3, 5, ..., n),
        and count in increments of 2p in step 3, thus marking only odd multiples of p.
        This actually appears in the original algorithm.
*/
import Darwin   // Needed to call exit()

var number = 0

if Process.arguments.count != 2 {
        print("A simple prime number generator!")
        print("Usage: primes [n]")
        print("Generates the prime numbers between 2 and n")
        exit(0)
} else {
        number = Int(Process.arguments[1])!
}

let n = number
var primes: [Int] = []          // Array to hold the primes
for var i = 0; i < n; i++ {
        primes.append(i)        // Step 1
}

var j = 0
var p = 1       // Step 2

while p < n {
        j = 0
        while p+j < n && (primes[p + j] <= p || primes[p + j] == 0) {   // Step 4
                j++
        }
        p = p + j
        for var i = 2; p*i < n; i++ {   // Step 3
                primes[p*i] = 0         // Mark non-primes as 0
        }
}

// Print the non-marked numbers
for var i = 2; i < n; i++ {
        if primes[i] != 0 {
                print("\(primes[i])")
        }
}

print("Fin")
