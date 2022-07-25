//
//  ViewController.swift
//  UnitConversion
//
//  Created by Admin on 19/07/22.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var img: UIImageView!
    @IBOutlet var lable: UILabel!
    @IBOutlet var Segment: UISegmentedControl!
    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.image = UIImage.init(imageLiteralResourceName: "unitconlogo")
        lable.text = "Select One Opition"
        btnNext.isHidden = true
        
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        
        let SegmentIndex = Segment.selectedSegmentIndex

        switch SegmentIndex {

        case 0:
            secondVC.fromSegmentOne = "Centimeter"
            secondVC.fromSegmentTwo = "Meter"
            secondVC.toSegmentOne = "Centimeter"
            secondVC.toSegmentTwo = "Meter"

        case 1:
            secondVC.fromSegmentOne = "Celsius"
            secondVC.fromSegmentTwo = "Fahrenheit"
            secondVC.toSegmentOne = "Celsius"
            secondVC.toSegmentTwo = "Fahrenheit"

        case 2:
            secondVC.fromSegmentOne = "MilliLiter"
            secondVC.fromSegmentTwo = "Liter"
            secondVC.toSegmentOne = "MilliLiter"
            secondVC.toSegmentTwo = "Liter"

        default:
            print("Wrong Choice !")
        }
        
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    @IBAction func SegAction(_ sender: UISegmentedControl) {
        
        if Segment.selectedSegmentIndex == 0 {
            btnNext.isHidden = false
            img.image = UIImage.init(imageLiteralResourceName: "length")
            lable.text = "LENGTH"
        }
        else if Segment.selectedSegmentIndex == 1 {
            btnNext.isHidden = false
            img.image = UIImage.init(imageLiteralResourceName: "temp")
            lable.text = "TEMPRATURE"
        }
        else if Segment.selectedSegmentIndex == 2 {
            btnNext.isHidden = false
            img.image = UIImage.init(imageLiteralResourceName: "volum")
            lable.text = "VOLUM"
        }
    }
}

