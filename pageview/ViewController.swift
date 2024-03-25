//
//  ViewController.swift
//  pageview
//
//  Created by apple on 8/18/23.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
   
    var mycontrollers  = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pages: [String] = [
            "karthiga 1.karthiga 1. karthiga 1. karthiga 1. karthiga 1. karthiga 1. karthiga 1. karthiga 1. karthiga 1. karthiga 1.  karthiga 1. karthiga 1.karthiga 1. karthiga 1. karthiga 1. karthiga 1.",
            "chapter 2. chapter 2. chapter 2. chapter 2. chapter 2. chapter 2. chapter 2.chapter 2.chapter 2.chapter 2.chapter 2.chapter 2.chapter 2.chapter 2.chapter 2.chapter 2.chapter 2.chapter 2.chapter 2.chapter 2.chapter 2.chapter 2. ",
            
            "kuhaan 3. kuhaan 3. kuhaan 3. kuhaan 3. kuhaan 3. kuhaan 3. kuhaan 3. kuhaan 3. kuhaan 3. kuhaan 3.  kuhaan 3. kuhaan 3.kuhaan 3.kuhaan 3. ",
            
            "karthiga 4. karthiga 4. karthiga 4. karthiga 4. karthiga 4. karthiga 4. karthiga 4. karthiga 4. karthiga 4. karthiga 4.karthiga 4.karthiga 4.karthiga 4. ",
            ]
        for text in pages{
            let vc = textViewController(with: text)
            mycontrollers.append(vc)
        }
        
//       let vc = UIViewController()
//        vc.view.backgroundColor = .green
//        mycontrollers.append(vc)
//
//        let vc1 = UIViewController()
//         vc1.view.backgroundColor = .blue
//         mycontrollers.append(vc1)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.presentpagevc()
        })
    }
    func presentpagevc(){
        guard let first = mycontrollers.first else {
            return
        }
        let vc = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        vc.dataSource = self
        vc.delegate = self
        
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        
        present(vc,animated: true)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = mycontrollers.firstIndex(of: viewController),index > 0 else {
            
      return nil
    }
        let before  = index - 1
        return mycontrollers[before]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = mycontrollers.firstIndex(of: viewController),index < (mycontrollers.count - 1) else {
            
      return nil
    }
        let after  = index + 1
        return mycontrollers[after]
        
    }
}

