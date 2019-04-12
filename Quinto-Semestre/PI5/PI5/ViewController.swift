//
//  ViewController.swift
//  PI5
//
//  Created by Gustavo Garcia Leite on 10/04/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

enum Taxa {
    case minutos
    case horas
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblTaxa: UILabel!
    @IBOutlet weak var txtCompA: UITextField!
    @IBOutlet weak var txtQtdDias: UITextField!
    @IBOutlet weak var txtTaxa: UITextField!
    @IBOutlet weak var segControlTempo: UISegmentedControl!
    @IBOutlet weak var segControlVelocidade: UISegmentedControl!
    @IBOutlet weak var lblTempo: UILabel!
    @IBOutlet weak var cAView: UIView!
    @IBOutlet weak var cBView: UIView!
    @IBOutlet weak var lblCA: UILabel!
    @IBOutlet weak var lblCB: UILabel!
    @IBOutlet weak var lblValorRetirado: UILabel!
    @IBOutlet weak var lblValorRecebido: UILabel!
    
    var timer: Timer = Timer()
    var timerInterval: TimeInterval = 1.0
    var minutos = 0
    
    var valoresCA = [Double]()
    var valoresCB = [Double]()
    var valoresCC = [Double]()
    var quant = [Double]()
    
    var novoTipoTaxa = "Minutos"
    var qtdDias = 10
    var tipoTempo = 1440
    var tipoTaxa = Taxa.minutos
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func simular(_ sender: UIButton) {
        setup()
        qtdDias = Int((txtQtdDias.text! as NSString).intValue)
        calcula(compartimentoA: (txtCompA.text! as NSString).doubleValue, compartimentoB: 0.0, tipoTaxa: tipoTaxa, taxa: (txtTaxa.text! as NSString).doubleValue)
        
        startTimer()
    }
    @IBAction func cancelar(_ sender: UIButton) {
        timer.invalidate()
        minutos = 0
    }
    
    func calcula(compartimentoA: Double, compartimentoB: Double, tipoTaxa: Taxa, taxa: Double) {
        
        var cA = compartimentoA
        var cB = compartimentoB
        var cC = 0.0
        var novaTaxa = 0.0
        
        switch tipoTaxa {
        case .minutos:
            tipoTempo = 1440
            novaTaxa = taxa/Double(tipoTempo)
            novoTipoTaxa = "Minuto"
        case .horas:
            tipoTempo = 24
            novaTaxa = taxa/Double(tipoTempo)
            novoTipoTaxa = "Hora"
        }
        
        for i in 0...tipoTempo * qtdDias {
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
            }
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    func setup() {
        
        self.cBView.frame.size.height = 230.0
        self.cBView.frame.origin.y = 251
        self.cAView.frame.size.height = 1.0
        self.cAView.frame.origin.y = 251
        valoresCA.removeAll()
        valoresCB.removeAll()
        valoresCC.removeAll()
        quant.removeAll()
    }
    
    func regraDeTres(cA: Double, cC: Double) -> Double {
        let diferenca = (Double(self.cBView.frame.height) * cC)/cA
        return diferenca
    }
    
    
    @IBAction func segmentVelocidadeTapped(_ sender: UISegmentedControl) {
        let index = segControlVelocidade.selectedSegmentIndex
        switch index {
            case 0:
                timerInterval = 1
            case 1:
                timerInterval = 0.0050
            case 2:
                timerInterval = 0.0025
            default:
                break
        }
    }
    
    @IBAction func segmentTempoTapped(_ sender: UISegmentedControl) {
        
        let index = segControlTempo.selectedSegmentIndex
        switch index {
        case 0:
            tipoTaxa = .minutos
        case 1:
            tipoTaxa = .horas
        default:
            break
        }
        
    }
    
    @objc func update(){
        if minutos <= tipoTempo * qtdDias {
            lblTempo.text = "\(minutos) \(novoTipoTaxa)s"
            lblCA.text = "\(valoresCA[minutos])"
            lblCB.text = "\(valoresCB[minutos])"
            lblValorRecebido.text = "+\(valoresCC[minutos])/\(novoTipoTaxa)"
            lblValorRetirado.text = "-\(valoresCC[minutos])/\(novoTipoTaxa)"
            self.cBView.frame.size.height -= CGFloat(quant[minutos])
            self.cBView.frame.origin.y = 251
            self.cAView.frame.size.height += CGFloat(quant[minutos])
            self.cAView.frame.origin.y = 251
            minutos += 1
        }
        else if minutos > tipoTempo * qtdDias {
            timer.invalidate()
            minutos = 0
        }
    }
}
