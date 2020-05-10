//
//  ViewController.swift
//  TipCalculator
//
//  Created by user169339 on 5/9/20.
//  Copyright © 2020 user169339. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var tipPercentageTextField: UITextField!
    @IBOutlet var adjustTipPercentage: UISlider!
    
     override func viewDidLoad() {
       super.viewDidLoad()
    
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
     }
    
    @objc func keyboardWillShow(notification: Notification) {
        view.frame.origin.y -= 200
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        view.frame.origin.y = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onCalc(_ sender: UIButton) {
        update()
    }
    
    @IBAction func onSlide(_ sender: UISlider) {
        tipPercentageTextField.text = String(Int(sender.value))
        update()
    }
    
    func update() {
        if let amount = Float(billAmountTextField.text!), let percent = Float(tipPercentageTextField.text!) {
            tipAmountLabel.text = String.init(format: "$ %.2f", amount * percent / 100)
        }
    }
    
}

