//
//  GameLevel.swift
//  SoloMission
//
//  Created by Derek Harrison on 29/09/2023.
//

import Foundation
import SpriteKit

class GameScene {

    var graphics : Graphics = Graphics()
    var modelUpdate : Update = Update(graphics: Graphics(), scene: SKScene())
    
    var levelId : Int = 0
    var muted = false
    var playing = false
    
    var currentGameState = GameState.preGame
    var playingState = PlayingState.restarted
    var numBackgrounds = 10
    
    var isAlreadyUnlocked = false
    var sunPopupFrameCounter = 0
    var flagPopupFrameCounter = 0
    var flagCounter = 1
    var playSunPopup = true
    var playFlagPopup = true
    var startThread = true
    var startSave = true

    var moveCounter = 0
    var isUp = true

    var oldPosition = CGPoint(x: 0, y: 0)
    
    var playMisty = Int.random(in: 10..<40) + 20
    var flagFrequency = numberOfPointsBetweenCheckpoints
    var flagNum = 1
    var numLives = numberOfLives
    var counter = 1
    var toSwitch = false
    
    var hitBird = false
    var numBirds = 2
    
    var scene = SKScene()

    func createScene(scene: SKScene, id : LevelId) {
        numBirds = 2
        self.scene = scene
        
        initGameVariables(scene: scene, id: id)
        
        createGraphics(scene: scene, id: id)
        
        createUpdateModel(scene: scene)
    }
    
    func update() {
        updateScore()
        
        if self.currentGameState == GameState.inGame {
            modelUpdate.update()
            moveCounter += 1
        }
    }
    
    private func createGraphics(scene: SKScene, id : LevelId) {
        GraphicsBuilder()
            .graphics(graphics: graphics)
            .scene(scene: scene)
            .id(id: id)
            .build()
    }
    
    private func createUpdateModel(scene: SKScene) {
        modelUpdate = Update(graphics : graphics, scene: scene)
    }
    
    func updateScore() {
        scoreLabelNode.text = String(gameScore)
    }
    
    func gameOver() {
        if levelId == levelId1 {
            runGameOver(highScoreId: highScoreId1)
        }
        if levelId == levelId2 {
            runGameOver(highScoreId: highScoreId2)
        }
        if levelId == levelId3 {
            runGameOver(highScoreId: highScoreId3)
        }
        if levelId == levelId4 {
            runGameOver(highScoreId: highScoreId4)
        }
        if levelId == levelId5 {
            runGameOver(highScoreId: highScoreId5)
        }
    }
    
    func createFrito(images : [String], height : CGFloat, width : CGFloat) {
        for image in images {
            graphics.frito.addImage(image : image)
        }
        graphics.frito.setHeight(height : height)
        graphics.frito.setWidth(width : width)
        graphics.frito.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        graphics.frito.setVelocity(velX: 2 * graphics.backgroundSpeed, velY: -2 * graphics.backgroundSpeed)
        graphics.frito.setZPosition(zPos: zPosCharacters)
        graphics.frito.setPosition(position: CGPoint(x : 10 * width, y : height * 0.75 + graphics.frito.images[0].size.height / 2))
        graphics.frito.addImagesToScene(scene: scene)
    }
    
    func initGameVariables(scene: SKScene, id : LevelId) {
        levelId = getLevelIdKeyPrefix(id: id)
        playSunPopup = true
        sunPopupFrameCounter = 0
        gameScore = 0
        boundTracker = 1
        
        let defaults = UserDefaults()
        isAlreadyUnlocked = graphics.highScore >= numberOfPointsRequiredToUnlockLevel
        muted = defaults.bool(forKey: String(levelId) + gameIsMuted)
        playing = defaults.bool(forKey: String(levelId) + gameIsPlaying)
        
        startGame()
    }
    
    private func getLevelIdKeyPrefix(id : LevelId) -> Int {
        if(id == LevelId.ARUBA) {
            return 0
        }
        if(id == LevelId.BEACH) {
            return 1
        }
        if(id == LevelId.TRIP) {
            return 2
        }
        if(id == LevelId.OCEAN) {
            return 3
        }
        if(id == LevelId.UTREG) {
            return 4
        }
        return 0
    }
    
    func updatePlayerOcean() {
        graphics.player.update()
    }
    
    private func getPlayerId(player: Int) -> PlayerId {
        switch player {
        case 0:
            return PlayerId.GUAPO
        case 1:
            return PlayerId.TUTTI
        default:
            return PlayerId.NONE
        }
    }
    
    func popFritoOcean() {
        if graphics.frito.appeared  {

            if muted == false && graphics.frito.playSound {
                playSound(scene: scene, sound: [fritoAppearingSound])
                graphics.frito.playSound = false
            }
            
            graphics.frito.bubbles.popBubbles(pos: graphics.frito.getPosition(), scene : scene, sound : [bubblesSound])
        }
        else {
            graphics.frito.bubbles.setPosition(pos: CGPoint(x: -1000, y: 0))
        }

        graphics.frito.updatePosition(scene: scene)
        
        if objectCollidedWithPlayer(bird : graphics.frito, player : graphics.player, den : 2.5) {
            graphics.frito.hit = true

            if muted == false && graphics.frito.playHitSound {
                playSound(scene: scene, sound: [fritoSound])
                graphics.frito.playHitSound = false
            }
        }
    }

