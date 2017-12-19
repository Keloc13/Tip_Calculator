 //
//  ViewController.swift
//  Tip_Calculator_V1
//
//  Created by Kevin Nguyen on 12/13/17.
//  Copyright © 2017 KevinVuNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var InputBillAmount: UITextField!
    @IBOutlet weak var InputPlusTip: UITextField!
    @IBOutlet weak var TipAmount: UILabel!
    @IBOutlet weak var TipAmountValue: UILabel!
    
    @IBOutlet weak var button30: UIButton!
    @IBOutlet weak var button25: UIButton!
    @IBOutlet weak var button15: UIButton!
    
    var firstPercent = 0.15
    var secondPercent = 0.25
    var thirdPercent = 0.30
     var percentType = 0.0
    
    let DEBUG = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button30.layer.cornerRadius = 8
        button15.layer.cornerRadius = 8
        InputBillAmount.delegate = self
        self.title = "Tip Calculator"
        //automatically displays the decimal text monitor
        InputBillAmount.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        button15.setTitle(String(Data.getPercent(value: 0)*100)+"%", for: .normal)
        button25.setTitle(String(Data.getPercent(value: 1)*100)+"%", for: .normal)
        button30.setTitle(String(Data.getPercent(value: 2)*100)+"%", for: .normal)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidChange(textView: UITextField) { //Handle the text changes here
        if DEBUG{ print("made it to textViewDidChange")}
        updateBillAndTip()
    }
    
    @IBAction func updateInputText(_ sender: UITextField) {
        if DEBUG{ print("1. Program made it into UpdateInputText method")}
        
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
        if DEBUG{ print("2. Program made it into UpdateTouchDown Method")}
        
        if let value = InputBillAmount!.text{
            if(value == ""){
                InputBillAmount.text! = "$0.0"
            }
        }
    }
    
    func updateBillAndTip(){
        
        if DEBUG{ print("Made it into UpdateBillAmount")}
        
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
    
    /*
    update Methods for the percent
     */
    
    @IBAction func update15Percent(_ sender: UIButton) {
        percentType = Data.getPercent(value: 0)
        print(Data.getPercent(value: 0)*100)
        updateBillAndTip()
        button15.backgroundColor = UIColor.darkGray
        button25.backgroundColor = UIColor.gray
        button30.backgroundColor = UIColor.gray
    }
    
    @IBAction func update25Percent(_ sender: UIButton) {
        percentType = Data.getPercent(value: 1)
        updateBillAndTip()
        button15.backgroundColor = UIColor.gray
        button25.backgroundColor = UIColor.darkGray
        button30.backgroundColor = UIColor.gray
    }
    
    @IBAction func update30Percent(_ sender: UIButton) {
        percentType = Data.getPercent(value: 2)
        updateBillAndTip()
        button15.backgroundColor = UIColor.gray
        button25.backgroundColor = UIColor.gray
        button30.backgroundColor = UIColor.darkGray
    }
    
    /*
        Setting
     */
    
    @IBAction func SettingPressed(_ sender: UIBarButtonItem) {
        if DEBUG{ print("SettingBarPressed") }
    }
    @IBAction func settingTransition(_ sender: UIButton) {
        if DEBUG{ print("Setting has been pressed") }
    }
    
}

