//
//  QuadraticViewController.swift
//  Sanjay_Sharma_MT_8890604
//
//  Created by user238626 on 3/11/24.
//
import UIKit
class QuadraticViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    @IBOutlet weak var aTextField: UITextField!
    @IBOutlet weak var bTextField: UITextField!
    @IBOutlet weak var cTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the delegate for text fields
        aTextField.delegate = self
        bTextField.delegate = self
        cTextField.delegate = self
        messageLabel.isHidden = true
        resultLabel.isHidden = true
    }
    
    // Lock orientation to portrait
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        guard let text_A = aTextField.text, !text_A.isEmpty,
              let text_B = bTextField.text, !text_B.isEmpty,
              let text_C = cTextField.text, !text_C.isEmpty,
              let a_Value = Double(text_A),
              let b_Value = Double(text_B),
              let c_Value = Double(text_C) else {
            showErrorMessage("Please enter valid numbers for A, B, and C.")
            return
        }
        
        // Check if input A is zero
        if a_Value == 0 {
            showErrorMessage("The value you entered for A is zero.")
            return
        }
        
        // Check if input B is zero
        if b_Value == 0 {
            showErrorMessage("The value you entered for B is zero.")
            return
        }
        
        // Check if input C is zero
        if c_Value == 0 {
            showErrorMessage("The value you entered for C is zero.")
            return
        }
        
        // Calculate the discriminant
        let discriminant = b_Value * b_Value - 4 * a_Value * c_Value
        
        if discriminant < 0 {
            showErrorMessage("The equation has no real roots.")
        } else {
            let x1 = (-b_Value + sqrt(discriminant)) / (2 * a_Value)
            let x2 = (-b_Value - sqrt(discriminant)) / (2 * a_Value)
            showSuccessMessage("The roots are \(x1) and \(x2).")
        }
    }
    
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        aTextField.text = ""
        bTextField.text = ""
        cTextField.text = ""
        resultLabel.text = ""
        showInfoMessage("Enter values for A, B, and C.")
    }
    
    func showErrorMessage(_ message: String) {
        messageLabel.text = message
        messageLabel.isHidden = false
        resultLabel.isHidden = true
    }
    
    func showSuccessMessage(_ message: String) {
        resultLabel.text = message
        resultLabel.isHidden = false
        messageLabel.isHidden = true
    }
    
    func showInfoMessage(_ message: String) {
        messageLabel.text = message
        messageLabel.isHidden = false
        resultLabel.isHidden = true
    }
    
    // Show and hide the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

