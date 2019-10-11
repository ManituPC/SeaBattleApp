//
//  GameFieldViewController.swift
//  secondIOSApp
//
//  Created by denis.chicherin on 10/1/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

class GameFieldViewController: UIViewController {

    var uiViewSelf: GameFieldSelfView!
    var uiViewTarget: GameFieldTargetView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        uiViewSelf = GameFieldSelfView()
        uiViewTarget = GameFieldTargetView()
        
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        
        uiViewSelf.frame = CGRect(x: 20, y: 20, width: screenWidth - 40, height: screenHeight / 2 - 20)
        uiViewSelf.backgroundColor = .white
        uiViewTarget.frame = CGRect(x: 20, y: screenHeight / 2, width: screenWidth - 40, height: screenHeight / 2 - 20)
        uiViewTarget.backgroundColor = .white

        view.backgroundColor = .purple
        view.addSubview(uiViewSelf)
        view.addSubview(uiViewTarget)
    }
}
