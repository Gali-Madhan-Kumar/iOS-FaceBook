//
//  Helper.swift
//  FaceBook
//
//  Created by Madhan on 14/02/21.
//

import UIKit

class Helper {
    
    // checks the email is valid or not
    func isValid(email: String) -> Bool {
        // declaring the rule of the expression (chars to be used). Applying the rule to current state. Verifying the result (email = rule)
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: email)
        return result
    }
    
    // checks the name is valid or not
    func isValid(name: String) -> Bool {
        // declaring the rule of the expression (chars to be used). Applying the rule to current state. Verifying the result (name = rule)
        let regex = "[A-Za-z]{2,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: name)
        return result
    }
    
    // shwo alert message to the user
    func showAlert(title: String, message: String, in vc: UIViewController) {
        
        // creating alertController; creating button to the alertController; assigning button to alertController; presenting alert controller 
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        vc.present(alert, animated: true, completion: nil)
        
    }
    
}
