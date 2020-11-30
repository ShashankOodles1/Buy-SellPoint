//
//  LoginViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 28/11/20.
//

import UIKit

class LoginViewController: UIViewController {
     private let manager = PersonManager()
    var  person : [Person]? = nil
    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    var emailvalue = ""
    var passstring = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
    }
    

    @IBAction func onLoginBtn(_ sender: Any) {
        
        var errorString = ""
           
           if let text = txtEmailId.text{
              do{
                   _ = try ValidationManager.validate(value: text, validationType:.email, required: true)
                   
               }catch{
                   errorString.append("\u{2022} Please enter a vaild email.\n")
               }
           }
           
           if let text = txtPassword.text {
               do{
                   _ = try ValidationManager.validate(value: text, validationType: .password, required: true)
                   
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
               
               let alertAction = UIAlertAction(title: "OK", style: .cancel)
               alertController.addAction(alertAction)
               
               self.present(alertController, animated: true, completion: nil)
               return
           }
                   let user  = manager.fetchPerso()
                   for val in user!{
                       if self.txtEmailId.text == val.emailid && self.txtPassword.text == val.password {
                              print(val)
                                let alert = UIAlertController(
                                      title: " Login Sucessfull",
                                        message: "Welcome",
                               preferredStyle: UIAlertController.Style.alert)
                    
                            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                               
                            }
                                  alert.addAction(OKAction)

                            present(alert, animated: true, completion: nil)
                          
                                return
                        }
                       
                       if self.txtEmailId.text == emailvalue   && self.txtPassword.text == passstring {
                       print(val)

                                      let alert = UIAlertController(
                            title: " Login Invalid",
                              message: "Please enter correct username and password",
                       preferredStyle: UIAlertController.Style.alert)

                       let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                              // do something when user press OK button, like deleting text in both fields or do nothing
                          }
                         alert.addAction(OKAction)

                       present(alert, animated: true, completion: nil)
                       return
                       }
           }
           
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    @IBAction func onsignUPBtn(_ sender: Any) {
        let signVC = self.storyboard?.instantiateViewController(identifier:
            "RegistrationViewController")as! RegistrationViewController
        self.navigationController?.pushViewController(signVC, animated: true)
    }
    
}
