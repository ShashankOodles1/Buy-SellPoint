//
//  IntroPageViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 12/11/20.
//

import UIKit

class IntroPageViewController: WalkthroughScreenViewController {
    @IBOutlet weak var image1: UIImageView!
    class func controller()-> IntroPageViewController {
        let vc = storyBoard.instantiateViewController(identifier: "IntroPageViewController") as! IntroPageViewController
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.navigationController?.setNavigationBarHidden(false, animated: false)
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
