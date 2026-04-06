//
//  PlayerScene.swift
//  SoloMission
//
//  Created by Derek Harrison on 30/12/2024.
//

import Foundation
import SpriteKit

class PlayerScene: SKScene {
    
    let continueNotPressed = SKSpriteNode(imageNamed: Parameters.continueButtonNotPressed)
    let continuePressed = SKSpriteNode(imageNamed: Parameters.continueButtonPressed)
    let startMenuNotPressed = SKSpriteNode(imageNamed: Parameters.startMenuButtonNotPressed)
    let startMenuPressed = SKSpriteNode(imageNamed: Parameters.startMenuButtonPressed)
    
    let guapoImage = SKSpriteNode(imageNamed: guapoPlayerImage)
    let tuttiImage = SKSpriteNode(imageNamed: tuttiPlayerImage)

    let guapoButtonNotPressed = SKSpriteNode(imageNamed: Parameters.guapoButtonNotPressed)
    let guapoButtonPressed = SKSpriteNode(imageNamed: Parameters.guapoButtonPressed)
    let tuttiButtonNotPressed = SKSpriteNode(imageNamed: Parameters.tuttiButtonNotPressed)
    let tuttiButtonPressed = SKSpriteNode(imageNamed: Parameters.tuttiButtonPressed)
    
    var startMenuChosen = false
    var startMenu = false
    var startMenuScene = false
    
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
        
        placeImage(fac: 0.8, button: guapoImage)
        placeImage(fac: 0.66, button: tuttiImage)
        
        placeButton(fac: 0.8, buttonNotPressed: guapoButtonNotPressed, buttonPressed: guapoButtonPressed, width: self.size.width / 5, height: self.size.height / 16)
        placeButton(fac: 0.66, buttonNotPressed: tuttiButtonNotPressed, buttonPressed: tuttiButtonPressed, width: self.size.width / 5, height: self.size.height / 16)
        placeButton(fac: 0.3, buttonNotPressed: continueNotPressed, buttonPressed: continuePressed, width: self.size.width / 4, height: self.size.height / 16)
        placeButton(fac: 0.16, buttonNotPressed: startMenuNotPressed, buttonPressed: startMenuPressed, width: self.size.width / 4, height: self.size.height / 16)
    }
    
    //Force the mute button to change by running update()
    override func update(_ _: TimeInterval) {
        startScene(scene: self, start : &startMenu, gameLevel : StartMenu(size: self.size))
        startScene(scene: self, start : &levelMenu, gameLevel : MainMenuScene(size: self.size))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with _: UIEvent?) {
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            
            var dummy1 = false
            var dummy2 = false
            
            pressButton(pointOfTouch: pointOfTouch, buttonNotPressed : startMenuNotPressed, buttonPressed : startMenuPressed, touched : &startMenu)
            pressButton(pointOfTouch: pointOfTouch, buttonNotPressed : continueNotPressed, buttonPressed : continuePressed, touched : &levelMenu)
            pressCharacterMenu(pointOfTouch: pointOfTouch, buttonNotPressed : guapoButtonNotPressed, buttonPressed : guapoButtonPressed, touched : &dummy1)
            pressCharacterMenu(pointOfTouch: pointOfTouch, buttonNotPressed : tuttiButtonNotPressed, buttonPressed : tuttiButtonPressed, touched : &dummy2)
            
            if dummy1 {
                let defaults = UserDefaults()
                defaults.set(0, forKey: "player_id")
            }
            if dummy2 {
                let defaults = UserDefaults()
                defaults.set(1, forKey: "player_id")
            }
        }
    }
    
    override func touchesEnded(_ _: Set<UITouch>, with _: UIEvent?) {
        if startMenuChosen {
            startMenu = true
            startMenuScene = true
        }
        if levelMenuChosen {
            levelMenu = true
            levelMenuScene = true
        }
    }
    
    private func placeButton(fac : CGFloat, buttonNotPressed : SKSpriteNode, buttonPressed : SKSpriteNode, width : CGFloat, height : CGFloat) {
        
        let buttonWidth = width
        let heightButton = height
        
        buttonNotPressed.size = CGSize(width: buttonWidth, height: heightButton)
        buttonNotPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
        buttonNotPressed.zPosition = 2
        buttonNotPressed.removeFromParent()
        self.addChild(buttonNotPressed)
        
        buttonPressed.size = CGSize(width: buttonWidth, height: heightButton)
        buttonPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
        buttonPressed.zPosition = -1
        buttonPressed.removeFromParent()
        self.addChild(buttonPressed)
    }
    
    private func placeButton(fac : CGFloat, buttonNotPressed : SKSpriteNode, buttonPressed : SKSpriteNode) {
        
        let buttonWidth = self.size.width / 4
        let buttonHeight = self.size.height / 16
        
        buttonNotPressed.size = CGSize(width: buttonWidth, height: buttonHeight)
        buttonNotPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
        buttonNotPressed.zPosition = 2
        buttonNotPressed.removeFromParent()
        self.addChild(buttonNotPressed)
        
        buttonPressed.size = CGSize(width: buttonWidth, height: buttonHeight)
        buttonPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
        buttonPressed.zPosition = -1
        buttonPressed.removeFromParent()
        self.addChild(buttonPressed)
    }
    
    func placeImage(fac : CGFloat, button : SKSpriteNode) {
        
        let buttonWidth = self.size.width / 16
        let buttonHeight = self.size.height / 16
        
        button.size = CGSize(width: buttonWidth, height: buttonHeight)
        button.position = CGPoint(x: self.size.width / 2 - self.guapoImage.size.width * 3, y: self.size.height / 2 * fac + self.size.height / 4)
        button.zPosition = 2
        button.removeFromParent()
        self.addChild(button)
    }
    
    private func pressButton(pointOfTouch : CGPoint, buttonNotPressed : SKSpriteNode, buttonPressed : SKSpriteNode, touched : inout Bool) {
    
        
        let touchedButtonX = pointOfTouch.x > buttonNotPressed.position.x - buttonNotPressed.size.width / 2 && pointOfTouch.x < buttonNotPressed.position.x + buttonNotPressed.size.width / 2
        
        let touchedButtonY = pointOfTouch.y > buttonNotPressed.position.y - buttonNotPressed.size.height / 2 && pointOfTouch.y < buttonNotPressed.position.y + buttonNotPressed.size.height / 2
        
        if touchedButtonX && touchedButtonY {
            
            buttonNotPressed.zPosition = -1
            buttonPressed.zPosition = 2
            touched = true
        }
    }
    
    private func pressCharacterMenu(pointOfTouch : CGPoint, buttonNotPressed : SKSpriteNode, buttonPressed : SKSpriteNode, touched : inout Bool) {
    
        
        let touchedButtonX = pointOfTouch.x > buttonNotPressed.position.x - buttonNotPressed.size.width / 2 && pointOfTouch.x < buttonNotPressed.position.x + buttonNotPressed.size.width / 2
        
        let touchedButtonY = pointOfTouch.y > buttonNotPressed.position.y - buttonNotPressed.size.height / 2 && pointOfTouch.y < buttonNotPressed.position.y + buttonNotPressed.size.height / 2
        
        if touchedButtonX && touchedButtonY {
            self.guapoButtonNotPressed.zPosition = 2
            self.guapoButtonPressed.zPosition = -1
            self.tuttiButtonNotPressed.zPosition = 2
            self.tuttiButtonPressed.zPosition = -1
            
            buttonNotPressed.zPosition = -1
            buttonPressed.zPosition = 2
            touched = true
        }
    }
}
