//
//  SettingViewController.swift
//  Tip_Calculator_V1
//
//  Created by Kevin Nguyen on 12/16/17.
//  Copyright © 2017 KevinVuNguyen. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    let DEBUG = true
    
    @IBOutlet weak var firstCurrentPerc: UILabel!
    @IBOutlet weak var secondCurrentPerc: UILabel!
    @IBOutlet weak var thirdCurrentPerc: UILabel!
    @IBOutlet weak var newInput1: UITextField!
    @IBOutlet weak var newInput2: UITextField!
    @IBOutlet weak var newInput3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if DEBUG{
        print("Made it to settingViewController load")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        if DEBUG{
        print("Made it to didReceiveMemoryWarning method")
        }
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstNewInput(_ sender: UITextField) {
        if(DEBUG){
            print("1. Made it to first New Input")
        }
        else{
        
       firstCurrentPerc.text! =  newInput1.text!
      
       // performSegue(withIdentifier: "PercentChange", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(DEBUG){
            print("Made it into prepare method")
        }else{
        
        let destVC = segue.destination as! ViewController
        
        destVC.updatePercent(setValueChange: 1, quantityChanged: Double(newInput1.text!)!)
        }
    }
    
    @IBAction func secondNewInput(_ sender: UITextField) {
    }
    
    @IBAction func thirdNewInput(_ sender: UITextField) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
