//
//  GridScreen.swift
//  PatternLockingSystem
//
//  Created by Shashank Mishra on 11/10/20.
// Mark done by shashank

import UIKit
public class GridScreen : UIView {
//Mark: private variable for calculate and giving option on seclecting cell
private let value1  = 13
private let value2 =  14
private let value3 = 15
private let value4  = 16
private var selectedCircle: Circle?
private var patternView: PatternView!
private var oldCellIndex: Int = -1
private var currentCellIndex: Int = -1
private var drawnLines: [Int] = []
private var finalLines: [Line] = []
private var cellsInOrder: [Int] = []
private var allowClosedPattern: Bool = true
    
// Mark : Selcting number of circle
private var size: Int = 3
// Mark : it gives cell to each row and cell
private var numberOfCircles: Int {
    return size*size
}
    // mark: configure cell design
    public struct Config {
        public var lineWidth: CGFloat = 5
        public var lineColor: UIColor = UIColor.black
        public var lineEdgeColor: UIColor = UIColor.black
        public var circleOuterRingColor: UIColor = UIColor.gray
        public var circleInnerRingColor: UIColor = UIColor.white
        public var circleHighlightColor: UIColor = UIColor(hexString: "#C0C0C0")
        
        // Mark: Public Initializer for Config
        public init() {}
    }
    public var config: Config = Config()
    
    public required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public typealias PatternHandlerBlock = ((Double,[Int]) -> Void)
    var patternHandler: PatternHandlerBlock?
    
    // Mark: intialise/constructor for lock screen
    public convenience init(frame: CGRect, size: Int = 3, allowClosedPattern: Bool = true, config: Config = Config(), handler: PatternHandlerBlock? = nil) {
        self.init(frame: frame)
        self.size = size
        self.allowClosedPattern = allowClosedPattern
        self.config = config
        self.patternHandler = handler
        setNeedsDisplay()
        setupScreen()
        setupGestures()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //Mark : main gridscreen setting
    func setupScreen() {
        let grid = Double(min(frame.width, frame.height))/Double(2*size+1)
        let gap = grid
        let topOffset = grid
        let radius = grid/2
       //circle UI using for in  loop
        for index in 0..<numberOfCircles {
            let circle = Circle(radius: CGFloat(radius))
            circle.outerColor = config.circleOuterRingColor
            circle.innercolor = config.circleInnerRingColor
            circle.highlightColor = config.circleHighlightColor
            circle.lineWidth = config.lineWidth
            //making row and column accroding to cell
            let row = index/size
            let col = index % size
            let x = (gap + radius) + (gap + 2*radius)*Double(col)
            let y = (Double(row) * gap + Double(row) * 2.0 * radius) + topOffset
            circle.center = CGPoint(x: x, y: y)
            circle.tag = (row+value1)*value4 + (col + value1)
            addSubview(circle)
        }
        patternView = PatternView(frame: CGRect(origin: .zero, size: frame.size))
        patternView.lineWidth = config.lineWidth
        patternView.lineColor = config.lineColor
        patternView.linePointColor = config.lineEdgeColor
        
        patternView?.isUserInteractionEnabled = false
        addSubview(patternView)
    }
    //Mark: touch gesturing
    func setupGestures() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(gestured))
        let tap = UITapGestureRecognizer(target: self, action: #selector(gestured))
        addGestureRecognizer(pan)
        addGestureRecognizer(tap)
    }
    
