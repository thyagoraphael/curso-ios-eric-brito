//
//  ViewController.swift
//  IMC
//
//  Created by thyagoraphael on 7/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!) {
            imc = weight / pow(height, 2)
            showResults()
        }
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso Ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        let imcResult = String(format: "%.2f", imc)
        lbResult.text = "\(result): \(imcResult) Kg"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
         view.endEditing(true)
    }
}

