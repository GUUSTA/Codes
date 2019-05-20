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
    @IBOutlet weak var lblTempo: UILabel!
    @IBOutlet weak var cAView: UIView!
    @IBOutlet weak var aView: UIView!
    @IBOutlet weak var cAImageView: UIImageView!
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
    
    
    @IBOutlet weak var lblCompartimentoA: UILabel!
    @IBOutlet weak var btnAdicionar: UIButton!
    @IBOutlet weak var btnRemover: UIButton!
    
    @IBOutlet weak var txtQtdCompA: UITextField!
    
    @IBOutlet weak var txtTaxaA: UITextField!
    @IBOutlet weak var lblDias: UILabel!
    
    var timer: Timer = Timer()
    var timerInterval: TimeInterval = 1.0
    var segundos = 0
    var isAnimating = false
    
    var valoresCA = [Double]()
    var valoresCB = [Double]()
    var valoresCC = [Double]()
    var quant = [Double]()
    
    let alfabeto: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I"]

    var compartimentos: [Double] = [1000, 0, 0]
    var diferencas: [Double] = []
    var copiaCompartimentos: [Double] = []
    var taxas: [[Double]] = [ [-0.1, 0.1, 0.0],
                              [0.0, -0.05, 0.05],
                              [0.01, 0.0, -0.01]]

    var arrayLabelsValores = [UILabel]()
    var arrayLabels = [UILabel]()
    var arrayViews = [UIView]()
    var arrayCViews = [UIView]()
    var arrayImageViews = [UIImageView]()
    var matrizTxtTaxa = [[UITextField]]()
    var arrayTxtQtd = [UITextField]()
    var qtdDias = 1.0
    var h = 0.001
    var isSimulating = false
    var k = 20
    
    
    
    var duracao = 0
    var diferenca = 0.0
