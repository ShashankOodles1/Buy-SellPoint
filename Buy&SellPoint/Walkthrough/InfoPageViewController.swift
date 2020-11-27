//
//  InfoPageViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 12/11/20.
//

import UIKit

class InfoPageViewController: WalkthroughScreenViewController {
    @IBOutlet weak var image2: UIImageView!
    class func controller()-> InfoPageViewController {
            let vc = storyBoard.instantiateViewController(identifier: "InfoPageViewController") as! InfoPageViewController
            return vc
        }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.view.backgroundColor = UIColor(hexString: "#5B90F6")
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