    func runContinue(highScoreId: String, gameLevel : SKScene) {
        let defaults = UserDefaults()
        if gameScore > graphics.highScore {
            defaults.set(gameScore, forKey: highScoreId)
        }
        
        graphics.player.setZPosition(zPos: -1)
        graphics.player.setZPositionHit(zPos: zPosPlayer)
        var start = true
        startScene(scene: scene, start: &start, gameLevel: gameLevel)
    }
    
    func runRestart(highScoreId: String) {
        runGameOver(highScoreId: highScoreId)
    }
    
    func runGameOver(highScoreId : String) {
        let defaults = UserDefaults()
        
        if gameScore > graphics.highScore {
            defaults.set(gameScore, forKey: highScoreId)
        }
        
        graphics.player.setZPosition(zPos: -1)
        graphics.player.setZPositionHit(zPos: zPosPlayer)
        
        playing = false
        defaults.set(playing, forKey: String(levelId) + gameIsPlaying)
        
        let changeSceneAction = SKAction.run(changeScene)
        let waitToChangeScene = SKAction.wait(forDuration: 1)
        let changeSceneSequence = SKAction.sequence([waitToChangeScene, changeSceneAction])
        scene.run(changeSceneSequence)
    }
    
    func showRestartContinue() {
        graphics.player.setZPosition(zPos: -1)
        graphics.player.setZPositionHit(zPos: zPosPlayer)
        graphics.continueButton.images[0].zPosition = zPosContinueButton
        graphics.restartButton.images[0].zPosition = zPosStartButton
        
        endGame()
    }
    
    func changeScene() {
        let sceneToMoveTo = MainMenuScene(size: scene.size)
        sceneToMoveTo.scaleMode = scene.scaleMode
        let myTransition = SKTransition.fade(withDuration: 0.5)
        scene.view!.presentScene(sceneToMoveTo, transition: myTransition)
    }
    
    func startGame() {
        currentGameState = GameState.inGame
        pauseButtonNode.zPosition = zPosPauseButton
        playButtonNode.zPosition = -1
    }
    
    func pauseGame() {
        currentGameState = GameState.gamePaused
        pauseButtonNode.zPosition = -1
        playButtonNode.zPosition = zPosPauseButton
    }
    
    func endGame() {
        currentGameState = GameState.afterGame
    }
    
    func touchInPauseArea(pointOfTouch : CGPoint) -> Bool {
        let position = CGPoint(x: scene.size.width - 2 * scene.size.width / 12, y: scene.size.height / 2 + scene.size.height * 1.5 / 10)
        return pointOfTouch.x > position.x && pointOfTouch.y > position.y
    }
    
    func touchInGameArea(pointOfTouch : CGPoint) -> Bool {
        return pointOfTouch.x > 0 && pointOfTouch.x < scene.size.width && pointOfTouch.y > scene.size.height / 4 && pointOfTouch.y < 0.75 * scene.size.height
    }
    
    func touchesBegan(_ touches: Set<UITouch>, with _ : UIEvent?) {
        if currentGameState == GameState.preGame {
            handleTouchPreGame()
        }
        else if currentGameState == GameState.inGame {
            for touch: AnyObject in touches {
                let pointOfTouch = touch.location(in: scene)
                if touchInPauseArea(pointOfTouch: pointOfTouch) {
                    pauseGame()
                }
                else if touchInGameArea(pointOfTouch: pointOfTouch) {
                    resetPlayerVelocity()
                    updatePlayerPosition(pointOfTouch: pointOfTouch)
                }
            }
        }
        else if currentGameState == GameState.gamePaused {
            for touch: AnyObject in touches {
                let pointOfTouch = touch.location(in: scene)
                if touchInPauseArea(pointOfTouch: pointOfTouch) {
                    startGame()
                }
            }
        }
        else if currentGameState == GameState.afterGame {
            for touch: AnyObject in touches {
                let _ = touch.location(in: scene)
                // TODO : implement ?
            }
        }
    }
    
    func touchesMoved(_ touches: Set<UITouch>, with _: UIEvent?) {
        self.oldPosition = graphics.player.images[0].position
        if currentGameState == GameState.preGame {
            startGame()
            graphics.player.setVelocity(velX: 0, velY: 0)
        }
        else if currentGameState == GameState.inGame && moveCounter > 10 {
            moveCounter = 11
            for touch: AnyObject in touches {
                let pointOfTouch = touch.location(in: scene)
                if touchInPauseArea(pointOfTouch: pointOfTouch) {}
                else if touchInGameArea(pointOfTouch: pointOfTouch) {
                    updatePlayerVelocity(pointOfTouch: pointOfTouch)
                }
            }
        }
    }
    
    private func handleTouchPreGame() {
        startGame()
        resetPlayerVelocity()
    }
    
    private func resetPlayerVelocity() {
        graphics.player.setVelocity(velX: 0, velY: 0)
    }
    
    private func updatePlayerPosition(pointOfTouch : CGPoint) {
        graphics.player.setPosition(position: pointOfTouch)
    }
    
    private func updatePlayerVelocity(pointOfTouch : CGPoint) {
        graphics.player.setPosition(position: pointOfTouch)
        
        var velX = (graphics.player.images[0].position.x - self.oldPosition.x) / 2
        var velY = (graphics.player.images[0].position.y - self.oldPosition.y) / 2
        
        let minSpeed2 = 3.1
        let speed2 = velX * velX + velY * velY

        if speed2 < CGFloat(minSpeed2) {
            velX = 0
            velY = 0
        }
        
        graphics.player.setVelocity(velX: velX, velY: velY)
    }
}

