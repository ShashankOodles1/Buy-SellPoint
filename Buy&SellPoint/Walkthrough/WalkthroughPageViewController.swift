//
//  WalkthroughPageViewController.swift
//  Buy&SellPoint
//
//  Created by Shashank Mishra on 12/11/20.
//

import UIKit
class WalkthroughPageViewController: UIPageViewController{
    var walkthroughVC = [WalkthroughScreenViewController]()
    var sendActionOnChangeIndex:((_ index:Int)-> Void)?
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        walkthroughVC.append(IntroPageViewController.controller())
        walkthroughVC.append(InfoPageViewController.controller())
        walkthroughVC.append(DemoPageViewController.controller())
        walkthroughVC.append(DealingPageViewController.controller())
        setViewControllers([walkthroughVC[0] ], direction: .forward, animated: true, completion: nil)
        self.sendActionOnChangeIndex?(0)
    }
    
   required init?(coder: NSCoder) {
         
           super.init(transitionStyle : .scroll, navigationOrientation: .horizontal, options: nil)
      }
    
}
extension WalkthroughPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        walkthroughVC.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        
        guard let viewControllerIndex = walkthroughVC.firstIndex(of: viewController as! WalkthroughScreenViewController ) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard walkthroughVC.count > previousIndex else {
            return nil
        }
        
        return walkthroughVC[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = walkthroughVC.firstIndex(of: viewController as! WalkthroughScreenViewController ) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let walkthrouhVCCount = walkthroughVC.count
        
        
        guard walkthrouhVCCount != nextIndex else {
            return nil
        }
        
        guard walkthrouhVCCount > nextIndex else {
            return nil
        }
        
        return walkthroughVC[nextIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        
        
        self.sendActionOnChangeIndex?( walkthroughVC.firstIndex(of: pageContentViewController as! WalkthroughScreenViewController)!)
    }
    
    
}
