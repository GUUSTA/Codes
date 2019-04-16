//
//  ViewController.swift
//  PI5
//
//  Created by Gustavo Garcia Leite on 10/04/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//
import Foundation
import UIKit

//enum Taxa {
//    case minutos
//    case horas
//}

class ViewController: UIViewController {

    @IBOutlet weak var lblTaxa: UILabel!
    @IBOutlet weak var txtCompA: UITextField!
    @IBOutlet weak var txtQtdDias: UITextField!
    @IBOutlet weak var txtTaxa: UITextField!
    @IBOutlet weak var btnSimular: UIButton!
    //    @IBOutlet weak var segControlTempo: UISegmentedControl!
//    @IBOutlet weak var segControlVelocidade: UISegmentedControl!
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
    
//    var timer: Timer = Timer()
//    var timerInterval: TimeInterval = 1.0
//    var minutos = 0
//    var minutosM = 0
//    var horasM = 0
//    var diasM = 0
//    var horas = 0
//    var horasH = 0
//    var diasH = 0
//    var isAnimating = false
    
    var valoresCA = [Double]()
    var valoresCB = [Double]()
    var valoresCC = [Double]()
    var quant = [Double]()
    
//    var novoTipoTaxa = "Minutos"
    var cA = 0.0
    var cB = 0.0
    var cC = 0.0
    var qtdDias = 10
//    var tipoTempo = 1440
//    var tipoTaxa = Taxa.minutos
    var isSimulating = false
    var k = 20
    let e = 2.718281828459045235360287
    
    var duracao = 0
    var diferenca = 0.0
//    var velocidade = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animacoes()
        btnSimular.layer.cornerRadius = 5
        
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
        setup()
        //fazDuracao()
        //print(duracao)
        qtdDias = Int((txtQtdDias.text! as NSString).intValue)
        calcula(compartimentoA: (txtCompA.text! as NSString).doubleValue, compartimentoB: 0.0, taxa: (txtTaxa.text! as NSString).doubleValue, qtdDias: qtdDias)
        
        //startTimer()
        animaCompartimentos()
        imgAguaCano.isHidden = false
        isSimulating = true
    }
//    @IBAction func cancelar(_ sender: UIButton) {
//        stop()
//    }
    
    func regraDeTres(cA: Double, cC: Double) -> Double {
        let diferenca = (Double(self.cBView.frame.height) * cC)/cA
        return diferenca
    }
    
    func calcula(compartimentoA: Double, compartimentoB: Double, taxa: Double, qtdDias: Int) {
        
        cA = compartimentoA
        cB = compartimentoB
        cC = 0.0
        let novaTaxa = (taxa * Double(qtdDias)) * -1
        
        
//        switch tipoTaxa {
//        case .minutos:
//            tipoTempo = 1440
//            novaTaxa = taxa/Double(tipoTempo)
//            novoTipoTaxa = "Minuto"
//        case .horas:
//            tipoTempo = 24
//            novaTaxa = taxa/Double(tipoTempo)
//            novoTipoTaxa = "Hora"
//        }
        
        cC = cA
        cA = cA * pow(e, novaTaxa)
        cB = cC - cA
    
        diferenca = regraDeTres(cA: cC, cC: cB)
        
//        for i in 0...tipoTempo * qtdDias {
//            if i == 0 {
//                valoresCA.append(cA)
//                valoresCB.append(cB)
//                valoresCC.append(cC)
//                quant.append(0.0)
//            } else {
//                cC = cA * novaTaxa
//                cA = cA - cC
//                cB = cB + cC
//                valoresCA.append(cA)
//                valoresCB.append(cB)
//                valoresCC.append(cC)
//                quant.append(regraDeTres(cA: compartimentoA, cC: cC))
//            }
//        }
    }
    
//    func startTimer() {
//        timer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(update), userInfo: nil, repeats: true)
//    }
    
    func animaCompartimentos() {
        
        UIView.animate(withDuration: 3, animations: {
            
            self.cAView.frame.size.height = self.cAView.frame.height + CGFloat(self.diferenca)
            self.cBView.frame.size.height = self.cBView.frame.height - CGFloat(self.diferenca)
            
        }, completion: { (finish: Bool) in
            
            self.isSimulating = false
            self.imgAguaCano.isHidden = true
            
        } )
        
        lblCA.text = "\(cA)"
        lblCB.text = "\(cB)"
    }
    
    func setup() {
        self.isSimulating = true
        //self.isAnimating = false
        self.cBView.frame.size.height = 168.0
        self.cBView.frame.origin.y = 294
        self.cAView.frame.size.height = 1.0
        self.cAView.frame.origin.y = 294
        self.cA = 0
        self.cB = 0
        self.cC = 0
//        self.imgCeuNoite.alpha = 1
//        self.imgLua.alpha = 1
//        valoresCA.removeAll()
//        valoresCB.removeAll()
//        valoresCC.removeAll()
//        quant.removeAll()
    }
    
