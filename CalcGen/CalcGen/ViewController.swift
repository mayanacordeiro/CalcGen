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
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        segmentedControlLabel()
    }
    
    
    @IBAction func infoButton(_ sender: UIButton) {
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        calculateFG()
    }
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        segmentedControlLabel()
    }
    

    func segmentedControlLabel() {
        if segmentedControl.selectedSegmentIndex == 0 {
            labelOne.text = "Número de homozigotos"
            labelTwo.text = "Número de heterozigotos"
        } else {
            labelOne.text = "Total de indivíduos com genótipo"
            labelTwo.text = "Total de indivíduos da população"
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
    
    
}

