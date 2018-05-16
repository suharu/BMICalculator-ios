//
//  ViewController.swift
//  BodyMassIndex
//
//  Created by suharu on 24.02.2017.
//  Copyright © 2017 suharu. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    var secilenGender = "";
    var secilenIndex = 0;
    @IBOutlet weak var segCtrl: UISegmentedControl!
    
    
    
    @IBAction func genderChanged(_ sender: Any)
    {
        secilenIndex = segCtrl.selectedSegmentIndex;
        secilenGender = segCtrl.titleForSegment(at: secilenIndex)!
    }
    
    
    //Define weight text as a variable to get its content
    @IBOutlet weak var txtWeight: UITextField!
    
    //Define height text as a variable to get its content
    
    @IBOutlet weak var txtHeight: UITextField!
    
    //definition of label bmi
    
    @IBOutlet weak var lblBmi: UILabel!
    
    // definition of label ideal kg
    
    @IBOutlet weak var lblidealKg: UILabel!
    
    //Definition of text view
    
    @IBOutlet weak var txtView: UITextView!
    
    //perform method when method clicked
    @IBAction func btnClicked(_ sender: UIButton) {
        let height = Double(txtHeight.text!)
        let weight = Double(txtWeight.text!)
        
        
        secilenIndex = segCtrl.selectedSegmentIndex;
        secilenGender = segCtrl.titleForSegment(at: secilenIndex)!
        
        
        var idealKg:Double
        if(segCtrl.selectedSegmentIndex == 1)
        {
           idealKg = round(45.5 + 2.3 * ((height! / 0.0254) - 60))
        }
        else
        {
        
            idealKg = round( 50 + 2.3 * ((height! / 0.0254) - 60))
        }
        
        var txtIdealWeight:String = (String)(idealKg)
        lblidealKg.text = "Ideal Weight: \(txtIdealWeight)"
        
       
        let bmi:Double = round(weight! / (height! * height!))
        var txtBmi:String = (String)(bmi)
        lblBmi.text = " BMI: \(txtBmi)"
        
        if ( bmi <= 18 )
        {
            view.backgroundColor = UIColor.blue
            txtView.text = "You are underweight, eat well!"
        }
        else if ( 18 < bmi && bmi <= 24 )
        {
            view.backgroundColor = UIColor.green
            txtView.text = "wooow, how healty you are!"
        }
        else if ( 24 < bmi && bmi <= 29)
        {
            view.backgroundColor = UIColor.yellow
            txtView.text = "You are overweight, eat less!"
        }
        else if ( 29 < bmi && bmi <= 39)
        {
            view.backgroundColor = UIColor.orange
            txtView.text = "You are obese, stop eating desserts!"
        }
        else
        {
            view.backgroundColor = UIColor.red
            txtView.text = "You are extremely obese, you should go to doctor!!"
            txtView.sizeToFit()
        }

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

