//
//  ConfirmViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 29/11/20.
//

import UIKit

class ConfirmViewController:PinViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        confrmvc()
        // Do any additional setup after loading the view.
    }
    
    func confrmvc(){
        if defaultPasword.count == 7 {
        SecondPassword = defaultPasword
            if SecondPassword == defaultPasword {
                let firstcv = self.storyboard?.instantiateViewController(identifier: "LoginViewController")as!
                LoginViewController
                self.navigationController?.pushViewController(firstcv, animated: true)
                print("jjj")
            }
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
