//
//  WalkthroughViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 12/11/20.
//

import UIKit

class WalkthroughViewController: UIViewController {

    @IBOutlet weak var pageControlIndex: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  view.backgroundColor = UIColor(hexString: "#5B90F6")
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container" {
            let vc = segue.destination as!
            WalkthroughPageViewController
            vc.sendActionOnChangeIndex = { index in
                self.pageControlIndex.currentPage = index
                self.pageControlIndex.numberOfPages = 4
                
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

