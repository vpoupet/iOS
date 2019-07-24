//: Playground - noun: a place where people can play

let a = 10
var b: Int = 12

b += a

let primes = [2, 3, 5, 7, 11, 13]


func isPrime(_ n: Int) -> Bool {
    for x in 2 ..< n {
        if n % x == 0 {
            return false
        }
    }
    return true
}

var x: Int
x = 13
if isPrime(x) {
    print("\(x) is a prime number.")
} else {
    print("\(x) is not a prime number.")
}

let t: [Int] = [1, 2, 3, 4]
let s: String = "hello"
let pi: Float = 3.1415926
