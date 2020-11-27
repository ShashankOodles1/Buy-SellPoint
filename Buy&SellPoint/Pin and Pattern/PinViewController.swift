//
//  PinViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 13/11/20.
//

import UIKit

class PinViewController: UIViewController {
    var correctPassword:String = "1234567"
    var defaultPasword: String = ""

    
    @IBOutlet weak var enterLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var passcodeView: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn11: UIButton!
    @IBOutlet weak var btn12: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    var savepassword = [UIButton]()
    
    
    
    
    
    @IBAction func onPressButton(_ sender: UIButton){
        
        if sender.tag == 0 {
            defaultPasword += "0"
        }
        else if sender.tag == 1 {
            defaultPasword += "1"
        }
        else if sender.tag == 2 {
            defaultPasword += "2"
        }
        else if sender.tag == 3 {
            defaultPasword += "3"
        }
        else if sender.tag == 4 {
            defaultPasword += "4"
        }
        
        else if sender.tag == 5 {
            defaultPasword += "5"
        }
        
        else if sender.tag == 6 {
            defaultPasword += "6"
        }
        
        else if sender.tag == 7 {
            defaultPasword += "7"
        }
        
        
        else if sender.tag == 8 {
            defaultPasword += "8"
        }
        else if sender.tag ==  9 {
            defaultPasword += "2"
        }
        else if sender.tag == 12 {
            _ = defaultPasword.removeLast()
        }
        
        if defaultPasword.count == 0
        {
            btn12.isHidden = true
            view1.backgroundColor = UIColor.clear
            view2.backgroundColor = UIColor.clear
            view3.backgroundColor = UIColor.clear
            view4.backgroundColor = UIColor.clear
            view5.backgroundColor = UIColor.clear
            view6.backgroundColor = UIColor.clear
            view7.backgroundColor = UIColor.clear
        }
        else if defaultPasword.count == 1
        {
            btn12.isHidden = false
            view1.backgroundColor = UIColor.white
            view2.backgroundColor = UIColor.clear
            view3.backgroundColor = UIColor.clear
            view4.backgroundColor = UIColor.clear
            view5.backgroundColor = UIColor.clear
            view6.backgroundColor = UIColor.clear
            view7.backgroundColor = UIColor.clear        }
        else if defaultPasword.count == 2
        {
            btn12.isHidden = false
            view1.backgroundColor = UIColor.white
            view2.backgroundColor = UIColor.white
            view3.backgroundColor = UIColor.clear
            view4.backgroundColor = UIColor.clear
            view5.backgroundColor = UIColor.clear
            view6.backgroundColor = UIColor.clear
            view7.backgroundColor = UIColor.clear
            
            
        }
        else if defaultPasword.count == 3
        {
            btn12.isHidden = false
            view1.backgroundColor = UIColor.white
            view2.backgroundColor = UIColor.white
            view3.backgroundColor = UIColor.white
            view4.backgroundColor = UIColor.clear
            view5.backgroundColor = UIColor.clear
            view6.backgroundColor = UIColor.clear
            view7.backgroundColor = UIColor.clear
            
        }
        else if defaultPasword.count == 4
        {
            btn12.isHidden = false
            view1.backgroundColor = UIColor.white
            view2.backgroundColor = UIColor.white
            view3.backgroundColor = UIColor.white
            view4.backgroundColor = UIColor.white
            view5.backgroundColor = UIColor.clear
            view6.backgroundColor = UIColor.clear
            view7.backgroundColor = UIColor.clear
            
        }
        else if defaultPasword.count == 5
        {
            btn12.isHidden = false
            view1.backgroundColor = UIColor.white
            view2.backgroundColor = UIColor.white
            view3.backgroundColor = UIColor.white
            view4.backgroundColor = UIColor.white
            view5.backgroundColor = UIColor.white
            view6.backgroundColor = UIColor.clear
            view7.backgroundColor = UIColor.clear
            
        }
        else if defaultPasword.count == 6
        {
          //  btnBackspace.isHidden = false
            view1.backgroundColor = UIColor.white
            view2.backgroundColor = UIColor.white
            view3.backgroundColor = UIColor.white
            view4.backgroundColor = UIColor.white
            view5.backgroundColor = UIColor.white
            view6.backgroundColor = UIColor.white
            view7.backgroundColor = UIColor.clear
            
        }
        else if defaultPasword.count == 7
        {
            btn12.isHidden = false
            view1.backgroundColor = UIColor.white
            view2.backgroundColor = UIColor.white
            view3.backgroundColor = UIColor.white
            view4.backgroundColor = UIColor.white
            view5.backgroundColor = UIColor.white
            view6.backgroundColor = UIColor.white
            view7.backgroundColor = UIColor.white
            
        }
        
        if defaultPasword.count < 7 {
         //
        }
        else {
            
            if defaultPasword ==  correctPassword
            {
                resetValue()
                //self.alert(message: "correct pin", Title: "coorect Password")
                self.parent?.addChild(PinViewController.init())
            }
            else {
                   resetValue()
            }
        }
    }
    @IBAction func onclickOkBtn(_ sender: Any) {
    }
    func resetValue() {
            defaultPasword = ""
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                self.view1.backgroundColor = UIColor.clear
                self.view2.backgroundColor = UIColor.clear
                self.view3.backgroundColor = UIColor.clear
                self.view4.backgroundColor = UIColor.clear
                self.view5.backgroundColor = UIColor.clear
                self.view6.backgroundColor = UIColor.clear
                self.view7.backgroundColor = UIColor.clear
            }
        }
        
        func configureUI(){
            resetValue()
            view1.layer.cornerRadius = view1.frame.height / 2
            view2.layer.cornerRadius = view1.frame.height / 2
            view3.layer.cornerRadius = view1.frame.height / 2
            view4.layer.cornerRadius = view1.frame.height / 2
            view5.layer.cornerRadius = view1.frame.height / 2
            view6.layer.cornerRadius = view1.frame.height / 2
            view7.layer.cornerRadius = view1.frame.height / 2
            view1.drawBorder(borderWidth: 1, bordorColor: .white, clipToBound: true)
            view2.drawBorder(borderWidth: 1, bordorColor: .white, clipToBound: true)
            view3.drawBorder(borderWidth: 1, bordorColor: .white, clipToBound: true)
            view4.drawBorder(borderWidth: 1, bordorColor: .white, clipToBound: true)
            view5.drawBorder(borderWidth: 1, bordorColor: .white, clipToBound: true)
            view6.drawBorder(borderWidth: 1, bordorColor: .white, clipToBound: true)
            view7.drawBorder(borderWidth: 1, bordorColor: .white, clipToBound: true)
            //imgView.drawBorder(borderWidth: 1, bordorColor: .white, clipToBound: true)
            imgView.makeRoundCorner()
            btn1.dropShadow()
            
            
        }
    
    
    
}
    
public extension UIViewController {
    func alert (message:String ,Title:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
}
    
    
    
    
    
    
    


