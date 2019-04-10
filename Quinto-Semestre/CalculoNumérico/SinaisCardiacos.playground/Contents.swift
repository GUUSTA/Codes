import UIKit
import Foundation

class CardiacSignal {
    
    var time: Double
    var voltage: Double
    
    init(time: Double, voltage: Double) {
        self.time = time
        self.voltage = voltage
    }
    
    func derivada(prev: CardiacSignal) -> Double {
        return formula(y0: voltage, y1: prev.voltage, x0: time, x1: prev.time)
    }
    
    func formula(y0: Double, y1: Double, x0: Double, x1: Double) -> Double {
        return (y1 - y0)/(x1 - x0)
    }
}

extension Int {
    var par: Bool {
        if self%2 == 0 {
            return true
        }
        return false
    }
}

func fazDp(vetor: [CardiacSignal]) {
    
    var soma: Double = 0.0
    var media: Double = 0.0
    var dp: Double = 0.0
    var min: Double = 0.0
    var max: Double = 0.0
    var minimos = [CardiacSignal]()
    var maximos = [CardiacSignal]()
    
    for volt in vetor {
        soma += volt.voltage
    }
    
    media = soma/Double(vetor.count)
    
    for volt in vetor {
        dp += (volt.voltage - media) * (volt.voltage - media)
    }
    
    dp = sqrt(dp/Double(vetor.count - 1))
    min = media - dp
    max = media + dp
    
    for value in vetor {
        if value.voltage > max {
            maximos.append(value)
        } else if value.voltage < min {
            minimos.append(value)
        }
    }
    
    for signal in maximos {
        print("MAXIMOS -> Tempo: \(signal.time) - Voltagem: \(signal.voltage)")
    }
    
    for signal in minimos {
        print("MINIMOS -> Tempo: \(signal.time) - Voltagem: \(signal.voltage)")
    }
}

func fazDpPositiva(vetor: [CardiacSignal]) {
    var soma: Double = 0.0
    var media: Double = 0.0
    var dp: Double = 0.0
    var max: Double = 0.0
    var maximos = [CardiacSignal]()
    
    for volt in vetor {
        soma += volt.voltage
    }
    
    media = soma/Double(vetor.count)
    
    for volt in vetor {
        dp += (volt.voltage - media) * (volt.voltage - media)
    }
    
    dp = sqrt(dp/Double(vetor.count - 1))
    max = media + dp
    
    for value in vetor {
        if value.voltage > max {
            maximos.append(value)
        }
    }
    
    for signal in maximos {
        print("MAXIMOS -> Tempo: \(signal.time) - Voltagem: \(signal.voltage)")
    }
}

func fazDpNegativa(vetor: [CardiacSignal]) {
    var soma: Double = 0.0
    var media: Double = 0.0
    var dp: Double = 0.0
    var min: Double = 0.0
    var minimos = [CardiacSignal]()
    
    for volt in vetor {
        soma += volt.voltage
    }
    
    media = soma/Double(vetor.count)
    
    for volt in vetor {
        dp += (volt.voltage - media) * (volt.voltage - media)
    }
    
    dp = sqrt(dp/Double(vetor.count - 1))
    min = media - dp
    
    for value in vetor {
        if value.voltage < min {
            minimos.append(value)
        }
    }
    
    for signal in minimos {
        print("MINIMOS -> Tempo: \(signal.time) - Voltagem: \(signal.voltage)")
    }
}

func separaVetor(vetor: [CardiacSignal]) {
    
    var positivos = [CardiacSignal]()
    var negativos = [CardiacSignal]()
    
    for volt in vetor {
        if volt.voltage > 0.0 {
            positivos.append(volt)
        } else if volt.voltage < 0.0 {
            negativos.append(volt)
        }
    }
    
    fazDpPositiva(vetor: positivos)
    fazDpNegativa(vetor: negativos)
    
}

var contents = ""

var array = [String]()

var numeros = [Double]()
var times = [Double]()
var voltages = [Double]()

var signals = [CardiacSignal]()
var derivada1 = [CardiacSignal]()
var derivada2 = [CardiacSignal]()

var media = 0.0
var soma = 0.0
var dp = 0.0
var i = 0
var min = 0.0
var max = 0.0

var minimos = [CardiacSignal]()
var maximos = [CardiacSignal]()


if let filepath = Bundle.main.path(forResource: "14046", ofType: "txt") {
    do {
        contents = try String(contentsOfFile: filepath)
        contents = contents.replacingOccurrences(of: "\n", with: "\t")
        contents = contents.replacingOccurrences(of: " ", with: "")
        array = contents.components(separatedBy: "\t")
        array.removeLast()
    } catch {
        print("Could not load")
    }
} else {
    print("Error: txt not found")
}

for element in array {
    
    let numero = (element as NSString).doubleValue
    
    if i.par {
        times.append(numero)
    } else if !i.par {
        voltages.append(numero)
    }
    
    i += 1
    
}

for index in 0...times.count - 1 {
    signals.append(CardiacSignal(time: times[index], voltage: voltages[index]))
}

for j in 1...signals.count - 1 {
    let atual = signals[j]
    let anterior = signals[j - 1]
    let derivada = atual.derivada(prev: anterior)
    derivada1.append(CardiacSignal(time: anterior.time, voltage: derivada))
}

for k in 1...derivada1.count - 1 {
    let atual = derivada1[k]
    let anterior = derivada1[k - 1]
    let derivada = atual.derivada(prev: anterior)
    derivada2.append(CardiacSignal(time: anterior.time, voltage: derivada))
}

separaVetor(vetor: derivada2)

//fazDp(vetor: derivada2)

