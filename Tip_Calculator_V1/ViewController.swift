//
//  ViewController.swift
//  Tip_Calculator_V1
//
//  Created by Kevin Nguyen on 12/13/17.
//  Copyright © 2017 KevinVuNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var percentType = 0.0
    
    @IBOutlet weak var InputBillAmount: UITextField!
    @IBOutlet weak var InputPlusTip: UITextField!
    @IBOutlet weak var TipAmount: UILabel!
    @IBOutlet weak var TipAmountValue: UILabel!
    
    @IBOutlet weak var button30: UIButton!
    @IBOutlet weak var button25: UIButton!
    @IBOutlet weak var button15: UIButton!
    
    let DEBUG = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button30.layer.cornerRadius = 4
        button15.layer.cornerRadius = 4
        InputBillAmount.delegate = self
        //InputBillAmount.becomeFirstResponder()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textViewDidChange(textView: UITextField) { //Handle the text changes here
        updateBillAndTip()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateInputText(_ sender: UITextField) {
        if DEBUG{
            print("1. Program made it into UpdateInputText method")
        }
        
        if let value = InputBillAmount!.text{
            if value.count > 3{
                print ("Value is", value)
            let index = value.index(value.startIndex, offsetBy: 4)
            print(String(value.prefix(upTo: index)))
                if( String(value.prefix(upTo: index)) == "$0.0"){
                let indexEnd = value.index(value.endIndex, offsetBy: 4 - value.count)
                InputBillAmount.text! = String(value[indexEnd...])
                }
            }else if(value.count == 0){
                InputBillAmount.text! = "$0.0"
            }
        }
        updateBillAndTip()
    }
    
    @IBAction func updateTouchDown(_ sender: UITextField) {
        if DEBUG{
            print("2. Program made it into UpdateTouchDown Method")
        }
        if let value = InputBillAmount!.text{
            if(value == ""){
                InputBillAmount.text! = "$0.0"
            }
        }
    }
    
    
    @IBAction func editingEnds(_ sender: UITextField) {
        if DEBUG{
            print("3. Program made it into editingEnds")
        }
    }
    
    func updateBillAndTip(){
        
        if let stringValue = InputBillAmount!.text{
        
        if((stringValue.count == 1  && stringValue != "$" ) || stringValue.count > 1){
           var billAmount = 0.0
            
            if(stringValue.first == "$"){
                
                let index = stringValue.index(stringValue.startIndex, offsetBy: 1)
                
                billAmount = round((10)*Double(stringValue[index...])!)/10
                
            }else{
                billAmount = round(10*Double(stringValue)!)/10
            }
            
            InputPlusTip.text! = "$" + String(billAmount + billAmount*percentType)
            
            TipAmount.text! = String(100*percentType) + "%"
            TipAmountValue.text! = "$" + String(billAmount*percentType)
        }
        }
    }
    
    @IBAction func update15Percent(_ sender: UIButton) {
        percentType = 0.15
        updateBillAndTip()
        button15.backgroundColor = UIColor.darkGray
        button25.backgroundColor = UIColor.gray
        button30.backgroundColor = UIColor.gray
    }
    
    @IBAction func update25Percent(_ sender: UIButton) {
        percentType = 0.25
        updateBillAndTip()
        button15.backgroundColor = UIColor.gray
        button25.backgroundColor = UIColor.darkGray
        button30.backgroundColor = UIColor.gray
    }
    
    @IBAction func update30Percent(_ sender: UIButton) {
        percentType = 0.30
        updateBillAndTip()
        button15.backgroundColor = UIColor.gray
        button25.backgroundColor = UIColor.gray
        button30.backgroundColor = UIColor.darkGray
    }
    
}

