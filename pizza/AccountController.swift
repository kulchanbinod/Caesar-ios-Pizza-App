//
//  AccountController.swift
//  pizza
//
//  Created by bimal pariyar on 10/1/18.
//  Copyright © 2018 Binod Pariyar. All rights reserved.
//

import UIKit

class AccountController: UIViewController {
    
    
    @IBAction func logout(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
