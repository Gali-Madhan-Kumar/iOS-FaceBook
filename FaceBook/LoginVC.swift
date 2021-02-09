//
//  LoginVC.swift
//  FaceBook
//
//  Created by Madhan on 09/02/21.
//

import UIKit

class LoginVC: UIViewController {

    // ui obj
    @IBOutlet weak var textFieldsView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var leftLineView: UIView!
    @IBOutlet weak var rightLineView: UIView!
    @IBOutlet weak var registerButton: UIButton!
    
    // executed when the scene is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // executed after aligning the objects
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // calling configure functions to be executed, as they're already declared
        configure_textFieldsView()
        configure_loginBtn()
        configure_orLabel()
        configure_registerBtn()
        
    }
    
    func configure_textFieldsView() {
        
        // declaring constants to store information which later on assigned to certain 'object'
        let width = CGFloat(2)
        let color = UIColor.systemGroupedBackground.cgColor
        
        // creating layer to be a border of the view
        let border = CALayer()
        border.borderColor = color
        border.frame = CGRect(x: 0, y: 0, width: textFieldsView.frame.width, height: textFieldsView.frame.height)
        border.borderWidth = width
        
        // creating layer to be a line in the center of the view
        let line = CALayer()
        line.borderWidth = width
        line.borderColor = color
        line.frame = CGRect(x: 0, y: textFieldsView.frame.height / 2 - width, width: textFieldsView.frame.width, height: width)
        //assigning the created layers to the view
        textFieldsView.layer.addSublayer(border)
        textFieldsView.layer.addSublayer(line)
        
        // rounded corners
        textFieldsView.layer.cornerRadius = 5
        textFieldsView.layer.masksToBounds = true
    }
    
    // will configure Login button's appearance
    func configure_loginBtn() {
        
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        loginButton.isEnabled = false
        
    }
    
    // will configure appearance of OR label and its views storing the lines
    func configure_orLabel() {
        
        // shortcuts
        let width = CGFloat(2)
        let color = UIColor.systemGray3.cgColor
        
        // create left line object (layer) by assigning width and color values (constants)
        let leftLine = CALayer()
        leftLine.borderWidth = width
        leftLine.borderColor = color
        leftLine.frame = CGRect(x: 0, y: leftLineView.frame.height / 2 - width, width: leftLineView.frame.width, height: width)
        
        // create right line object (layer) by assigning width and color values declared above (for shorter way)
        let rightLine = CALayer()
        rightLine.borderWidth = width
        rightLine.borderColor = color
        rightLine.frame = CGRect(x: 0, y: rightLineView.frame.height / 2 - width, width: rightLineView.frame.width, height: width)
        
        // assign lines (layer objects) to the UI obj (views)
        leftLineView.layer.addSublayer(leftLine)
        rightLineView.layer.addSublayer(rightLine)
        
    }
    
    // will configure appearance of the register button
    func configure_registerBtn() {
        
        // creating constant named 'border' of type layer which acts as a border frame
        let border = CALayer()
        border.borderColor = UIColor(red: 68/255, green: 105/255, blue: 176/255, alpha: 1).cgColor
        border.borderWidth = 2
        border.frame = CGRect(x: 0, y: 0, width: registerButton.frame.width, height: registerButton.frame.height)
        
        // assign border to the obj (button)
        registerButton.layer.addSublayer(border)
        
        // rounded corners
        registerButton.layer.cornerRadius = 5
        registerButton.layer.masksToBounds = true
        
    }
    
}
