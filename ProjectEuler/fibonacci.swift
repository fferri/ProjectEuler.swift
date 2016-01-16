import Foundation

func fibonacci() -> AnyGenerator<Int> {
    var a = 0
    var b = 1
    return anyGenerator{
        let r = a + b
        a = b
        b = r
        return r
    }
}