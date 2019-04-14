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
    @IBOutlet weak var agua: UIImageView!
    @IBOutlet weak var imgNuvemPAzul: UIImageView!
    @IBOutlet weak var imgNuvemPCinza: UIImageView!
    @IBOutlet weak var imgNuvemGCinza: UIImageView!
    @IBOutlet weak var imgNuvemGAzul: UIImageView!
    @IBOutlet weak var imgAguaCano: UIView!
    
    @IBOutlet weak var imgCeuDia: UIImageView!
    
    @IBOutlet weak var imgCeuNoite: UIImageView!
    
    @IBOutlet weak var imgSol: UIImageView!
    
    @IBOutlet weak var imgLua: UIImageView!
    
    var timer: Timer = Timer()
    var timerInterval: TimeInterval = 1.0
    var minutos = 0
    var minutosDia = 0
    var horas = 0
    var horasDia = 0
    var isDia = true
    
    var valoresCA = [Double]()
    var valoresCB = [Double]()
    var valoresCC = [Double]()
    var quant = [Double]()
    
    var novoTipoTaxa = "Minutos"
    var qtdDias = 10
    var tipoTempo = 1440
    var tipoTaxa = Taxa.minutos
    var isSimulating = false
    var k = 20
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        animacoes()
        
        
    }
    
    func animacoes() {
        
        UIView.animate(withDuration: 1, delay: 0.0, options: [.repeat], animations: {
            
            
            self.imgAguaCano.frame.size.width += 117
            
        }, completion: nil)
        
        UIView.animate(withDuration: 2, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            
            
            self.imgNuvemPAzul.frame.origin.x += 20
            self.imgNuvemPCinza.frame.origin.x -= 20
            self.agua.frame.origin.y -= 20
            
        }, completion: nil)
        
        UIView.animate(withDuration: 2, delay: 0.25, options: [.repeat, .autoreverse], animations: {
        
            self.imgNuvemGAzul.frame.origin.x += CGFloat(self.k)
            self.imgNuvemGCinza.frame.origin.x += CGFloat(self.k)
        
        }, completion:  nil)
//        }, completion:{(finished: Bool) in
//
//            if self.isSimulating {
//                self.k = 100
//            } else {
//                self.k = 20
//            }
//
//        })
        
        
        
    }
    
    @IBAction func simular(_ sender: UIButton) {
        
        guard !isSimulating else { return }
        guard txtCompA.text != "", txtQtdDias.text != "", txtTaxa.text != "" else { return }
        imgAguaCano.isHidden = false
        setup()
        qtdDias = Int((txtQtdDias.text! as NSString).intValue)
        calcula(compartimentoA: (txtCompA.text! as NSString).doubleValue, compartimentoB: 0.0, tipoTaxa: tipoTaxa, taxa: (txtTaxa.text! as NSString).doubleValue)
        
        startTimer()
        isSimulating = true
    }
    @IBAction func cancelar(_ sender: UIButton) {
        stop()
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
        
        self.cBView.frame.size.height = 168.0
        self.cBView.frame.origin.y = 294
        self.cAView.frame.size.height = 1.0
        self.cAView.frame.origin.y = 294
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
                timerInterval = 0.05
            case 2:
                timerInterval = 0.001
            default:
                break
        }
    }
    
    @IBAction func segmentTempoTapped(_ sender: UISegmentedControl) {
        
        guard !isSimulating else { return }
        
        print("trocou")
        
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
        
        switch tipoTaxa {
            case .horas:
                trocaDia()
                if horas <= tipoTempo * qtdDias {
                    lblTempo.text = "\(horas) \(novoTipoTaxa)s"
                    lblCA.text = "\(valoresCA[horas])"
                    lblCB.text = "\(valoresCB[horas])"
                    lblValorRecebido.text = "+\(valoresCC[horas])/\(novoTipoTaxa)"
                    lblValorRetirado.text = "-\(valoresCC[horas])/\(novoTipoTaxa)"
                    self.cBView.frame.size.height -= CGFloat(quant[horas])
                    self.cBView.frame.origin.y = 294
                    self.cAView.frame.size.height += CGFloat(quant[horas])
                    self.cAView.frame.origin.y = 294
                    horas += 1
                    horasDia += 1
                }
                else if horas > tipoTempo * qtdDias {
                    stop()
                }
            case .minutos:
                trocaDia()
                if minutos <= tipoTempo * qtdDias {
                    lblTempo.text = "\(minutos) \(novoTipoTaxa)s"
                    lblCA.text = "\(valoresCA[minutos])"
                    lblCB.text = "\(valoresCB[minutos])"
                    lblValorRecebido.text = "+\(valoresCC[minutos])/\(novoTipoTaxa)"
                    lblValorRetirado.text = "-\(valoresCC[minutos])/\(novoTipoTaxa)"
                    self.cBView.frame.size.height -= CGFloat(quant[minutos])
                    self.cBView.frame.origin.y = 294
                    self.cAView.frame.size.height += CGFloat(quant[minutos])
                    self.cAView.frame.origin.y = 294
                    minutos += 1
                    minutosDia += 1
                }
                else if minutos > tipoTempo * qtdDias {
                    stop()
                }
        }
    }
    
    func stop() {
        isSimulating = false
        timer.invalidate()
        minutos = 0
        horas = 0
        imgAguaCano.isHidden = true
    }
    
    func trocaDia() {
        
        switch tipoTaxa {
        case .horas:
            if horasDia <= 12 && 0 <= horasDia {
                isDia = true
            } else if horasDia > 12 && horasDia <= 24 {
                isDia = false
            }
            else if horasDia > 24 {
                horasDia = 0
            }
        case .minutos:
            if minutosDia <= 720 && 0 <= minutosDia {
                isDia = true
            } else if minutosDia > 720 && minutosDia <= 1440 {
                isDia = false
            }
            else if minutosDia > 24 {
                horasDia = 0
            }
        }
        
        if isDia {
            print("É DIA")
        } else {
            print("É NOITE")
        }
    }
}
