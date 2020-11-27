//
//  DealingPageViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 12/11/20.
//

import UIKit

class DealingPageViewController: WalkthroughScreenViewController{
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var startedBtn: UIButton!
    class func controller()-> DealingPageViewController {
                let vc = storyBoard.instantiateViewController(identifier: "DealingPageViewController") as! DealingPageViewController
                return vc
            }
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(hexString: "#5B90F6")
        // Do any additional setup after loading the view.
        startedBtn.drawBorder(borderWidth: 1, bordorColor: .black, clipToBound: true)
    }
    
    @IBAction func onclickStart(_ sender: Any) {
        
       
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "UserChoiceViewController") as! UserChoiceViewController
        navigationController?.pushViewController(nextViewController, animated: true)
        
        
        }
        

        
        
        
    }
    
   


