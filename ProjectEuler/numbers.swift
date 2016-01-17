import Foundation

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
    
    var isPrime: Bool {
        return UInt(self).isPrime
    }
    
    var primeFactors: [Int] {
        return UInt(self).primeFactors.map{Int($0)}
    }
    
    var digits: [Int] {
        return UInt(self).digits.map{Int($0)}
    }
    
    static func fromDigits(digits: [Int]) -> Int {
        return Int(UInt.fromDigits(digits.map{UInt($0)}))
    }
    
    var isPalindrome: Bool {
        return self.digits == self.digits.reverse()
    }
}

extension UInt {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
    
    var isPrime: Bool {
        if self < 2 {return false}
        if self % 2 == 0 {return self == 2}
        if self % 3 == 0 {return self == 3}
        let root = UInt(sqrt(Double(self)))
        for i in 2...root {
            if self % i == 0 {return false}
        }
        return true
    }
    
    var primeFactors: [UInt] {
        if self < 1 {return []}
        if self < 4 {return [self]}
        let root = UInt(sqrt(Double(self)))
        for i in 2...root {
            let j = self % i
            if j == 0 {
                return i.primeFactors + (self / i).primeFactors
            }
        }
        return [self]
    }
    
    var digits: [UInt] {
        if self < 10 {return [self]}
        return (self / 10).digits + [self % 10]
    }
    
    static func fromDigits(digits: [UInt]) -> UInt {
        var r: UInt = 0
        var m: UInt = 1
        for g in 0..<digits.count {
            r += digits[digits.count - g - 1] * m
            m *= 10
        }
        return r
    }
    
    var isPalindrome: Bool {
        return self.digits == self.digits.reverse()
    }
}

func gcd(u: Int, _ v: Int) -> Int {
    // simple cases (termination)
    if u == v {return u}
    
    if u == 0 {return v}
    
    if v == 0 {return u}
    
    // look for factors of 2
    if u.isEven {
        if v.isOdd {
            return gcd(u >> 1, v)
        } else {
            // both u and v are even
            return gcd(u >> 1, v >> 1) << 1
        }
    }
    
    if v.isEven {
        // u is odd, v is even
        return gcd(u, v >> 1)
    }
    
    // reduce larger argument
    if u > v {
        return gcd((u - v) >> 1, v)
    }
    
    return gcd((v - u) >> 1, u)
}

func gcd(v: [Int]) -> Int {
    return v.reduce(v[0], combine: gcd)
}

func lcm(u: Int, v: Int) -> Int {
    return u * v / gcd(u, v)
}

func lcm(v: [Int]) -> Int {
    return v.reduce(v[0], combine: lcm)
}
