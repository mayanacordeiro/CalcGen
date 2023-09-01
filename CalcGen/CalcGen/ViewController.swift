//
//  ViewController.swift
//  CalcGen
//
//  Created by mcor on 15/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    @IBOutlet weak var textFieldThree: UITextField!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControlLabel()
        setupConstraints()
        
        textFieldOne.delegate = self
        textFieldTwo.delegate = self
        textFieldThree.delegate = self
        
        calculateButton.isEnabled = false
        calculateButton.setTitleColor(.white.withAlphaComponent(0.95), for: .disabled)
        calculateButton.setTitleColor(.white, for: .normal)
    }
    
    
    @IBAction func infoButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Atenção", message: "Os resultados da calculadora serão arredondados para até 5 casas decimais quando necessário. ", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
        
        self.present(alert,animated: true)
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        if segmentedControl.selectedSegmentIndex == 0 {
            
            calculateFA()
            showResult(de: calculateFA())
            
        } else {
            
            calculateFG()
            showResult(de: calculateFG())
            
        }
        
        calculateButton.isHidden = true
    }
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        segmentedControlLabel()
    }
    
    @IBAction func clearButton(_ sender: Any) {
        
        clearButton.isHidden = true
        labelResult.isHidden = true
        calculateButton.isHidden = false
        
        self.textFieldOne.text = nil
        self.textFieldTwo.text = nil
        self.textFieldThree.text = nil
        
        calculateButton.isEnabled = false
        
    }
    

    func segmentedControlLabel() {
        if segmentedControl.selectedSegmentIndex == 0 {
            labelThree.isHidden = false
            textFieldThree.isHidden = false
            labelOne.text = "Número de homozigotos"
            labelTwo.text = "Número de heterozigotos"
            labelThree.text = "Total de indivíduos da população"
            
            
        } else {
            labelOne.text = "Total de indivíduos com genótipo"
            labelTwo.text = "Total de indivíduos da população"
            labelThree.isHidden = true
            textFieldThree.isHidden = true
        }

    }
    
    func calculateFA() -> String {
        let inputTextFieldOne = textFieldOne.text!
        let inputOneFloat = Float(inputTextFieldOne)!
        
        let inputTextFieldTwo = textFieldTwo.text!
        let inputTwoFloat = Float(inputTextFieldTwo)!
        
        let inputTextFieldThree = textFieldThree.text!
        let inputThreeFloat = Float(inputTextFieldThree)!
        
        let FA = ((inputOneFloat * 2) + inputTwoFloat) / (inputThreeFloat * 2)
        let FAString = String(format: "%.5f", FA)
        //print(FA)
        
        return FAString
        
    }
    
    
    func calculateFG() -> String {
        let inputTextFieldOne = textFieldOne.text!
        let inputOneFloat = Float(inputTextFieldOne)!
        
        let inputTextFieldTwo = textFieldTwo.text!
        let inputTwoFloat = Float(inputTextFieldTwo)!
        
        let FG = inputOneFloat / inputTwoFloat
//        let FGRounded = round(FG * 100) / 100.00000
        let FGString = String(format: "%.5f", FG)
        //print(FG)
        
        return FGString
    }
    
    
    func showResult(de valor: String) {
        //exibe resultado na label
        labelResult.isHidden = false
        labelResult.text = "Resultado: \(valor)"
        
        calculateButton.isHidden = false
        clearButton.isHidden = false
    }
    
    func setupConstraints() {
        if segmentedControl.selectedSegmentIndex == 0 {
            labelResult.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([labelResult.topAnchor.constraint(equalTo: textFieldThree.bottomAnchor, constant: 48)
                                        ])

            clearButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([clearButton.topAnchor.constraint(equalTo: labelResult.bottomAnchor, constant: 24)
                                        ])
            
            calculateButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([calculateButton.topAnchor.constraint(equalTo: textFieldThree.bottomAnchor, constant: 32)
                                         ])

        }
//        else {
//            labelResult.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([labelResult.topAnchor.constraint(equalTo: textFieldTwo.bottomAnchor, constant: 48)
//                                        ])
//
//            clearButton.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([clearButton.topAnchor.constraint(equalTo: labelResult.bottomAnchor, constant: 24)
//                                        ])
//        
//            calculateButton.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([calculateButton.topAnchor.constraint(equalTo: textFieldTwo.bottomAnchor, constant: 32)
//                                        ])
//            
//        }

    }
    
    func validateTextFields() {
        if segmentedControl.selectedSegmentIndex == 0 {
            if textFieldOne.text != "" && textFieldTwo.text != "" && textFieldThree.text != "" {
                calculateButton.isEnabled = true
            } else {
                calculateButton.isEnabled = false
            }
        } else {
            if textFieldOne.text != "" && textFieldTwo.text != "" {
                calculateButton.isEnabled = true
                
            } else {
                calculateButton.isEnabled = false
            }
        }
    }

    
    
    
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        validateTextFields()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
   
}

