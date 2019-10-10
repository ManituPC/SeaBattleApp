//
//  ViewController.swift
//  secondIOSApp
//
//  Created by denis.chicherin on 9/29/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var uiViewSelf = GameFieldSelf()
    var uiViewTarget = GameFieldTarget()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        
        uiViewSelf.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight / 2)
        uiViewTarget.frame = CGRect(x: 0, y: screenHeight / 2, width: screenWidth, height: screenHeight / 2)
        
        view.backgroundColor = .white
        view.addSubview(uiViewSelf)
        view.addSubview(uiViewTarget)
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(click))
//        uiView.addGestureRecognizer(tap)
        
        //self.navigationItem.title = "String"
        
    }

    
//    @objc func click() {
//        print("11111")
//    }
}

