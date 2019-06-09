import UIKit
import Darwin


var L = 100.0
let e = 2.718281828459045
let R = 35.0

var n0 = 0.3176
var m0 = 0.0529
var h0 = 0.5961

let A = 180000.0
let C = 1.0
let gK = 3.6
let gNA = 12.0
let gL = 0.03

let vK = -77.0
let vNA = 50.0
let vL = -54.402

let qtdInteracoes = 1.0
let qtdX = 11
var deltaX = 10
var deltaT = 0.001

var V = Array(repeating: Array(repeating: 37.0, count: 11), count: 1001)

let spaceLimit = 1 + (100.0 / 10.0)
let daysToRun = 1 + qtdInteracoes/deltaT

func determinaV(x: Double) -> Double {
    return 10 * pow(e, (-0.2 * x))
}

// ALFAS
func determinaAn(Vij: Double) -> Double {
    return (0.01 * (Vij - 10))/(pow(e, (Vij - 10)/10) - 1)
}

func determinaAm(Vij: Double) -> Double {
    return (0.01 * (Vij - 25))/(pow(e, ((Vij - 25)/10)) - 1)
}

func determinaAh(Vij: Double) -> Double {
    return 0.07 * pow(e, (Vij/20))
}

// BETAS
func determinaBn(Vij: Double) -> Double {
    return 0.125 * (pow(e, (Vij/80)))
}

func determinaBm(Vij: Double) -> Double {
    return 4 * (pow(e, (Vij/18)))
}

func determinaBh(Vij: Double) -> Double {
    return 1/(pow(e, ((Vij-30)/10)) + 1)
}

// DNDT
func determinaDnDt(Vij: Double, prev_n: Double) -> Double {
    return (determinaAn(Vij: Vij)*(1 - prev_n) - determinaBn(Vij: Vij) * prev_n) * deltaT + prev_n
}

//DMDT
func determinaDmDt(Vij: Double, prev_m: Double) -> Double {
    return (determinaAm(Vij: Vij)*(1 - prev_m) - determinaBm(Vij: Vij)*prev_m) * deltaT + prev_m
}

//DHDT
func determinaDhDt(Vij: Double, prev_h: Double) -> Double {
    return (determinaAh(Vij: Vij)*(1 - prev_h) - determinaBh(Vij: Vij)*prev_h) * deltaT + prev_h
}


// valore para  1 linha
for col in 0...V[0].count - 1 {
    let space = deltaX * col
    V[0][col] = 10 * pow(e, (-0.2 * Double(space)))
}



// DEFININDO FRONTEIRAS
for line in 0...V.count - 1 {
    V[line][0] = -65.002
    V[line][10] = 0.0
}


func computeAlphasAndBetas(V_i_j: Double, n: Double, m: Double, h: Double) -> Double {
    let firstPart = gK * pow(n, 4) * (V_i_j - vK)
    let secoundPart = gNA * pow(m, 3) * h * (V_i_j - vNA)
    let thirdPart = gL * (V_i_j - vL)
    return firstPart + secoundPart + thirdPart
}

func computeNextVi(V_prevI_j: Double, V_i_j: Double, V_nextI_j: Double, n: Double, m: Double, h: Double) -> Double {
    let firstPart = (V_prevI_j - 2 * V_i_j + V_nextI_j) / (pow(Double(deltaX), 2))
    let secoundPart = firstPart * A / (2 * R) - computeAlphasAndBetas(V_i_j: V_i_j, n: n, m: m, h: h)
    let thirdPart = secoundPart * (deltaT / C) + V_i_j
    
    //print("a: \(V_prevI_j), b: \(V_i_j), c: \(V_nextI_j)")
    
    //print("1: \(firstPart), 2: \(secoundPart), 3: \(thirdPart)")
    return thirdPart
}

var voltage = 0.0

var n = 0.3176, m = 0.0529, h = 0.5961
//print("line: \(0) - N: \(n0), M: \(m0), H: \(h0)")
for line in 1...V.count - 1 {
    for col in 1...V[0].count - 2 {
        V[line][col] = computeNextVi(V_prevI_j: V[line - 1][col - 1], V_i_j: V[line - 1][col], V_nextI_j: V[line - 1][col + 1], n: n, m: m, h: h)
        voltage = V[line][col]
        
    }
    n = determinaDnDt(Vij: voltage, prev_n: n)
    m = determinaDmDt(Vij: voltage, prev_m: m)
    h = determinaDhDt(Vij: voltage, prev_h: h)
    
    //print("line: \(line) - Voltage: \(voltage) - N: \(n), M: \(m), H: \(h)")
    
}

//print(V[2\])

//for line in 0...V.count - 1 {
//    for col in 0...V[0].count - 1 {
//        print("\(line);\(col);\(V[line][col])")
//    }
//}

for i in 0...50{
    print("\(i);", terminator:"")
}

