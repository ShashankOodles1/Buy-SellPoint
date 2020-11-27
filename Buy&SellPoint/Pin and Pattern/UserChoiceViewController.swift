//
//  UserChoiceViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 13/11/20.
//

import UIKit

class UserChoiceViewController: UIViewController {

    @IBOutlet weak var optionLabel: UILabel!
    
    
    @IBOutlet weak var pinBtn: UIButton!
    
    @IBOutlet weak var patternBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#87CEFA")
        pinBtn.drawBorder(borderWidth: 1, bordorColor: .white, clipToBound: true)
        patternBtn.drawBorder(borderWidth: 1, bordorColor: .white, clipToBound: true)
        
    }
    

    @IBAction func ontouchpin(_ sender: Any) {
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PinViewController") as! PinViewController
        navigationController?.pushViewController(nextViewController, animated: true)
        
        
    }
    
    @IBAction func ontouchpattern(_ sender: Any) {
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PatternViewController") as! PatternViewController
        navigationController?.pushViewController(nextViewController, animated: true)
}
    
    
    
}
