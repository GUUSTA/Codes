import UIKit

func defineLinhaZero(x: Int) -> Double{
    
    return Double(x * (x-1))
    
}

let deltaX = 10
let deltaT = 1

var x: Int = 0
var z = 10
var t = 0
var alfa = 0.1

var T = [[Double]]()
//T.append([])
//T[x].append(Double(70 * x + 50))
var i = 0
while i < 100{
    var novoArray = [Double]()
    novoArray.append(defineLinhaZero(x: i))
    T.append(novoArray)
    i += 10
}
T.append([0.0])

T[x].append(Double(70 * x + 50))



print(T)

x = 1

while t <= 10 {
    while x <= 10 {
        let simple = T[x-1][t] - (2 * T[x][t] + T[x+1][t])
        T[x].append(T[x][t] + alfa * simple)
        x += 1
        z += 10
    }
    t += 1
}

print(T)
