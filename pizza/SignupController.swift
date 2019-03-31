//
//  SignupController.swift
//  pizza
//
//  Created by bimal pariyar on 10/1/18.
//  Copyright © 2018 Binod Pariyar. All rights reserved.
//

import UIKit

class SignupController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true;
    }
}
