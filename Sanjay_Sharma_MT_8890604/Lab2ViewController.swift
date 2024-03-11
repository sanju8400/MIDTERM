//
//  Lab2ViewController.swift
//  Sanjay_Sharma_MT_8890604
//
//  Created by user238626 on 3/11/24.
//

import UIKit

class Lab2ViewController: UIViewController {
    
    @IBOutlet weak var labelValue: UILabel!
    
    var value: Int = 0
    var step2flag = false
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBAction func decreaseValue(_ sender: Any) {
        value -= (step2flag ? 2 : 1)
        updateLabel()
    }
    
    
    @IBAction func increaseValue(_ sender: Any) {
        value += (step2flag ? 2 : 1)
        updateLabel()
    }
    
    @IBAction func resetValue(_ sender: Any) {
        value = 0
        step2flag = false
        updateLabel()
    }
    
    @IBAction func toggleStep(_ sender: Any) {
        step2flag.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
    }
    
    private func setupLabel() {
        labelValue.layer.borderWidth = 1.0
        labelValue.layer.borderColor = UIColor.black.cgColor
        labelValue.layer.backgroundColor = UIColor.white.cgColor
        updateLabel()
    }
    
    private func updateLabel() {
        labelValue.text = String(value)
    }
}

