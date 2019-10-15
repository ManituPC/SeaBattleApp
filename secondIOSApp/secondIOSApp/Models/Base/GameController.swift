//
//  GameController.swift
//  secondIOSApp
//
//  Created by denis.chicherin on 10/11/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import Foundation


class GameController {
    // dictionary [boatSize: boatCount]
    let boatType = [1: 4, 2: 3, 3: 2, 4: 1]
    
    
    func getRandomSquare(gameField: GameField) -> Int {
        var number = Int.random(in: 0 ..< (gameField.size.height * gameField.size.wigth))
        while !gameField.fieldsList[number].isEmpty {
            number = Int.random(in: 0 ..< (gameField.size.height * gameField.size.wigth))
        }
        return number
    }
}