//    @objc func update(){
//
//
//
//
//        switch tipoTaxa {
//        case .minutos:
//            trocaDia()
//            if minutos <= tipoTempo * qtdDias {
//                lblTempo.text = "\(diasM) dias \(horasM) horas \(minutosM) minutos"
//                lblCA.text = "\(valoresCA[minutos])"
//                lblCB.text = "\(valoresCB[minutos])"
//                lblValorRecebido.text = "+\(valoresCC[minutos])/\(novoTipoTaxa)"
//                lblValorRetirado.text = "-\(valoresCC[minutos])/\(novoTipoTaxa)"
//                self.cBView.frame.size.height -= CGFloat(quant[minutos])
//                self.cBView.frame.origin.y = 294
//                self.cAView.frame.size.height += CGFloat(quant[minutos])
//                self.cAView.frame.origin.y = 294
//                minutosM += 1
//                minutos += 1
//            } else if minutos > tipoTempo * qtdDias  {
//                stop()
//            }
//        case .horas:
//            trocaDia()
//            if horas <= tipoTempo * qtdDias {
//                lblTempo.text = "\(diasH) dias \(horasH) horas"
//                lblCA.text = "\(valoresCA[horas])"
//                lblCB.text = "\(valoresCB[horas])"
//                lblValorRecebido.text = "+\(valoresCC[horas])/\(novoTipoTaxa)"
//                lblValorRetirado.text = "-\(valoresCC[horas])/\(novoTipoTaxa)"
//                self.cBView.frame.size.height -= CGFloat(quant[horas])
//                self.cBView.frame.origin.y = 294
//                self.cAView.frame.size.height += CGFloat(quant[horas])
//                self.cAView.frame.origin.y = 294
//                horasH += 1
//                horas += 1
//            } else if horas > tipoTempo * qtdDias  {
//                stop()
//            }
//        }
//    }
    
//    func stop() {
//        isSimulating = false
//        imgAguaCano.isHidden = true
//        timer.invalidate()
//        minutos = 0
//        horas = 0
//        minutosM = 0
//        horasM = 0
//        diasM = 0
//        horasH = 0
//        diasH = 0
//    }
    
//    func trocaDia() {
//        switch tipoTaxa {
//        case .minutos:
//            if minutosM >= 60 {
//                minutosM = 0
//                horasM += 1
//            }
//            if horasM > 23 {
//                horasM = 0
//                diasM += 1
//                isSimulating = false
//            }
//            if horas == 13 {
//                isAnimating = false
//            }
//
//            //fazAnimacao(horario: horasM)
//        case .horas:
//            if horasH > 23 {
//                horasH = 0
//                diasH += 1
//                isAnimating = false
//            }
//            if horasH == 13 {
//                isAnimating = false
//            }
//            fazAnimacao(horario: horasH)
//        }
//    }
    
//    func fazAnimacao(horario: Int) {
//        guard isSimulating else { return }
//        guard !isAnimating else { return }
//
//
//        //1.35
//        //0.43
//        if horario == 2 {
//            isAnimating = true
//
//            //10
//            //TimeInterval(duracao/2)
//            // .curveEaseIn
//            UIView.animate(withDuration: 10, delay: 0.0, options: [.curveEaseIn], animations: {
//                self.imgCeuNoite.alpha = 0
//                self.imgLua.alpha = 0
//            }, completion:{(finished: Bool) in
//                if finished {
//                    self.isAnimating = false
//                }
//            })
//        } else if horario == 13 {
//            isAnimating = true
//            //11
//            //TimeInterval(duracao/2)
//            UIView.animate(withDuration: 11, delay: 0.0, options: [.curveEaseIn], animations: {
//                self.imgCeuNoite.alpha = 1
//                self.imgLua.alpha = 1
//            }, completion:{(finished: Bool) in
//                if finished {
//                   self.isAnimating = false
//                }
//            })
//        }
//
//    }
    
//    func fazDuracao() {
//        switch tipoTaxa {
//        case .minutos:
//            switch velocidade {
//            case 1:
//                duracao = 1440/1
//            case 2:
//                duracao = 1440/50
//                print()
//            case 3:
//                duracao = 1440/100
//            default:
//                break
//            }
//        case .horas:
//            switch velocidade {
//            case 1:
//                duracao = 24
//            case 2:
//                duracao = 24/50
//            case 3:
//                duracao = 24/100
//            default:
//                break
//            }
//        }
//    }
}


/*
 Minuto:
    - A cada 60 minutos, vira 1 hora
    - A cada 12 horas set valor se é dia ou não
    - A cada 24 horas vira 1 dia
    - Caso for dia, faz animacao para ir para noite
    - Caso for noite, faz animacao para ir de dia
 Horas:
    - A cada 12 horas set valor se é dia ou não
    - A cada 24 horas vira 1 dia
     - Caso for dia, faz animacao para ir para noite
     - Caso for noite, faz animacao para ir de dia
 */

