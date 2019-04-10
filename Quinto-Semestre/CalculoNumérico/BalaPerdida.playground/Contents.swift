import UIKit
import Foundation

/*
Entradas:

M = 0,0254 kg (25.4 g)

C = 0,5

Densidade do ar = 1,2928 kg/m³.

A = 7,62x51mm = 0,00038862 m2

g = 9.80665m/s².

E = (1/2 * m * v2) + (mgh) Quando ela bate no chão, quanto é a energia

v = m/s

Formula = dv/dt = -1/2m*c*a*v2 - g
 
*/

let m = 0.0254
let c = 0.5
let densAr = 1.2928
let a = 0.00038862
let g = 9.8
let v0 = 759.1667
var v = v0
let h = 0.1

func instant(speed: Double) -> Double {
    return (1/(2 * m) * -1) * c * densAr * a * (speed * speed) - g
}

func calcDv(i: Int) {
    for _ in 0...i {
        print(v)
        v = v + instant(speed: v) * h
        
    }
}

calcDv(i: 65)



