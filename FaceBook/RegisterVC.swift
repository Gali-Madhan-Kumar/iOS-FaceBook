//
//  RegisterVC.swift
//  FaceBook
//
//  Created by Madhan on 12/02/21.
//

import UIKit

class RegisterVC: UIViewController {
    
    // constraints obj
    @IBOutlet weak var contentView_width: NSLayoutConstraint!
    @IBOutlet weak var emailView_width: NSLayoutConstraint!
    @IBOutlet weak var nameView_width: NSLayoutConstraint!
    @IBOutlet weak var passwordView_width: NSLayoutConstraint!
    @IBOutlet weak var birthdayView_width: NSLayoutConstraint!
    @IBOutlet weak var genderView_width: NSLayoutConstraint!
    
    // ui obj
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    
    @IBOutlet weak var emailContinueButton: UIButton!
    @IBOutlet weak var fullnameContinueButton: UIButton!
    @IBOutlet weak var passwordContinueButton: UIButton!
    @IBOutlet weak var birthdayContinueButton: UIButton!
    
    @IBOutlet weak var femaleGenderButton: UIButton!
    @IBOutlet weak var maleGenderButton: UIButton!
    
    @IBOutlet weak var footerView: UIView!
    
    // code obj
    var datePicker: UIDatePicker!
    
    
    // first load func when the page is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adjust the widht of the views to the screen of the device
        contentView_width.constant = self.view.frame.width * 5
        
        emailView_width.constant = self.view.frame.width
        nameView_width.constant = self.view.frame.width
        passwordView_width.constant = self.view.frame.width
        birthdayView_width.constant = self.view.frame.width
        genderView_width.constant = self.view.frame.width
        
        // make corners of the objects rounded
        cornerRadius(for: emailTextField)
        cornerRadius(for: firstNameTextField)
        cornerRadius(for: lastNameTextField)
        cornerRadius(for: passwordTextField)
        cornerRadius(for: birthdayTextField)
        
        cornerRadius(for: emailContinueButton)
        cornerRadius(for: fullnameContinueButton)
        cornerRadius(for: passwordContinueButton)
        cornerRadius(for: birthdayContinueButton)
        
        // applyig padding for the textFields
        padding(for: emailTextField)
        padding(for: firstNameTextField)
        padding(for: lastNameTextField)
        padding(for: passwordTextField)
        padding(for: birthdayTextField)
        
        // run function of configuration
        configure_footerView()
        
        // creating, configuring and implementing datePicker into Birthday TextField
        datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
        datePicker.addTarget(self, action: #selector(datePickerDidChange(_:)), for: .valueChanged)
        birthdayTextField.inputView = datePicker
        
    }
    
