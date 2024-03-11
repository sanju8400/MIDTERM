//
//  CanadaViewController.swift
//  Sanjay_Sharma_MT_8890604
//
//  Created by user238626 on 3/11/24.
//

import UIKit

class CanadaViewController: UIViewController , UITextFieldDelegate {
    
    let cityImages = ["winnipeg", "vancouver", "toronto", "montreal", "halifax", "calgary"]
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.delegate = self
    }
    
    // Lock orientation to portrait
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        // Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func findButtonTapped(_ sender: UIButton) {
        findMyCity()
    }
    
    func findMyCity() {
        guard let text = cityTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else {
            // If text field is empty, set image to default "Canada" and hide error message
            setImage(named: "Canada")
            errorMessage.isHidden = true
            return
        }
        
        let lowercaseText = text.lowercased()
        if cityImages.contains(lowercaseText) {
            setImage(named: lowercaseText)
            errorMessage.isHidden = true
        } else {
            // Display error message
            errorMessage.isHidden = false
            errorMessage.text = "City not found"
        }
    }
    
    // Set image to the image view
    func setImage(named imageName: String) {
        if let image = UIImage(named: imageName + ".jpeg") {
            imageView.image = image
        }
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
