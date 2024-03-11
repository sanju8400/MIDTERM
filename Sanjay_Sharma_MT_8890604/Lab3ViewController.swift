//
//  Lab3ViewController.swift
//  Sanjay_Sharma_MT_8890604
//
//  Created by user238626 on 3/11/24.
//

import UIKit

class Lab3ViewController: UIViewController , UITextFieldDelegate {
   
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var countryNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldDelegates()
        configureSuccessLabel()
        showUserInformation()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        showAddButtonUserInformation()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        submitUserData()
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        clearForm()
    }
    
    private func setupTextFieldDelegates() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        countryNameTextField.delegate = self
        ageTextField.delegate = self
    }
    
    private func configureSuccessLabel() {
        successLabel.numberOfLines = 0
        successLabel.lineBreakMode = .byWordWrapping
    }
    
    func showUserInformation() {
        guard let firstName = firstNameTextField.text, !firstName.isEmpty,
              let lastName = lastNameTextField.text, !lastName.isEmpty,
              let country = countryNameTextField.text, !country.isEmpty,
              let age = ageTextField.text, !age.isEmpty else {
            return
        }
        
        let userInformation = """
                First Name: \(firstName)
                Last Name: \(lastName)
                Country: \(country)
                Age: \(age)
            """
        resultTextView.text = userInformation
    }
    
    func showAddButtonUserInformation() {
        guard let firstName = firstNameTextField.text, !firstName.isEmpty,
              let lastName = lastNameTextField.text, !lastName.isEmpty,
              let country = countryNameTextField.text, !country.isEmpty,
              let age = ageTextField.text, !age.isEmpty else {
            return
        }
        
        let fullName = "\(firstName) \(lastName)"
        
        let userInformation = """
                Full Name: \(fullName)
                Country: \(country)
                Age: \(age)
            """
        resultTextView.text = userInformation
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        showUserInformation()
    }
    
    func submitUserData() {
        if allInformationProvided() {
            successLabel.text = "Successfully submitted!\n"
            successLabel.text! += """
                First Name: \(firstNameTextField.text ?? "")
                Last Name: \(lastNameTextField.text ?? "")
                Country: \(countryNameTextField.text ?? "")
                Age: \(ageTextField.text ?? "")
            """
        } else {
            successLabel.text = "Complete the missing Info!"
        }
        successLabel.isHidden = false
    }
    
    func allInformationProvided() -> Bool {
        return !(firstNameTextField.text?.isEmpty ?? true) &&
        !(lastNameTextField.text?.isEmpty ?? true) &&
        !(countryNameTextField.text?.isEmpty ?? true) &&
        !(ageTextField.text?.isEmpty ?? true)
    }
    
    func clearForm() {
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        countryNameTextField.text = ""
        ageTextField.text = ""
        resultTextView.text = ""
        successLabel.isHidden = true
    }
}
