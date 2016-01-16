import Foundation

let solutions: [UInt: () -> Int] =
[    
    1: {
        var sum = 0
        for i in 1..<1000 {
            if i % 3 == 0 || i % 5 == 0 {sum += i}
        }
        return sum
    },
    
    2: {
        var sum = 0
        for n in fibonacci() {
            if n > 4_000_000 {break}
            if n.isEven {sum += n}
        }
        return sum
    },
    
    3: {
        return 600851475143.primeFactors.sort{a, b in a > b}[0]
    },
    
    4: {
        var max = 0
        for a in 1...900 {
            for b in 1...900 {
                let (a1, b1) = (1000 - a, 1000 - b)
                if max / a1 > b1 {break}
                let p = a1 * b1
                if p.isPalindrome && p > max {
                    max = p
                }
            }
        }
        return max
    },
    
    5: {
        return lcm(Array(1...20))
    },
    
    6: {
        let v = Array(1...100)
        let sq: Int -> Int = {x in x * x}
        return sq(v.reduce(0, combine: +)) - v.map(sq).reduce(0, combine: +)
    }
]


// print solutions
var n = solutions.count
var i: UInt = 0
while n > 0 {
    if let f = solutions[i] {
        print("problem \(i): \(f())")
        n -= 1
    }
    i += 1
}