//
//  WalkthroughNavigationViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 12/11/20.
//

import UIKit

class WalkthroughNavigationViewController: UINavigationController  {

    override func viewDidLoad() {
        super.viewDidLoad()
    //    UINavigationBar.appearance().barTintColor = UIColor.clear
    }
    class func controller()-> WalkthroughNavigationViewController {
           let vc = storyBoard.instantiateViewController(withIdentifier: "WalkthroughNavigationViewController") as! WalkthroughNavigationViewController
           return vc
           
       }
    
    


}
