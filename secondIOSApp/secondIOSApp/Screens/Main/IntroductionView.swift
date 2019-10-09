//
//  IntroductionView.swift
//  secondIOSApp
//
//  Created by denis.chicherin on 10/3/19.
//  Copyright © 2019 LearnAppMaking. All rights reserved.
//

import UIKit

@IBDesignable
class IntroductionView: UIView {
    
    let gameField1 = GameField()
    let gameField2 = GameField()
    var squareID = 0
    
    override func draw(_ rect: CGRect) {
        let rect1 = CGRect(x: 0, y: 0, width: rect.width, height: rect.height / 2)
        let rect2 = CGRect(x: 0, y: rect.height / 2, width: rect.width, height: rect.height / 2)
                
        drawGameField(rect: rect1, gameField: gameField1)
        drawGameField(rect: rect2, gameField: gameField2)
        
        print("$$$$$$1 \(gameField1.fieldsList.count)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let position = touch.location(in: self)
        
        getSquare(position: position)
    }
    
    // draw Game filed
    private func drawGameField(rect: CGRect, gameField: GameField) {
        let outPadding: CGFloat = 20
        let squareWigth: CGFloat = (rect.height - outPadding * 2) / 10
        let x: CGFloat = rect.origin.x + (rect.width - squareWigth * 10) / 2
        let y: CGFloat = rect.origin.y + outPadding
        
        var color = UIColor.darkGray

        var row = gameField.size.height
        var column = gameField.size.wigth
        var square = GameField.Field(blockId: 1, coordinateBegin: (x, y))
        square.wigth = squareWigth
        
        while row > 0 {
            gameField.fieldsList.append(square)
            
            let pathRect = CGRect(x: square.coordinateBegin.x, y: square.coordinateBegin.y, width: squareWigth, height: squareWigth)
            let path = UIBezierPath(rect: pathRect)
            
            if square.blockId == squareID {
                color = UIColor.red
                color.setFill()
                path.fill()
            } else {
                color = UIColor.darkGray
                path.lineWidth = 1
                color.setStroke()
                path.stroke()
            }
            
            square.coordinateBegin.x += squareWigth
            square.blockId += 1
            column -= 1
            
            if column == 0 {
                square.coordinateBegin.x = rect.origin.x + (rect.width - squareWigth * 10) / 2
                square.coordinateBegin.y += squareWigth
                row -= 1
                column = gameField.size.wigth
            }
        }
    }
    
    private func getSquare(position: CGPoint) {
        for square in gameField1.fieldsList {
            if position.x > square.coordinateBegin.x && position.x < square.coordinateBegin.x + square.wigth {
                if position.y > square.coordinateBegin.y && position.y < square.coordinateBegin.y + square.wigth {
                    print("square id = \(square.blockId)")
                    squareID = square.blockId
                    gameField1.fieldsList.removeAll()
                    updateDrawing()
                }
            }
        }
    }
    
    func updateDrawing() {
        self.setNeedsDisplay()
    }
    
    
    // внизу то всё для учебы
    
    private func drawManyRectangle(rect: CGRect) {
        // Many rectangle
        let patternPadding: CGFloat = 20
        var x: CGFloat = patternPadding
        var y: CGFloat = patternPadding
         
        let color = UIColor.darkGray

        while y <= rect.height - 20 {
            let pathRect = CGRect(x: x, y: y, width: patternPadding, height: patternPadding)
            let path = UIBezierPath(rect: pathRect)
            path.lineWidth = 2
            color.setStroke()
            path.stroke()
             
            x += patternPadding
             
            if x > rect.width - 20 {
                x = patternPadding
                y += patternPadding
            }
        }
    }
    
    private func drawStar(rect: CGRect) {
        // One star
        let padding: CGFloat = 40
        let pathRect = CGRect(x: padding, y: padding, width: rect.width - padding * 2, height: rect.width - padding * 2)
        let path = self.startIn(rect: pathRect)
        UIColor.black.setFill()
        path.fill()
                
        // Many stars
        let patternPadding: CGFloat = 20
        let patternRadius: CGFloat = 20
        
        var x: CGFloat = patternPadding
        var y: CGFloat = patternPadding
        
        while y <= rect.height {
            let pathRect = CGRect(x: x, y: y, width: patternRadius, height: patternRadius)
        
            let path = self.startIn(rect: pathRect)
            UIColor.black.setFill()
            path.fill()
        
            x += patternRadius + patternPadding
        
            if x > rect.width {
                x = patternPadding
                y += patternRadius + patternPadding
            }
        }
    }
    
    private func startIn(rect: CGRect) -> UIBezierPath {
        let center = CGPoint(x: rect.origin.x + rect.width / 2, y: rect.origin.y + rect.height / 2)
        
        let pointsOnStar = 4
        
        var angle: CGFloat = CGFloat(CGFloat.pi / 2)
        let angleIncrement = CGFloat(Double.pi * 2.0 / Double(pointsOnStar))
        let radius: CGFloat = rect.width / 2
        let midRadius: CGFloat = 0.25 * radius
        
        var firstPoint = true
        
        let path = UIBezierPath()
        
        for _ in 1...pointsOnStar {
           let point = pointFrom(angle: angle, radius: midRadius, offset: center)
           let nextPoint = pointFrom(angle: angle + angleIncrement, radius: midRadius, offset: center)
           let midPoint = pointFrom(angle: angle + angleIncrement / 2.0, radius: radius, offset: center)
                    
           if firstPoint {
              firstPoint = false
              path.move(to: point)
           }
           path.addLine(to: midPoint)
           path.addLine(to: nextPoint)
           
           angle += angleIncrement
        }
        path.close()
        
        return path
    }
    
    private func pointFrom(angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
        let x = radius * cos(angle) + offset.x
        let y = radius * sin(angle) + offset.y
             
        return CGPoint(x: x, y: y)
    }
    
    private func drawCicular(in rect: CGRect) {
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = rect.width / 2 - 100
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 3 * CGFloat.pi / 2, clockwise: false)
        path.lineWidth = 4
        
        let color = UIColor.red
        color.setStroke()
        path.stroke()
    }
    
