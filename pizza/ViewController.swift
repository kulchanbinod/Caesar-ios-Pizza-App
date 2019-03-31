//
//  ViewController.swift
//  pizza
//
//  Created by bimal pariyar on 8/7/18.
//  Copyright © 2018 Binod Pariyar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var invalidLabel: UILabel!
    @IBOutlet weak var login: UIPizzaButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invalidLabel.isHidden = true
    }
    
    @IBAction func LoginBtn(_ sender: Any) {
        
        invalidLabel.isHidden = true
        
        if username.text == "" {
            invalidLabel.text = "Username is required"
            invalidLabel.isHidden = false
            return
        } else {
            if password.text == "" {
                invalidLabel.text = "Password is required"
                invalidLabel.isHidden = false
                return
            }
        }
        
        print("here");
        
        let parameters = ["id": 13, "name": "jack"] as [String : Any];
        
        //create the url with URL
        let url = URL(string: "http://10.0.2.2/api/index.php?action=login")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            print("binod");
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    
//                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "MapController") as! MapController
//                    self.present(newViewController, animated: true, completion: nil)
                    
                    // handle json...
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        
        task.resume()
    
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            print("username is selected")
        default:
            scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            password.becomeFirstResponder()
        } else if textField.tag == 1 {
            textField.resignFirstResponder()
        }
        return true
    }
}
