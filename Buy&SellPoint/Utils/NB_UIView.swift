//
//  PinViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 13/11/20.
//


import UIKit
extension UIView {
   
    func dropShadow() {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(hexString: "#87CEFA").cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1.5
        
        //self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
   // self.layer.shouldRasterize = true
        
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
    func makeRoundCorner(radius: CGFloat = 5){
        self.layer.cornerRadius = radius
        //self.clipsToBounds = true
    }
    //   func clipToBound(){
    //    self.clipsToBounds = true
    //}
    
    func drawBorder(borderWidth: CGFloat = 1, bordorColor: UIColor,clipToBound :Bool = true){
      
        self.layer.borderColor = bordorColor.cgColor
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = clipToBound
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
         self.endEditing(true)
    }
}
