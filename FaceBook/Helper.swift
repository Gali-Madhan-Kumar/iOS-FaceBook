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
    
}
