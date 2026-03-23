//
//  StartMenu.swift
//  SoloMission
//
//  Created by Derek Harrison on 30/12/2024.
//

import Foundation
import SpriteKit


class StartMenu: SKScene {
    
    let playerMenuNotPressed = SKSpriteNode(imageNamed: PLAYER_MENU_BUTTON_NOTPRESSED)
    let playerMenuPressed = SKSpriteNode(imageNamed: PLAYER_MENU_BUTTON_PRESSED)
    let levelMenuNotPressed = SKSpriteNode(imageNamed: LEVEL_MENU_NOTPRESSED)
    let levelMenuPressed = SKSpriteNode(imageNamed: LEVEL_MENU_PRESSED)
    
    var playerMenuChosen = false
    var playerMenu = false
    var playerMenuScene = false
    
    var levelMenuChosen = false
    var levelMenu = false
    var levelMenuScene = false
    
    override func didMove(to _: SKView) {
        let background = SKSpriteNode(imageNamed: BACKGROUND_START_SCREEN)
        
        let widthb = background.size.width
        let heightb = self.size.height/2
        
        background.size = CGSize(width: widthb, height: heightb)
        
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = 0
        background.removeFromParent()
        self.addChild(background)
        
        placeButton(fac: 0.6, button_np: playerMenuNotPressed, button_p: playerMenuPressed)
        placeButton(fac: 0.46, button_np: levelMenuNotPressed, button_p: levelMenuPressed)
    }
    
    //Force the mute button to change by running update()
    override func update(_ currentTime: TimeInterval) {
   
        startScene(scene: self, start : &playerMenu, GameLevel : PlayerScene(size: self.size))
        startScene(scene: self, start : &levelMenu, GameLevel : MainMenuScene(size: self.size))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            pressedButton(pointOfTouch: pointOfTouch, levelNotPressed : playerMenuNotPressed, levelPressed : playerMenuPressed, pressed : &playerMenu)
            pressedButton(pointOfTouch: pointOfTouch, levelNotPressed : levelMenuNotPressed, levelPressed : levelMenuPressed, pressed : &levelMenu)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if playerMenuChosen {
            playerMenu = true
            playerMenuScene = true
        }
        if levelMenuChosen {
            levelMenu = true
            levelMenuScene = true
        }
    }
    
    private func placeButton(fac : CGFloat, button_np : SKSpriteNode, button_p : SKSpriteNode) {
        
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
