import UIKit
import Darwin

var a = 15
var b = 25
var p1 = (2 * a) + b
var p2 = (2 * a) + (3 * b)

let capacidadeProd = 400

let funcProd = 5.0
let funcAdm = 2.0
let funcServicosGerais = 2.0
let funcDiretor = 1.0

let aluguel = 3500.0
let energia = 900.0
let agua = 600.0

let salarioProd = 3500.0
let salarioAdm = 4000.0
let salarioServG = 2000.0
let salarioDiretor = 6000.0

let precoProduto = 70.0

func getCustos(p: Double) -> Double {
    let w = aluguel + energia
    let x = agua + salarioProd * funcProd + p
    let y = salarioAdm * funcAdm + salarioServG * funcServicosGerais + salarioDiretor * funcDiretor
    return Double(w + x + y)
}

func getCustosP(p: Int, unidades: Int) -> Double {
    return Double(p * unidades)
}

func fazOrcamentoB(taxa: Double, mes: Int, p: Int) {
    unidadesB = Int(taxa * Double(unidadesB))
    if unidadesB > 400 {
        unidadesB = 400
    }
    if mes == 1 {
        unidadesB = 300
    }
    vendasB = Double(unidadesB) * precoProduto
    custosB = getCustos(p: getCustosP(p: p, unidades: unidadesB))
    orcamentoB = vendasB - custosB
    print("Mes: \(mes) | Unidades: \(unidadesB) | Vendas: R$\(vendasB) | Custos: R$\(custosB) | Orçamento: R$\(orcamentoB)")
}

func fazOrcamentoA(mes: Int, p: Int) {
    if mes == 1 {
        unidadesA = 250
    } else if mes == 2 {
        unidadesA = 275
    } else {
        unidadesA = 320
    }
    
    vendasA = Double(unidadesA) * precoProduto
    custosA = getCustos(p: getCustosP(p: p, unidades: unidadesA))
    orcamentoA = vendasA - custosA
    print("Mes: \(mes) | Unidades: \(unidadesA) | Vendas: R$\(vendasA) | Custos: R$\(custosA) | Orçamento: R$\(orcamentoA)")
}

func questaoA(p: Int) {
    print("")
    print("QUESTAO A COM P: \(p)")
    print("")
    for i in 1...12 {
        fazOrcamentoA(mes: i, p: p)
    }
}

func questaoB(p: Int) {
    print("")
    print("QUESTAO B COM P: \(p)")
    print("")
    for i in 1...12 {
        let numeroAleatorio = Int.random(in: 1...100)
        if numeroAleatorio < 50 {
            fazOrcamentoB(taxa: 1.1, mes: i, p: p)
        } else {
            fazOrcamentoB(taxa: 0.9, mes: i, p: p)
        }
    }
}

// Questao A
var unidadesA = 250
var orcamentoA = 0.0
var vendasA = 0.0
var custosA = 0.0

questaoA(p: p1)

// Questao B
var unidadesB  = 300
var orcamentoB: Double = 0.0
var vendasB = 0.0
var custosB = 0.0

questaoB(p: p1)