    // executed once the Auto-Layout has been applied / executed
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // run all the functions asyncronously / parallelly once the main tasks are completed
        DispatchQueue.main.async {
            // function to configure the appearance of the gender buttons
            self.configure_button(gender: self.maleGenderButton)
            self.configure_button(gender: self.femaleGenderButton)
        }
    }
    
    func configure_footerView() {
        let topLine = CALayer()
        topLine.borderWidth = 1
        topLine.borderColor = UIColor.systemGray.cgColor
        topLine.frame = CGRect(x: 0, y: 15, width: self.view.frame.width, height: 1)
        footerView.layer.addSublayer(topLine)
    }
    
    // configuring the appearance of the gender buttons
    func configure_button(gender button: UIButton) {
        
        // creating constant with name border which is of type CALayer (it execute functions of CALayer Class)
        let border = CALayer()
        border.borderWidth = 1.5
        border.borderColor = UIColor.systemGray.cgColor
        border.frame = CGRect(x: 0, y: 0, width: button.frame.width, height: button.frame.height)
        
        // assign the layer created to the button
        button.layer.addSublayer(border)
        
        // making buttons rounded
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
    }
    
    
    // add blank view to the left side of the textField (it'll act as a blank gap)
    func padding(for textField: UITextField) {
        let blankView = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = blankView
        textField.leftViewMode = .always
    }
    
    // make corners rounded for any views (objects)
    func cornerRadius(for view: UIView) {
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
    }
    
    // called everytime when textfield gets changed
    @IBAction func textFieldDidChange(_ textField: UITextField) {
        
        // declaring constant (shortcut) to the Helper Class
        let helper = Helper()
        
        // logic for Email TextField
        if textField == emailTextField {
            // check email validation
            if helper.isValid(email: emailTextField.text!) {
                emailContinueButton.isHidden = false
            }
            // logic for First Name or Last Name TextFields
        } else if textField == firstNameTextField || textField == lastNameTextField {
            // check fullname validation
            if helper.isValid(name: firstNameTextField.text!) && helper.isValid(name: lastNameTextField.text!) {
                fullnameContinueButton.isHidden = false
            }
            // logic for Password TextField
        } else if textField == passwordTextField {
            // check password validation
            if passwordTextField.text!.count >= 6 {
                passwordContinueButton.isHidden = false
            }
        }
        
    }
    
    // fuction will be executed whenever any date is selected
    @objc func datePickerDidChange(_ datePicker: UIDatePicker) {
        
        // declaring the format to be used in textField while presenting the date
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        birthdayTextField.text = formatter.string(from: datePicker.date)
        
        // decalring the format of date, then to place a dummy date into this format
        let compareDateFormatter = DateFormatter()
        compareDateFormatter.dateFormat = "YYYY/MM/DD HH:MM"
        
        let compareDate = compareDateFormatter.date(from: "2013/01/01 00:01")
        
        // IF logic. If user is older than 5 years, then show the continue button
        if datePicker.date < compareDate! {
            birthdayContinueButton.isHidden = false
        } else {
            birthdayContinueButton.isHidden = true
        }
        
    }
    
    
    // called once the Continue button is pressed on Email Page
    @IBAction func emailContinueButton_clicked(_ sender: Any) {
        
        // move scrollView horizontally (by X to the WIDTH as a pointer)
        let position = CGPoint(x: self.view.frame.width, y: 0)
        scrollView.setContentOffset(position, animated: true)
        
        // show keyboard of next textField
        if firstNameTextField.text!.isEmpty {
            firstNameTextField.becomeFirstResponder()
        } else if lastNameTextField.text!.isEmpty {
            lastNameTextField.becomeFirstResponder()
        } else if firstNameTextField.text?.isEmpty == false && lastNameTextField.text?.isEmpty == false {
            firstNameTextField.resignFirstResponder()
            lastNameTextField.resignFirstResponder()
        }
        
    }
    
    // called once the Continue button is pressed on Fullname Page
    @IBAction func fullnameContinueButton_clicked(_ sender: Any) {
        
        // move scrollView horizontally (by X to the 2x WIDTH as a pointer)
        let position = CGPoint(x: self.view.frame.width * 2, y: 0)
        scrollView.setContentOffset(position, animated: true)
        
        if passwordTextField.text!.isEmpty {
            passwordTextField.becomeFirstResponder()
        } else if passwordTextField.text!.isEmpty == false {
            passwordTextField.resignFirstResponder()
        }
        
    }
    
    // called once the Continue button is pressed on Password Page
    @IBAction func passwordContinueButton_clicked(_ sender: Any) {
        
        // move scrollView horizontally (by X to the 3x WIDTH as a pointer)
        let position = CGPoint(x: self.view.frame.width * 3, y: 0)
        scrollView.setContentOffset(position, animated: true)
        
        if birthdayTextField.text!.isEmpty {
            birthdayTextField.becomeFirstResponder()
        } else if birthdayTextField.text!.isEmpty == false {
            birthdayTextField.resignFirstResponder()
        }
        
    }
    
    // called once the Continue button is pressed on Birthday Page
    @IBAction func birthdayContinueButton_clicked(_ sender: Any) {
        
        // move scrollView horizontally (by X to the 4x WIDTH as a pointer)
        let position = CGPoint(x: self.view.frame.width * 4, y: 0)
        scrollView.setContentOffset(position, animated: true)
        
        // hides the keyboard when the continune the button is clicked in the birthday page
        birthdayTextField.resignFirstResponder()
        
    }
    

    // executed once any CANCEL (DISMISSING) button has been pressed
    @IBAction func cancelButton_clicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
