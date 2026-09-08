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
        
        let defaults = UserDefaults()
        
        highScoreNumberLevel1 = defaults.integer(forKey: highScoreId1)
        highScoreNumberLevel2 = defaults.integer(forKey: highScoreId2)
        highScoreNumberLevel3 = defaults.integer(forKey: highScoreId3)
        highScoreNumberLevel4 = defaults.integer(forKey: highScoreId4)
        highScoreNumberLevel5 = defaults.integer(forKey: highScoreId5)
        
        placeButton(scene: self, fac: 0.6, buttonNotPressed: continueNotPressed, buttonPressed: continuePressed)
        placeButton(scene: self, fac: 0.46, buttonNotPressed: levelMenuNotPressed, buttonPressed: levelMenuPressed)
    }
    
    //Force the mute button to change by running update()
    override func update(_ _: TimeInterval) {
   
        startScene(scene: self, start : &continueGame, gameLevel : GameLevel(size: self.size))
        startScene(scene: self, start : &levelMenu)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with _: UIEvent?) {
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            pressedButton(pointOfTouch: pointOfTouch, buttonNotPressed : continueNotPressed, buttonPressed : continuePressed, pressed : &continueGame)
            pressedButton(pointOfTouch: pointOfTouch, buttonNotPressed : levelMenuNotPressed, buttonPressed : levelMenuPressed, pressed : &levelMenu)
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
}