    private func drawLines(in rect: CGRect) {
        let path = UIBezierPath()
    
        let point1 = CGPoint(x: 0, y: rect.origin.y + rect.height / 2)
        let point2 = CGPoint(x: rect.width / 2, y: rect.origin.y)
        let point3 = CGPoint(x: rect.width, y: rect.origin.y + rect.height / 2)
        
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)

        path.lineWidth = 4
        
        let color = UIColor.blue
        color.setStroke()
        path.stroke()
    }
    
    private func drawManyRectangle(in rect: CGRect) {
        let pathRect3 = CGRect(x: 0, y: 0, width: rect.width, height: rect.height / 2)
        let path3 = UIBezierPath(roundedRect: pathRect3, cornerRadius: 0)
        path3.addClip()
        
        let pathRect1 = CGRect(x: 50, y: 50, width: rect.width - 100, height: rect.height - 100)
        let path1 = UIBezierPath(roundedRect: pathRect1, cornerRadius: 24)
        let color1 = UIColor.green
        color1.setFill()
        path1.fill()
        
        let pathRect2 = CGRect(x: 100, y: 100, width: rect.width - 200, height: rect.height - 200)
        let path2 = UIBezierPath(roundedRect: pathRect2, cornerRadius: 24)
        let color2 = UIColor.blue
        color2.setFill()
        path2.fill()
    }
    
    private func drawRectangle(in rect: CGRect) {
        // One rectangle
        let pathRect1 = CGRect(x: 50, y: 50, width: rect.width - 100, height: rect.height - 100)
        let path1 = UIBezierPath(rect: pathRect1)
        let color1 = UIColor.green
        path1.lineWidth = 2
        color1.setStroke()
        path1.stroke()
    }
}
