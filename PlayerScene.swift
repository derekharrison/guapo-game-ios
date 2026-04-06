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
    
    override func didMove(to view: SKView) {
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
    override func update(_ currentTime: TimeInterval) {
        startScene(scene: self, start : &startMenu, gameLevel : StartMenu(size: self.size))
        startScene(scene: self, start : &levelMenu, gameLevel : MainMenuScene(size: self.size))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with _: UIEvent?) {
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            
            var dummy1 = false
            var dummy2 = false
            
            pressedMenuButton(pointOfTouch: pointOfTouch, level_np : startMenuNotPressed, level_p : startMenuPressed, touched : &startMenu)
            pressedMenuButton(pointOfTouch: pointOfTouch, level_np : continueNotPressed, level_p : continuePressed, touched : &levelMenu)
            pressedCharacterMenu(pointOfTouch: pointOfTouch, level_np : guapoButtonNotPressed, level_p : guapoButtonPressed, touched : &dummy1)
            pressedCharacterMenu(pointOfTouch: pointOfTouch, level_np : tuttiButtonNotPressed, level_p : tuttiButtonPressed, touched : &dummy2)
            
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
    
    func placeButton(fac : CGFloat, buttonNotPressed : SKSpriteNode, buttonPressed : SKSpriteNode, width : CGFloat, height : CGFloat) {
        
        let width_button = width
        let height_button = height
        
        buttonNotPressed.size = CGSize(width: width_button, height: height_button)
        buttonNotPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
        buttonNotPressed.zPosition = 2
        buttonNotPressed.removeFromParent()
        self.addChild(buttonNotPressed)
        
        buttonPressed.size = CGSize(width: width_button, height: height_button)
        buttonPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
        buttonPressed.zPosition = -1
        buttonPressed.removeFromParent()
        self.addChild(buttonPressed)
    }
    
    func place_button2(fac : CGFloat, button_np : SKSpriteNode, button_p : SKSpriteNode) {
        
        let width_button = self.size.width / 4
        let height_button = self.size.height / 16
        
        button_np.size = CGSize(width: width_button, height: height_button)
        button_np.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
        button_np.zPosition = 2
        button_np.removeFromParent()
        self.addChild(button_np)
        
        button_p.size = CGSize(width: width_button, height: height_button)
        button_p.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
        button_p.zPosition = -1
        button_p.removeFromParent()
        self.addChild(button_p)
    }
    
    func placeImage(fac : CGFloat, button : SKSpriteNode) {
        
        let width_button = self.size.width / 16
        let height_button = self.size.height / 16
        
        button.size = CGSize(width: width_button, height: height_button)
        button.position = CGPoint(x: self.size.width / 2 - self.guapoImage.size.width * 3, y: self.size.height / 2 * fac + self.size.height / 4)
        button.zPosition = 2
        button.removeFromParent()
        self.addChild(button)
    }
    
    func pressedMenuButton(pointOfTouch : CGPoint, level_np : SKSpriteNode, level_p : SKSpriteNode, touched : inout Bool) {
    
        
        let touched_button_x = pointOfTouch.x > level_np.position.x - level_np.size.width / 2 && pointOfTouch.x < level_np.position.x + level_np.size.width / 2
        
        let touched_button_y = pointOfTouch.y > level_np.position.y - level_np.size.height / 2 && pointOfTouch.y < level_np.position.y + level_np.size.height / 2
        
        if touched_button_x && touched_button_y {
            
            level_np.zPosition = -1
            level_p.zPosition = 2
            touched = true
        }
    }
    
    func pressedCharacterMenu(pointOfTouch : CGPoint, level_np : SKSpriteNode, level_p : SKSpriteNode, touched : inout Bool) {
    
        
        let touched_button_x = pointOfTouch.x > level_np.position.x - level_np.size.width / 2 && pointOfTouch.x < level_np.position.x + level_np.size.width / 2
        
        let touched_button_y = pointOfTouch.y > level_np.position.y - level_np.size.height / 2 && pointOfTouch.y < level_np.position.y + level_np.size.height / 2
        
        if touched_button_x && touched_button_y {
            self.guapoButtonNotPressed.zPosition = 2
            self.guapoButtonPressed.zPosition = -1
            self.tuttiButtonNotPressed.zPosition = 2
            self.tuttiButtonPressed.zPosition = -1
            
            level_np.zPosition = -1
            level_p.zPosition = 2
            touched = true
        }
    }
}