     @objc func gestured(gesture: UIGestureRecognizer) {
        let point = gesture.location(in: self)
        if gesture is UIPanGestureRecognizer {
            if gesture.state == .ended {
                if finalLines.count > 0 { endPattern() }
                else { resetScreen() }
            } else {
                handlePan(at: point)
            }
        } else {
            let cellPosition = index(point)
            oldCellIndex = currentCellIndex
            if cellPosition >= 0 {
                cellsInOrder.append(currentCellIndex)
                perform(#selector(endPattern), with: nil, afterDelay: 0.3)
            }
        }
    }
    
    //Mark: once  ending pattern selection done...
    
    @objc func endPattern() {
        patternHandler?(uniqueIdOfCurrentPattern,cellsInOrder)
        resetScreen()
    }
    
    func cell(at index: Int) -> Circle? {
        guard index >= 0 && index < numberOfCircles else { return nil }
        return viewWithTag((index/size+value1)*value4+index % size + value1) as? Circle
    }
    
    func index(of circle: Circle) -> Int {
        return (circle.tag/value4 - value1)*size + (circle.tag % value4 - value1)
    }
    
    func index(_ point: CGPoint) -> Int {
        for view in self.subviews {
            if let circle = view as? Circle, circle.frame.contains(point) {
                if circle.isSelected == false {
                    circle.isSelected = true
                    currentCellIndex = index(of: circle)
                    selectedCircle = circle
                } else if circle.isSelected == true && allowClosedPattern == true {
                    currentCellIndex = index(of: circle)
                    selectedCircle = circle
                }
                
                let row = circle.tag/value4 - value1
                let col = circle.tag % value4 - value1
                return row * size + col
            }
        }
        return -1
    }
    // Mark: draging value of line on cell indexing
    func handlePan(at point: CGPoint) {
        oldCellIndex = currentCellIndex
        //new value after selecting index
        let cellPos = index(point)
        if cellPos >= 0 && cellPos != oldCellIndex && allowClosedPattern == true  {
            
            cellsInOrder.append(currentCellIndex)
            
        }else if cellPos >= 0 && cellPos != oldCellIndex && allowClosedPattern == false && cellsInOrder.count < size*size{
            
            cellsInOrder.append(currentCellIndex)

        }
        //Mark:selection cell printing value
        print(finalLines)
        if cellPos < 0 && oldCellIndex < 0 {
            return
        } else if cellPos < 0, let circle = cell(at: oldCellIndex) {
            let line = Line(fromPoint: circle.center, toPoint: point, isFullLength: false)
            patternView.lines = []
            patternView.lines.append(contentsOf: finalLines)
            patternView.lines.append(line)
            patternView.setNeedsDisplay()
        } else if cellPos >= 0 && currentCellIndex == oldCellIndex {
            return
        } else if cellPos >= 0 && oldCellIndex == -1 {
            return
        } else if cellPos >= 0 && oldCellIndex != currentCellIndex {
            let uniqueId = uniqueLineIdJoining(cellA: oldCellIndex, cellB: currentCellIndex)
            if drawnLines.firstIndex(of: uniqueId) == nil, let circle = cell(at: oldCellIndex), let selected = selectedCircle {
                let line = Line(fromPoint: circle.center, toPoint: selected.center, isFullLength: true)
                finalLines.append(line)
                patternView.lines = []
                patternView.lines.append(contentsOf: finalLines)
                drawnLines.append(uniqueId)
            }
        } else {
            return
        }
        
    }
    // Mark:for joining line
    func uniqueLineIdJoining(cellA: Int, cellB: Int) -> Int {
        return abs(cellA+cellB)*value2 + abs(cellA-cellB)*value3
    }
    // calculating current position
    var uniqueIdOfCurrentPattern: Double {
        var finalNum = 0.0
        for index in 0..<cellsInOrder.count {
            let base = cellsInOrder[index] + 1
            let length = cellsInOrder.count - index - 1
            let thisNum = Double(base) * pow(10, Double(length))
            finalNum = finalNum + thisNum
        }
        return finalNum
    }
    //Mark : after draging done by user resetting the screen
    func resetScreen() {
        for view in self.subviews {
            if let circle = view as? Circle { circle.isSelected = false }
        }
        finalLines = []
        drawnLines = []
        cellsInOrder = []
        patternView.lines = []
        oldCellIndex = -1
        currentCellIndex = -1
        selectedCircle = nil
    }
    
}
