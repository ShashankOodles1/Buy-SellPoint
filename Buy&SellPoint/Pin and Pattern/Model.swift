//
//  Model.swift
//  PatternLockingSystem
//
//  Created by Shashank Mishra on 11/10/20.
// Mark done by shashank

import UIKit
import CoreGraphics

// Mark:circle view to get input pattern
class Circle: UIView {
    
    
    var outerColor = UIColor.white {
        didSet { setNeedsDisplay() }
    }
    
    var innercolor = UIColor.white {
        didSet { setNeedsDisplay() }
    }
    
    var highlightColor = UIColor.darkGray{
        didSet { setNeedsDisplay() }
    }
    
    var lineWidth: CGFloat = 5 {
        didSet { setNeedsDisplay() }
    }
    //Mark : if user select circle then its comes with smaller circle
   
    var isSelected: Bool {
        didSet { setNeedsDisplay() }
    }
    
    override init(frame: CGRect) {
        self.isSelected = false
        super.init(frame: frame)
    }
    
    convenience init(radius: CGFloat) {
        let frame = CGRect(origin: .zero, size: CGSize(width: radius*2, height: radius*2))
        self.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        // mark :  Outermost circle
        let outerRect = CGRect(origin: CGPoint(x: rect.origin.x + lineWidth, y: rect.origin.y + lineWidth), size: CGSize(width: rect.size.width - 2*lineWidth, height: rect.height - 2*lineWidth))
        ctx?.setLineWidth(lineWidth)
        ctx?.setStrokeColor(outerColor.cgColor)
        ctx?.fillEllipse(in: outerRect)
        // Mark : Second circle
        let innerRect = outerRect.insetBy(dx: 1, dy: 1)
        ctx?.setFillColor(innercolor.cgColor)
        ctx?.fillEllipse(in: innerRect)
        // Mark : For selected circles, the third circle
        if isSelected {
            let highlightRect = outerRect.insetBy(dx: 10, dy: 10)
            ctx?.setFillColor(highlightColor.cgColor)
            ctx?.fillEllipse(in: highlightRect)
        }
    }
    
}

// Mark :line model for user to drag
struct Line {
    // Mark :selecting cell from indexes to selected indexes
    var fromPoint: CGPoint
    var toPoint: CGPoint
    var isFullLength: Bool
    // Mark intialise line variable
    init(fromPoint: CGPoint, toPoint: CGPoint, isFullLength: Bool) {
        self.fromPoint = fromPoint
        self.toPoint = toPoint
        self.isFullLength = isFullLength
    }
    
}

//Mark: this is for drawing nos of line to drag
class PatternView: UIView {
    var lines: [Line] {
        didSet { setNeedsDisplay() }
    }
    
    var lineWidth: CGFloat = 5 {
        didSet { setNeedsDisplay() }
    }
    
    var lineColor: UIColor = UIColor.gray{
        didSet { setNeedsDisplay() }
    }
    
    var linePointColor: UIColor = UIColor.white {
        didSet { setNeedsDisplay() }
    }
    
    override init(frame: CGRect) {
        lines = []
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Mark :Bubble ui design
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setLineWidth(lineWidth)
        ctx?.setStrokeColor(lineColor.cgColor)
        for line in lines {
            ctx?.move(to: line.fromPoint)
            ctx?.addLine(to: line.toPoint)
            ctx?.strokePath()
            let bubbleWidth = lineWidth
            let frontBubbleFrame = CGRect(origin: CGPoint(x: line.fromPoint.x - bubbleWidth, y: line.fromPoint.y - bubbleWidth), size: CGSize(width: bubbleWidth * 2, height: bubbleWidth * 2))
            ctx?.setFillColor(linePointColor.cgColor)
            ctx?.fillEllipse(in: frontBubbleFrame)
            
            if line.isFullLength {
                let backBubbleFrame = CGRect(origin: CGPoint(x: line.toPoint.x - bubbleWidth, y: line.toPoint.y - bubbleWidth), size: CGSize(width: bubbleWidth * 2, height: bubbleWidth * 2))
                ctx?.setFillColor(linePointColor.cgColor)
                ctx?.fillEllipse(in: backBubbleFrame)
            }
        }
    }
}

