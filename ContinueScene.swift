//
//  ContinueScene.swift
//  SoloMission
//
//  Created by Derek Harrison on 05/09/2026.
//

import Foundation
import SpriteKit


class ContinueScene: SKScene {
    
    let continueNotPressed = SKSpriteNode(imageNamed: Parameters.continueButtonNotPressed)
    let continuePressed = SKSpriteNode(imageNamed: Parameters.continueButtonPressed)
    let levelMenuNotPressed = SKSpriteNode(imageNamed: Parameters.levelMenuButtonNotPressed)
    let levelMenuPressed = SKSpriteNode(imageNamed: Parameters.levelMenuButtonPressed)
    
    var playerChoseToContinueGame = false
    var continueGame = false
    var gameLevelScene = false
    
    var levelMenuChosen = false
    var levelMenu = false
    var levelMenuScene = false
    
    override func didMove(to _: SKView) {
        let background = SKSpriteNode(imageNamed: backgroundStartScreenImage)
        
        let widthb = background.size.width
        let heightb = self.size.height/2
        
        background.size = CGSize(width: widthb, height: heightb)
        
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = 0
        background.removeFromParent()
        self.addChild(background)
        
        placeButton(fac: 0.6, buttonNotPressed: continueNotPressed, buttonPressed: continuePressed)
        placeButton(fac: 0.46, buttonNotPressed: levelMenuNotPressed, buttonPressed: levelMenuPressed)
    }
    
    //Force the mute button to change by running update()
    override func update(_ _: TimeInterval) {
   
        startScene(scene: self, start : &continueGame, gameLevel : GameLevel(size: self.size))
        startScene(scene: self, start : &levelMenu)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with _: UIEvent?) {
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            pressedButton(pointOfTouch: pointOfTouch, levelNotPressed : continueNotPressed, levelPressed : continuePressed, pressed : &continueGame)
            pressedButton(pointOfTouch: pointOfTouch, levelNotPressed : levelMenuNotPressed, levelPressed : levelMenuPressed, pressed : &levelMenu)
        }
    }
    
    override func touchesEnded(_ _: Set<UITouch>, with _: UIEvent?) {
        if playerChoseToContinueGame {
            continueGame = true
            gameLevelScene = true
        }
        if levelMenuChosen {
            levelMenu = true
            levelMenuScene = true
        }
    }
    
    private func placeButton(fac : CGFloat, buttonNotPressed : SKSpriteNode, buttonPressed : SKSpriteNode) {
        
        let widthButton = self.size.width / 4
        let heightButton = self.size.height / 16
        
        buttonNotPressed.size = CGSize(width: widthButton, height: heightButton)
        buttonNotPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
        buttonNotPressed.zPosition = 2
        buttonNotPressed.removeFromParent()
        self.addChild(buttonNotPressed)
        
        buttonPressed.size = CGSize(width: widthButton, height: heightButton)
        buttonPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
        buttonPressed.zPosition = -1
        buttonPressed.removeFromParent()
        self.addChild(buttonPressed)
    }
    
    private func pressedButton(pointOfTouch : CGPoint, levelNotPressed : SKSpriteNode, levelPressed : SKSpriteNode, pressed : inout Bool) {
        let inRangeX = pointOfTouch.x > levelNotPressed.position.x - levelNotPressed.size.width / 2 && pointOfTouch.x < levelNotPressed.position.x + levelNotPressed.size.width / 2
        
        let inRangeY = pointOfTouch.y > levelNotPressed.position.y - levelNotPressed.size.height / 2 && pointOfTouch.y < levelNotPressed.position.y + levelNotPressed.size.height / 2
        
        if inRangeX && inRangeY {
            levelNotPressed.zPosition = -1
            levelPressed.zPosition = 2
            pressed = true
        }
    }
}
