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
        
                
    }
    
    
    @IBAction func infoButton(_ sender: UIButton) {
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
    
    
    func calculateFG() -> Float {
        let inputTextFieldOne = textFieldOne.text!
        let inputOneFloat = Float(inputTextFieldOne)!
        
        let inputTextFieldTwo = textFieldTwo.text!
        let inputTwoFloat = Float(inputTextFieldTwo)!
        
        let FG = inputOneFloat / inputTwoFloat
//        let FGRounded = round(FG * 100) / 100
        
        print(FG)
        
        return FG
    }
    
    func calculateFA() -> Float {
        let inputTextFieldOne = textFieldOne.text!
        let inputOneFloat = Float(inputTextFieldOne)!
        
        let inputTextFieldTwo = textFieldTwo.text!
        let inputTwoFloat = Float(inputTextFieldTwo)!
        
        let inputTextFieldThree = textFieldThree.text!
        let inputThreeFloat = Float(inputTextFieldThree)!
        
        let FA = ((inputOneFloat * 2) + inputTwoFloat) / (inputThreeFloat * 2)
        
        print(FA)
        
        return FA
        
    }
    
    func showResult(de valor: Float) {
        //exibe resultado na label
        labelResult.isHidden = false
        labelResult.text = "O valor da FG é \(valor)"
        
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

        } else {
            labelResult.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([labelResult.topAnchor.constraint(equalTo: textFieldTwo.bottomAnchor, constant: 48)
                                        ])

            clearButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([clearButton.topAnchor.constraint(equalTo: labelResult.bottomAnchor, constant: 24)
                                        ])
        
            calculateButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([calculateButton.topAnchor.constraint(equalTo: textFieldTwo.bottomAnchor, constant: 32)
                                        ])
            
        }

    }
    
    
    
    
}

