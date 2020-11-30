//
//  RegistrationViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 29/11/20.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmailid: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirm: UITextField!
    let manager :PersonManager = PersonManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
           debugPrint(path[0])
    }
    
    @IBAction func onClickRegisterBtn(_ sender: Any) {
        
        var registrationModel =  Person()
        var errorString = ""
        
        if let text = txtFirstName.text{
            do{
                _ = try ValidationManager.validate(value: text, validationType: .name, required: true)
                registrationModel.firstname = text
            }catch{
                errorString.append("\u{2022} Please enter a vaild first name.\n")
            }
        
        if let text = txtLastName.text{
            do{
                _ = try ValidationManager.validate(value: text, validationType: .name, required: true)
                registrationModel.lastname = text
            }catch{
                errorString.append("\u{2022} Please enter a vaild last name.\n")
            }
        }
                if let text = txtEmailid.text{
                    do{
                        _ = try ValidationManager.validate(value: text, validationType: .email, required: true)
                        registrationModel.emailid = text
                    }catch{
                        errorString.append("\u{2022} Please enter a vaild first name.\n")
                    }
                
                
                }
                
                
        }
                
       // if let text = txtEmailid.text{
         //   do{
          //      _ = try ValidationManager.validate(value: text, validationType: .email, required: true)
           //     registrationModel.emailid = text
           // }catch{
            //    errorString.append("\u{2022} Please enter a vaild email.\n")
           // }
       // }
        
        if let text = txtPassword.text, let confirmPassword = txtConfirm.text{
            do{
                _ = try ValidationManager.validate(value: text, validationType: .password, required: true)
                 _ = try ValidationManager.validate(value: confirmPassword, validationType: .password, required: true)
                if text == confirmPassword{
                    registrationModel.password = text
                }else{
                    errorString.append("\u{2022} Please enter a vaild password.\n")
                }
                
            }catch{
                errorString.append("\u{2022} Please enter a vaild password.\n")
            }
        }
        
    
      
        if errorString != ""{
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.left
            
            let messageText = NSMutableAttributedString(
                string: errorString,
                attributes: [
                      NSAttributedString.Key.paragraphStyle: paragraphStyle,
                      NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body),
                    NSAttributedString.Key.foregroundColor: UIColor.black
                ]
            )
            
            let alertController = UIAlertController(title: "Buy&Sell", message: nil, preferredStyle: .alert)
             alertController.setValue(messageText, forKey: "attributedMessage")
            if #available(iOS 13.0, *) {
                                         alertController.overrideUserInterfaceStyle = .light
                                     }
            let alertAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(alertAction)
            //self.show(alertController, sender: nil)
            self.present(alertController, animated: true, completion: nil)
            return
            
            
            
            
            
            
           
            
            
            
        }
        
        let person = Person(firstname: txtFirstName.text, lastname: txtLastName.text, emailid: txtEmailid.text, password: txtPassword.text, confirmPassword: txtConfirm.text)
        manager.createPerson(person: person)
        
        
        let loginVc = self.storyboard?.instantiateViewController(identifier: "LoginViewController")as!LoginViewController
        self.navigationController?.pushViewController(loginVc, animated: true)

        
        
        
        
}
    
    }
    
  

