//
//  SecondVC.swift
//  UnitConversion
//
//  Created by Admin on 19/07/22.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet var fromSegment: UISegmentedControl!
    @IBOutlet var toSegment: UISegmentedControl!
    @IBOutlet var textField: UITextField!
    @IBOutlet var resultLable: UILabel!
    
    var fromSegmentOne = String()
    var fromSegmentTwo = String()
    var toSegmentOne = String()
    var toSegmentTwo = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fromSegment.setTitle(fromSegmentOne, forSegmentAt: 0)
        fromSegment.setTitle(fromSegmentTwo, forSegmentAt: 1)

        toSegment.setTitle(toSegmentOne, forSegmentAt: 0)
        toSegment.setTitle(toSegmentTwo, forSegmentAt: 1)
        
        resultLable.isHidden = true
    }
    

    @IBAction func calculationButton(_ sender: UIButton) {
        
        if textField.text == "" {
            resultLable.isHidden = false
            resultLable.text = "Enter Something To calculate"
        }
        
        else  {
            
            if isDouble(arrayOfString: textField.text!) {
                resultLable.isHidden = false
                
                let result = calculateUnitConversion(from: fromSegment.titleForSegment(at: fromSegment.selectedSegmentIndex)!, to: toSegment.titleForSegment(at: toSegment.selectedSegmentIndex)!, textField: Double(textField.text!)!)
                
                resultLable.text = result
            }
            else {
                resultLable.isHidden = false
                resultLable.text = "Enter Correct Value"
            }
        }
    }
    
    
    func isDouble(arrayOfString arr: String ...) -> Bool {
        var isDub = true
        for i in arr {
            let checkDouble: Double? = Double(i)
            if checkDouble == nil {
                isDub = false
            }
        }
        return isDub
    }
    
 
    func calculateUnitConversion(from f: String, to t: String, textField num: Double) -> String {
        
        if f == t {
            return "\(f) can't converted into \(t)"
        }
        
        else if f == "Centimeter" && t == "Meter" {
            let result = "\(num / 100) \(t)"
            return result
        }
        
        else if f == "Meter" && t == "Centimeter" {
            let result = "\(num * 100) \(t)"
            return result
        }
        
        else if f == "Celsius" && t == "Fahrenheit" {
            let result = "\((num * 9/5) + 32) \(t)"
            return result
        }
        
        else if f == "Fahrenheit" && t == "Celsius" {
            let result = "\((num - 32) * 5/9) \(t)"
            return result
        }
        
        else if f == "MilliLiter" && t == "Liter" {
            let result = "\(num / 1000) \(t)"
            return result
        }
        
        else if f == "Liter" && t == "MilliLiter" {
            let result = "\(num * 1000) \(t)"
            return result
        }
        return "Something Went Wrong"
    }
}
