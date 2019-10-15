//
//  IntroductionView.swift
//  secondIOSApp
//
//  Created by denis.chicherin on 10/3/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

@IBDesignable
class GameFieldSelfView: BaseView {
    
    override func draw(_ rect: CGRect) {
        drawGameField(rect: rect)
    }
    
    
    func addBoats() -> [Boat] {
        var boatsList = [Boat]()
        
        for boatType in gameController.boatType {
            var boat = Boat()
            
            boat.size = boatType.key
            print("boat size is \(boat.size)")
            
            for var i in 1...boatType.value {
                boatsList.append(boat)
                print("number for boat size \(boat.size) is \(i)")
                i += 1
            }
        }
        
        return boatsList
    }
}