//    var velocidade = 1
    
    let corAzul = UIColor(red: 165, green: 241, blue: 255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        animacoes()
        btnSimular.layer.cornerRadius = 5
        btnAdicionar.layer.cornerRadius = self.btnAdicionar.frame.width/2
        btnRemover.layer.cornerRadius = self.btnRemover.frame.width/2
        
        configuraTxtFieldIniciais(txtField: txtQtdCompA)
        configuraTxtFieldIniciais(txtField: txtTaxaA)
        arrayTxtQtd.append(txtQtdCompA)
        var novoArrayTxtField = [UITextField]()
        novoArrayTxtField.append(txtTaxaA)
        matrizTxtTaxa.append(novoArrayTxtField)
        arrayLabels.append(lblCompartimentoA)
        arrayViews.append(aView)
        arrayCViews.append(cAView)
        arrayImageViews.append(cAImageView)
        arrayLabelsValores.append(lblCA)
        
    }
    
    @IBAction func sliderDias(_ sender: UISlider) {
        lblDias.text = "\(round(Double(sender.value) * 1)/1) dias"
        self.qtdDias = round(Double(sender.value) * 1)/1
    }
    
    
    @IBAction func removerCompartimento(_ sender: UIButton) {
        
        guard arrayViews.count > 1 else { return }
        
        arrayLabelsValores.last?.removeFromSuperview()
        arrayLabelsValores.removeLast()
        arrayViews.last?.removeFromSuperview()
        arrayViews.removeLast()
        arrayCViews.last?.removeFromSuperview()
        arrayCViews.removeLast()
        arrayImageViews.last?.removeFromSuperview()
        arrayImageViews.removeLast()
        arrayLabels.last?.removeFromSuperview()
        arrayLabels.removeLast()
        arrayTxtQtd.last?.removeFromSuperview()
        arrayTxtQtd.removeLast()
        
        for i in 0...matrizTxtTaxa.last!.count - 1 {
            matrizTxtTaxa.last![i].removeFromSuperview()
        }
        
        matrizTxtTaxa.removeLast()
        
        for j in 0...matrizTxtTaxa.count - 1 {
            matrizTxtTaxa[j].last?.removeFromSuperview()
            matrizTxtTaxa[j].removeLast()
        }
    }
    
    
    @IBAction func adicionarCompartimento(_ sender: UIButton) {
        
        let novoCView = UIView(frame: CGRect(x: arrayCViews.last!.frame.origin.x + 190, y: arrayViews.first!.frame.origin.y, width: 144, height: 96))
        novoCView.backgroundColor = arrayCViews.last?.backgroundColor
        
        let novoView = UIView(frame: CGRect(x: arrayViews.last!.frame.origin.x + 190, y: arrayCViews.first!.frame.origin.y, width: 144, height: 96))
        novoView.backgroundColor = arrayViews.last?.backgroundColor
        
        let novoImageView = UIImageView(frame: CGRect(x: arrayImageViews.last!.frame.origin.x + 190, y: arrayImageViews.last!.frame.origin.y, width: 158, height: 108))
        novoImageView.image = arrayImageViews.last?.image
        
        let novoLabelCompartimento = UILabel(frame: CGRect(x: arrayLabels.last!.frame.origin.x + 190, y: arrayLabels.last!.frame.origin.y, width: 144, height: 16))
        novoLabelCompartimento.textColor = arrayLabels.last?.textColor
        novoLabelCompartimento.font = arrayLabels.last?.font
        novoLabelCompartimento.text = "Compartimento \(alfabeto[arrayLabels.count])"
        novoLabelCompartimento.textAlignment = NSTextAlignment.center
        
        let novoLabelValor = UILabel(frame: CGRect(x: arrayLabelsValores.last!.frame.origin.x + 190, y: arrayLabelsValores.last!.frame.origin.y, width: 131, height: 49))
        novoLabelValor.font = arrayLabelsValores.last?.font
        novoLabelValor.textAlignment = NSTextAlignment.center
        novoLabelValor.textColor = arrayLabelsValores.last?.textColor
        novoLabelValor.text = "C\(alfabeto[arrayLabelsValores.count])"
        
        
        for i in 0...matrizTxtTaxa.count - 1 {
            let txt = UITextField(frame: CGRect(x: matrizTxtTaxa[i].last!.frame.origin.x + 190, y: matrizTxtTaxa[i].last!.frame.origin.y, width: 144, height: 30))
            configuraTxtField(txtField: txt)
            txt.placeholder = "Taxa \(alfabeto[i])-\(alfabeto[matrizTxtTaxa[i].count])"
            matrizTxtTaxa[i].append(txt)
            self.view.addSubview(txt)
        }
        
        matrizTxtTaxa.append([])
        
        for i in 0...matrizTxtTaxa.count - 1 {
            if i == 0 {
                let txt = UITextField(frame: CGRect(x: matrizTxtTaxa[matrizTxtTaxa.count-2][0].frame.origin.x, y: matrizTxtTaxa[matrizTxtTaxa.count-2][0].frame.origin.y + 34, width: 144, height: 30))
                configuraTxtField(txtField: txt)
                txt.placeholder = "Taxa \(alfabeto[i])-\(alfabeto[matrizTxtTaxa.first!.count - 1])"
                matrizTxtTaxa[matrizTxtTaxa.count - 1].append(txt)
                self.view.addSubview(txt)
            } else {
                let txt = UITextField(frame: CGRect(x: matrizTxtTaxa[matrizTxtTaxa.count - 1].last!.frame.origin.x + 190, y: matrizTxtTaxa[matrizTxtTaxa.count - 1].last!.frame.origin.y, width: 144, height: 30))
                configuraTxtField(txtField: txt)
                txt.placeholder = "Taxa \(alfabeto[i])-\(alfabeto[matrizTxtTaxa.first!.count - 1])"
                matrizTxtTaxa[matrizTxtTaxa.count - 1].append(txt)
                self.view.addSubview(txt)
            }
        }
        
        let novoTxtFieldQtd = UITextField(frame: CGRect(x: arrayTxtQtd.last!.frame.origin.x + 190, y: arrayTxtQtd.last!.frame.origin.y, width: 144, height: 30))
        configuraTxtField(txtField: novoTxtFieldQtd)
        novoTxtFieldQtd.placeholder = "Qtd. Compartimento \(alfabeto[arrayTxtQtd.count])"
        
        arrayViews.append(novoView)
        arrayCViews.append(novoCView)
        arrayImageViews.append(novoImageView)
        arrayLabels.append(novoLabelCompartimento)
        arrayTxtQtd.append(novoTxtFieldQtd)
        arrayLabelsValores.append(novoLabelValor)
        
        self.view.addSubview(novoView)
        self.view.addSubview(novoCView)
        self.view.addSubview(novoImageView)
        self.view.addSubview(novoLabelCompartimento)
        self.view.addSubview(novoTxtFieldQtd)
        self.view.addSubview(novoLabelValor)
        
    }
    
    func configuraTxtField(txtField: UITextField) {
        txtField.textColor = arrayTxtQtd.last?.textColor
        txtField.backgroundColor = arrayTxtQtd.last?.backgroundColor
        txtField.font = arrayTxtQtd.last?.font
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.decimalPad
        txtField.returnKeyType = UIReturnKeyType.done
        txtField.clearButtonMode = UITextField.ViewMode.whileEditing
        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        txtField.textAlignment = NSTextAlignment.center
        txtField.text = "0"
    }
    
    func configuraTxtFieldIniciais(txtField: UITextField) {
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.decimalPad
        txtField.returnKeyType = UIReturnKeyType.done
        txtField.clearButtonMode = UITextField.ViewMode.whileEditing
        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        txtField.textAlignment = NSTextAlignment.center
    }
    
    func formataArrayTaxas() {
        taxas = [[Double]]()
        compartimentos = [Double]()
        
        for i in 0...matrizTxtTaxa.count - 1 {
            taxas.append([])
            for j in 0...matrizTxtTaxa[i].count - 1 {
                taxas[i].append((matrizTxtTaxa[i][j].text! as NSString).doubleValue)
            }
        }
        
        for txt in arrayTxtQtd {
            compartimentos.append((txt.text! as NSString).doubleValue)
        }
    }
    
    func fazFormula(arrayComp: [Double], qtd: Double, arrayK: [Double]) -> [Double] {
        var matrizSomada = [Double]()
        for linha in 0...arrayComp.count - 1 {
            var soma = 0.0
            for coluna in 0...taxas.count - 1 {
                soma += (arrayComp[coluna] + (qtd * arrayK[coluna])) * taxas[coluna][linha]
            }
            matrizSomada.append(soma)
        }
        return matrizSomada
    }
    
    func fazFormulaK1(arrayComp: [Double]) -> [Double] {
        var matrizSomada = [Double]()
        for linha in 0...arrayComp.count - 1 {
            var soma = 0.0
            for coluna in 0...taxas.count - 1 {
                soma += arrayComp[coluna] * taxas[coluna][linha]
            }
            matrizSomada.append(soma)
        }
        return matrizSomada
    }
    
    func calcula() {
        var j: Double = 0.0
        copiaCompartimentos = compartimentos
        var copyArray: [Double] = compartimentos
        print(copyArray)
        while j < qtdDias {
            let k1 = fazFormulaK1(arrayComp: copyArray)
            let k2 = fazFormula(arrayComp: copyArray, qtd: h/2, arrayK: k1)
            let k3 = fazFormula(arrayComp: copyArray, qtd: h/2, arrayK: k2)
            let k4 = fazFormula(arrayComp: copyArray, qtd: h, arrayK: k3)
            copyArray = determinaNovoValor(arrayComp: copyArray, h: h, k1: k1, k2: k2, k3: k3, k4: k4)
            j += h
            //print("\(j) ", copyArray)
            
            retornaSoma(array: copyArray)
        }
        compartimentos = copyArray
    }
    
    func determinaNovoValor(arrayComp: [Double], h: Double, k1: [Double], k2: [Double], k3: [Double], k4: [Double]) -> [Double]{
        var copyArray: [Double] = arrayComp
        for i in 0...copyArray.count - 1 {
            copyArray[i] = copyArray[i] + (h/6) * (k1[i] + (2 * k2[i]) + (2 * k3[i]) + k4[i])
        }
        return copyArray
    }
    
    func retornaSoma(array: [Double]) {
        var soma = 0.0
        for item in array {
            soma += item
        }
        //print(soma)
    }
    
    func determinaDiferenca() {
        
        diferencas = []
        
        for i in 0...compartimentos.count - 1 {
            let d = copiaCompartimentos[i] - compartimentos[i]
            diferencas.append(d)
        }
        
        print(diferencas)
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
    
    func verificaTxtField() -> Bool {
        
        for txt in arrayTxtQtd {
            if txt.text == "" {
                return false
            }
        }
        
        for i in 0...matrizTxtTaxa.count - 1 {
            for j in 0...matrizTxtTaxa.count - 1 {
                if matrizTxtTaxa[i][j].text == ""{
                    return false
                }
            }
        }
        
        return true
    }
    
    @IBAction func simular(_ sender: UIButton) {
        
        guard !isSimulating else { return }
        guard verificaTxtField() else { return }
        //guard txtCompA.text != "", txtQtdDias.text != "", txtTaxa.text != "" else { return }
        setup()
        formataArrayTaxas()
        calcula()
        atribuirValores()
        determinaDiferenca()
        anima()
        startTimer()
        //animacaCeu()
        isSimulating = true
    }
    
    func atribuirValores() {
        let value: Double = 10000
        
        for i in 0...compartimentos.count - 1 {
            arrayLabelsValores[i].text = "\(round(compartimentos[i] * value)/value)"
        }
    }
    
    func regraDeTres(cA: Double, cC: Double, index: Int) -> Double {
        let diferenca = (Double(self.arrayViews[index].frame.height) * cC)/cA
        return diferenca
    }
    func regraDeTres1(cA: Double, cC: Double, index: Int) -> Double {
        let diferenca = (Double(self.arrayCViews[index].frame.height) * cC)/cA
        return diferenca
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    @objc func update() {
        
        if segundos < Int(qtdDias) {
            if !isAnimating {
                self.isAnimating = true
                UIView.animate(withDuration: 1, delay: 0.0, options: [.curveLinear, .autoreverse], animations: {
                    self.imgCeuNoite.alpha = 0
                    self.imgLua.alpha = 0
                }, completion:{(finished: Bool) in
                    if finished {
                        self.imgCeuNoite.alpha = 1
                        self.imgLua.alpha = 1
                        self.isAnimating = false
                        self.segundos += 1
                    }
                })
            }
        } else {
            timer.invalidate()
            isSimulating = false
            isAnimating = false
            segundos = 0
        }
    }
    
    func anima() {
        for i in 0...compartimentos.count - 1 {
            UIView.animate(withDuration: qtdDias * 3, animations: {
                if i == 0 {
                    print("\(i) ", CGFloat(self.regraDeTres(cA: 1000.0, cC: -1 * self.diferencas[i], index: i)))
                    self.arrayCViews[i].frame.size.height += CGFloat(self.regraDeTres(cA: self.copiaCompartimentos[i], cC: self.diferencas[i], index: i))
                }
                else {
                    print("\(i) ", CGFloat(self.regraDeTres1(cA: 1000.0, cC: -1 * self.diferencas[i], index: i)))
                    self.arrayCViews[i].frame.size.height -= CGFloat(self.regraDeTres1(cA: self.copiaCompartimentos.first! + self.copiaCompartimentos[i], cC: -1 * self.diferencas[i], index: i))
                }
            })
        }
    }
    
//    func animaCompartimentos() {
//
//        UIView.animate(withDuration: 3, animations: {
//
//            self.cAView.frame.size.height = self.cAView.frame.height + CGFloat(self.diferenca)
//            self.cBView.frame.size.height = self.cBView.frame.height - CGFloat(self.diferenca)
//
//        }, completion: { (finish: Bool) in
//
//            self.isSimulating = false
//            self.imgAguaCano.isHidden = true
//
//        } )
//
//        lblCA.text = "\(cA)"
//        lblCB.text = "\(cB)"
//    }
    
    func setup() {
        for i in 0...arrayCViews.count - 1 {
            if i == 0 {
                arrayLabelsValores.first?.text = "CA"
                arrayViews.first!.frame = CGRect(x: arrayViews.first!.frame.origin.x, y: 373, width: 144, height: 96)
                arrayCViews.first!.frame = CGRect(x: arrayCViews.first!.frame.origin.x, y: 373, width: 144, height: 1)
            } else {
                arrayLabelsValores[i].text = "C\(alfabeto[i])"
                arrayCViews[i].frame = CGRect(x: arrayCViews[i].frame.origin.x, y: arrayViews.first!.frame.origin.y, width: 144, height: 96)
                arrayViews[i].frame = CGRect(x: arrayCViews[i].frame.origin.x, y: arrayCViews.first!.frame.origin.y, width: 144, height: 96)
            }
        }
        
        self.imgCeuNoite.alpha = 1
        self.imgLua.alpha = 1
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

