//
//  MainMenuScene.swift
//  SoloMission
//
//  Created by Derek Harrison on 29/07/2021.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {

    let levelsText = SKLabelNode(fontNamed: GAME_FONT)
    let highScoreText = SKLabelNode(fontNamed: GAME_FONT)
    
    let level1ButtonNotPressed = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_NOTPRESSED_1)
    let level1ButtonPressed = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_PRESSED_1)
    let level2ButtonNotPressed = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_NOTPRESSED_2)
    let level2ButtonPressed = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_PRESSED_2)
    let level3ButtonNotPressed = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_NOTPRESSED_3)
    let level3ButtonPressed = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_PRESSED_3)
    let level4ButtonNotPressed = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_NOTPRESSED_4)
    let level4ButtonPressed = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_PRESSED_4)
    let level5ButtonNotPressed = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_NOTPRESSED_5)
    let level5ButtonPressed = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_PRESSED_5)
    
    let startMenuButtonNotPressed = SKSpriteNode(imageNamed: START_MENU_NOTPRESSED)
    let startMenuButtonPressed = SKSpriteNode(imageNamed: START_MENU_PRESSED)
    
    let playerMenuButtonNotPressed = SKSpriteNode(imageNamed: PLAYER_MENU_BUTTON_NOTPRESSED)
    let playerMenuButtonPressed = SKSpriteNode(imageNamed: PLAYER_MENU_BUTTON_PRESSED)
    
    let level2ButtonGrey = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_GRAY_2)
    let level3ButtonGrey = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_GRAY_3)
    let level4ButtonGrey = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_GRAY_4)
    let level5ButtonGrey = SKSpriteNode(imageNamed: MAIN_MENU_BUTTON_GRAY_5)
    
    let level1Score = SKLabelNode(fontNamed: GAME_FONT)
    let level2Score = SKLabelNode(fontNamed: GAME_FONT)
    let level3Score = SKLabelNode(fontNamed: GAME_FONT)
    let level4Score = SKLabelNode(fontNamed: GAME_FONT)
    let level5Score = SKLabelNode(fontNamed: GAME_FONT)
    
    var label = SKLabelNode(fontNamed: LABEL_FONT)

    let volumeOn = SKSpriteNode(imageNamed: SOUND_ON_IMAGE_STR)
    let volumeOff = SKSpriteNode(imageNamed: SOUND_OFF_IMAGE_STR)
    
    var muted = false

    var startNewScenePressed = false
    var startNewScene = false
    
    var startLevel1Pressed = false
    var startLevel1 = false
    var startLevel1Scene = false
    var startLevel2Pressed = false
    var startLevel2 = false
    var startLevel2Scene = false
    var startLevel3Pressed = false
    var startLevel3 = false
    var startLevel3Scene = false
    var startLevel4Pressed = false
    var startLevel4 = false
    var startLevel4Scene = false
    var startLevel5Touched = false
    var startLevel5 = false
    var startLevel5Scene = false
    
    var startMenuPressed = false
    var startMenu = false
    var startMenuScene = false
    
    var playerMenuPressed = false
    var playerMenu = false
    var playerMenuScene = false
    
    var highScoreNumberLevel1 = 0
    var highScoreNumberLevel2 = 0
    var highScoreNumberLevel3 = 0
    var highScoreNumberLevel4 = 0
    var highScoreNumberLevel5 = 0
    
    override func didMove(to _: SKView) {
        
        startNewScene = false
        startNewScenePressed = false
        
        let width = self.size.width / 16
        let height = self.size.height / 20
        
        volumeOff.setScale(1)
        volumeOff.size = CGSize(width: width, height: height)
        volumeOff.position = CGPoint(x: self.size.width / 16, y: self.size.height / 2 - self.size.height * 2.0 / 10)
        volumeOff.zPosition = 2
        
        volumeOn.setScale(1)
        volumeOn.size = CGSize(width: width, height: height)
        volumeOn.position = volumeOff.position
        volumeOn.zPosition = -1
        
        let defaults = UserDefaults()
        
        if muted {
            volumeOff.zPosition = 2
            volumeOn.zPosition = -1
        }
        else {
            volumeOff.zPosition = -1
            volumeOn.zPosition = 2
        }
        
        volumeOff.removeFromParent()
        volumeOn.removeFromParent()
        
        self.addChild(volumeOff)
        self.addChild(volumeOn)
        let background = SKSpriteNode(imageNamed: BACKGROUND_START_SCREEN)
        
        let widthb = background.size.width
        let heightb = self.size.height/2
        
        background.size = CGSize(width: widthb, height: heightb)
        
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = 0
        background.removeFromParent()
        self.addChild(background)
        
        levelsText.text = LEVELS_STR
        levelsText.fontSize = 80
        levelsText.fontColor = SKColor.gray
        levelsText.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * 0.85 + self.size.height / 4)
        levelsText.zPosition = 1
        levelsText.removeFromParent()
        self.addChild(levelsText)
        
        highScoreText.text = HIGHSCORE_STR
        highScoreText.fontSize = 80
        highScoreText.fontColor = SKColor.gray
        highScoreText.position = CGPoint(x: self.size.width / 2 + self.size.width / 4, y: self.size.height / 2 * 0.85 + self.size.height / 4)
        highScoreText.zPosition = 1
        highScoreText.removeFromParent()
        self.addChild(highScoreText)
        
        highScoreNumberLevel1 = defaults.integer(forKey: HIGH_SCORE_ID_1)
        highScoreNumberLevel2 = defaults.integer(forKey: HIGH_SCORE_ID_2)
        highScoreNumberLevel3 = defaults.integer(forKey: HIGH_SCORE_ID_3)
        highScoreNumberLevel4 = defaults.integer(forKey: HIGH_SCORE_ID_4)
        highScoreNumberLevel5 = defaults.integer(forKey: HIGH_SCORE_ID_5)

        placeFirstLevelButton(fac : 0.73, levelNotPressed : level1ButtonNotPressed, levelPressed : level1ButtonPressed, level1ButtonPressed, highScore : highScoreNumberLevel1, scoreLabel : level1Score)
        
        placeLevelButton(scorePreviousLevel : highScoreNumberLevel1, fac : 0.58, levelNotPressed : level2ButtonNotPressed, levelPressed : level2ButtonPressed, levelGray : level2ButtonGrey, highScore : highScoreNumberLevel2, scoreLabel : level2Score)
        
        placeLevelButton(scorePreviousLevel : highScoreNumberLevel2, fac : 0.43, levelNotPressed : level3ButtonNotPressed, levelPressed : level3ButtonPressed, levelGray : level3ButtonGrey, highScore : highScoreNumberLevel3, scoreLabel : level3Score)
        
        placeLevelButton(scorePreviousLevel : highScoreNumberLevel3, fac : 0.28, levelNotPressed : level4ButtonNotPressed, levelPressed : level4ButtonPressed, levelGray : level4ButtonGrey, highScore : highScoreNumberLevel4, scoreLabel : level4Score)
        
        placeLevelButton(scorePreviousLevel : highScoreNumberLevel3, fac : 0.13, levelNotPressed : level5ButtonNotPressed, levelPressed : level5ButtonPressed, levelGray : level5ButtonGrey, highScore : highScoreNumberLevel5, scoreLabel : level5Score)
        
        
        placeButton(fac: 0.9, buttonNotPressed: startMenuButtonNotPressed, buttonPressed: startMenuButtonPressed)
        placeButton(fac: 0.76, buttonNotPressed: playerMenuButtonNotPressed, buttonPressed: playerMenuButtonPressed)
    }
    
    //Force the mute button to change by running update()
    override func update(_ _: TimeInterval) {
        if muted {
            volumeOff.zPosition = 2
            volumeOn.zPosition = -1
        }
        else {
            volumeOff.zPosition = -1
            volumeOn.zPosition = 2
        }
        
        startScene(scene: self, start : &startLevel1Scene, GameLevel : GameLevel1(size: self.size))
        startScene(scene: self, start : &startLevel2Scene, GameLevel : GameLevel2(size: self.size))
        startScene(scene: self, start : &startLevel3Scene, GameLevel : GameLevel3(size: self.size))
        startScene(scene: self, start : &startLevel4Scene, GameLevel : GameLevel4(size: self.size))
        startScene(scene: self, start : &startLevel5Scene, GameLevel : GameLevel5(size: self.size))
        startScene(scene: self, start : &startMenu, GameLevel : StartMenu(size: self.size))
        startScene(scene: self, start : &playerMenu, GameLevel : PlayerScene(size: self.size))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with _: UIEvent?) {
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            let position = CGPoint(x: 2 * self.size.width / 12, y: self.size.height / 2 - self.size.height * 1.5 / 10)
            if pointOfTouch.x < position.x  && pointOfTouch.y < position.y && muted == false {
                volumeOn.zPosition = 2
                volumeOff.zPosition = -1
                muted = true

                let defaults = UserDefaults()
                defaults.set(muted, forKey: GAME_MUTED)
            }
            else if pointOfTouch.x < position.x  && pointOfTouch.y < position.y && muted == true {
                volumeOn.zPosition = -1
                volumeOff.zPosition = 2
                muted = false
                
                let defaults = UserDefaults()
                defaults.set(muted, forKey: GAME_MUTED)
            }
            else {
                
                buttonPressed(pointOfTouch: pointOfTouch, levelNotPressed : level1ButtonNotPressed, levelPressed : level1ButtonPressed, pressed : &startLevel1Pressed)
                buttonPressed(pointOfTouch: pointOfTouch, levelNotPressed : level2ButtonNotPressed, levelPressed : level2ButtonPressed, pressed : &startLevel2Pressed)
                buttonPressed(pointOfTouch: pointOfTouch, levelNotPressed : level3ButtonNotPressed, levelPressed : level3ButtonPressed, pressed : &startLevel3Pressed)
                buttonPressed(pointOfTouch: pointOfTouch, levelNotPressed : level4ButtonNotPressed, levelPressed : level4ButtonPressed, pressed : &startLevel4Pressed)
                buttonPressed(pointOfTouch: pointOfTouch, levelNotPressed : level5ButtonNotPressed, levelPressed : level5ButtonPressed, pressed : &startLevel5Touched)
                buttonPressed(pointOfTouch: pointOfTouch, levelNotPressed : startMenuButtonNotPressed, levelPressed : startMenuButtonPressed, pressed : &startMenu)
                buttonPressed(pointOfTouch: pointOfTouch, levelNotPressed : playerMenuButtonNotPressed, levelPressed : playerMenuButtonPressed, pressed : &playerMenu)
            }
        }
    }
    
    override func touchesEnded(_ _: Set<UITouch>, with _: UIEvent?) {
        if startNewScenePressed {
            startNewScene = true
        }
        
        if startLevel1Pressed {
            startLevel1 = true
            startLevel1Scene = true
        }
        if startLevel2Pressed {
            startLevel2 = true
            startLevel2Scene = true
        }
        if startLevel3Pressed {
            startLevel3 = true
            startLevel3Scene = true
        }
        if startLevel4Pressed {
            startLevel4 = true
            startLevel4Scene = true
        }
        if startLevel5Touched {
            startLevel5 = true
            startLevel5Scene = true
        }
        if startMenuPressed {
            startMenu = true
            startMenuScene = true
        }
        if playerMenuPressed {
            playerMenu = true
            playerMenuScene = true
        }
    }
    
    func buttonPressed(pointOfTouch : CGPoint, levelNotPressed : SKSpriteNode, levelPressed : SKSpriteNode, pressed : inout Bool) {
        let inRangeX = pointOfTouch.x > levelNotPressed.position.x - levelNotPressed.size.width / 2 && pointOfTouch.x < levelNotPressed.position.x + levelNotPressed.size.width / 2
        
        let inRangeY = pointOfTouch.y > levelNotPressed.position.y - levelNotPressed.size.height / 2 && pointOfTouch.y < levelNotPressed.position.y + levelNotPressed.size.height / 2
        
        if inRangeX && inRangeY {
            levelNotPressed.zPosition = -1
            levelPressed.zPosition = 2
            pressed = true
        }
    }
    
    func placeFirstLevelButton(fac : CGFloat, levelNotPressed : SKSpriteNode, levelPressed : SKSpriteNode, _ : SKSpriteNode, highScore : Int, scoreLabel : SKLabelNode) {
        
        let widthButton = self.size.width / 5
        let heightButton = self.size.height / 16
        
        levelNotPressed.size = CGSize(width: widthButton, height: heightButton)
        levelNotPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
        levelNotPressed.zPosition = 2
        levelNotPressed.removeFromParent()
        self.addChild(levelNotPressed)
        
        levelPressed.size = CGSize(width: widthButton, height: heightButton)
        levelPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
        levelPressed.zPosition = -1
        levelPressed.removeFromParent()
        self.addChild(levelPressed)
        
        scoreLabel.text = String(highScore)
        scoreLabel.fontSize = 70
        scoreLabel.fontColor = SKColor.gray
        scoreLabel.position = CGPoint(x: self.size.width / 2 + self.size.width / 4, y: self.size.height / 2 * (fac - 0.03) + self.size.height / 4)
        scoreLabel.zPosition = 1
        scoreLabel.removeFromParent()
        self.addChild(scoreLabel)
    }
    
    
    func placeLevelButton(scorePreviousLevel : Int, fac : CGFloat, levelNotPressed : SKSpriteNode, levelPressed : SKSpriteNode, levelGray : SKSpriteNode, highScore : Int, scoreLabel : SKLabelNode) {
        
        let widthButton = self.size.width / 5
        let heightButton = self.size.height / 16
        
        if scorePreviousLevel >= LEVEL_UNLOCK_GUARD {
            levelNotPressed.size = CGSize(width: widthButton, height: heightButton)
            levelNotPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
            levelNotPressed.zPosition = 2
            levelNotPressed.removeFromParent()
            self.addChild(levelNotPressed)
            
            levelPressed.size = CGSize(width: widthButton, height: heightButton)
            levelPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
            levelPressed.zPosition = -1
            levelPressed.removeFromParent()
            self.addChild(levelPressed)
        }
        else {
            levelNotPressed.size = CGSize(width: widthButton, height: heightButton)
            levelNotPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
            levelNotPressed.zPosition = -1
            levelNotPressed.removeFromParent()
            self.addChild(levelNotPressed)
            
            levelGray.size = CGSize(width: widthButton, height: heightButton)
            levelGray.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
            levelGray.zPosition = 2
            levelGray.removeFromParent()
            self.addChild(levelGray)
            
            levelPressed.size = CGSize(width: widthButton, height: heightButton)
            levelPressed.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 * fac + self.size.height / 4)
            levelPressed.zPosition = -1
            levelPressed.removeFromParent()
            self.addChild(levelPressed)
        }
        
        scoreLabel.text = String(highScore)
        scoreLabel.fontSize = 70
        scoreLabel.fontColor = SKColor.gray
        scoreLabel.position = CGPoint(x: self.size.width / 2 + self.size.width / 4, y: self.size.height / 2 * (fac - 0.03) + self.size.height / 4)
        scoreLabel.zPosition = 1
        scoreLabel.removeFromParent()
        self.addChild(scoreLabel)
    }
    
    func placeButton(fac : CGFloat, buttonNotPressed : SKSpriteNode, buttonPressed : SKSpriteNode) {
        let widthButton = self.size.width / 4
        let heightButton = self.size.height / 16
        
        buttonNotPressed.size = CGSize(width: widthButton, height: heightButton)
        buttonNotPressed.position = CGPoint(x: self.size.width / 6, y: self.size.height / 2 * fac + self.size.height / 4)
        buttonNotPressed.zPosition = 2
        buttonNotPressed.removeFromParent()
        self.addChild(buttonNotPressed)
        
        buttonPressed.size = CGSize(width: widthButton, height: heightButton)
        buttonPressed.position = CGPoint(x: self.size.width / 6, y: self.size.height / 2 * fac + self.size.height / 4)
        buttonPressed.zPosition = -1
        buttonPressed.removeFromParent()
        self.addChild(buttonPressed)
    }
}

