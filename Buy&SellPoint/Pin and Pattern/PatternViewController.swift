//
//  PatternViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 13/11/20.
//

import UIKit

class PatternViewController: UIViewController {

    var lockScreenView: GridScreen!
    var label : UILabel?
    var letOrder = [0,1,2,4,6,7,8]
    private var columnsize :Int = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK : adding label above lock screen
        label = UILabel(frame: CGRect(x: 120, y: 120, width: 300, height: 50))
        label?.text = "Draw Your Security Pattern"
        label!.textColor = UIColor.black
        label!.font = UIFont.systemFont(ofSize: 16.0)
        self.view.addSubview(label!)
      //  view.backgroundColor = UIColor(hexString:"#5B90F6")
        updateLockScreen(withSize: columnsize)
    }
    func updateLockScreen(withSize size: Int) {
        title = "Home Screen"
        if let viewing  = lockScreenView {viewing.removeFromSuperview() }
        let lockFrame = CGRect(origin: CGPoint(x: 0, y: label!.frame.maxY + 20), size: CGSize(width: view.frame.width, height: view.frame.width))
        var config = GridScreen.Config()
        // hexString comes from extension file
        config.lineColor = UIColor(hexString:"#D3D3D3")
        lockScreenView = GridScreen(frame: lockFrame, size: size, config: config) { [weak self] (pattern, order) in
            print(order.description)
            print(pattern)
          
            
        }
        view.addSubview(lockScreenView)
    }
}

