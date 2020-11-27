//
//  DemoPageViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 12/11/20.
//

import UIKit

class DemoPageViewController: WalkthroughScreenViewController{
    @IBOutlet weak var image3: UIImageView!
    class func controller()-> DemoPageViewController {
                let vc = storyBoard.instantiateViewController(identifier: "DemoPageViewController") as! DemoPageViewController
                return vc
            }
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.view.backgroundColor = UIColor(hexString: "#5B90F6")        // Do any additional setup after loading the view.
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
