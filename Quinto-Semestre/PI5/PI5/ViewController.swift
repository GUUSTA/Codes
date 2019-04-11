//
//  ViewController.swift
//  PI5
//
//  Created by Gustavo Garcia Leite on 10/04/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

enum Taxa {
    case dia
    case semana
}

class ViewController: UIViewController {

    @IBOutlet weak var lblTempo: UILabel!
    @IBOutlet weak var cAView: UIView!
    @IBOutlet weak var cBView: UIView!
    @IBOutlet weak var lblCA: UILabel!
    @IBOutlet weak var lblCB: UILabel!
    @IBOutlet weak var lblValorRetirado: UILabel!
    
    @IBOutlet weak var lblValorRecebido: UILabel!
    
    var timer: Timer = Timer()
    var timerInterval: TimeInterval = 1.0
    var segundos = 0
    
    var valoresCA = [Double]()
    var valoresCB = [Double]()
    var valoresCC = [Double]()
    var quant = [Double]()
    
    var novoTipoTaxa = "Horas"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calcula(compartimentoA: 1000.0, compartimentoB: 0.0, tipoTaxa: .dia, taxa: 0.1, instanteT: 24)
        startTimer()
    }
    
    func regraDeTres(cA: Double, cC: Double) -> Double {
        var diferenca = (Double(self.cBView.frame.height) * cC)/cA
        return diferenca
    }
    
    func calcula(compartimentoA: Double, compartimentoB: Double, tipoTaxa: Taxa, taxa: Double, instanteT: Int) {
        
        var novaTaxa = taxa
        var cA = compartimentoA
        var cB = compartimentoB
        var cC = 0.0
        
        switch tipoTaxa {
        case .dia:
            novaTaxa = taxa/24.0
            novoTipoTaxa = "Horas"
        case .semana:
            novaTaxa = (taxa/7.0)/24
            novoTipoTaxa = "Dias"
        }
        
        for i in 0...instanteT {
            
            if i == 0 {
                valoresCA.append(cA)
                valoresCB.append(cB)
                valoresCC.append(cC)
                quant.append(0.0)
            } else {
                cC = cA * novaTaxa
                cA = cA - cC
                cB = cB + cC
                valoresCA.append(cA)
                valoresCB.append(cB)
                valoresCC.append(cC)
                quant.append(regraDeTres(cA: compartimentoA, cC: cC))
                //print("\(novoTipoTaxa) \(i) - CA: \(cA) - CB: \(cB) - CC: \(cC)")
            }
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update(){
        if segundos <= 24 {
            
            lblTempo.text = "\(segundos) \(novoTipoTaxa)"
            lblCA.text = "\(valoresCA[segundos])"
            lblCB.text = "\(valoresCB[segundos])"
            lblValorRecebido.text = "+\(valoresCC[segundos])/hora"
            lblValorRetirado.text = "-\(valoresCC[segundos])/hora"
            self.cBView.frame.size.height -= CGFloat(quant[segundos])
            self.cBView.frame.origin.y = 251
            self.cAView.frame.size.height += CGFloat(quant[segundos])
            self.cAView.frame.origin.y = 251
        }
        segundos += 1
    }
}
