//
//  GameLevel.swift
//  SoloMission
//
//  Created by Derek Harrison on 29/09/2023.
//

import Foundation
import SpriteKit

class GameLevel {

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

    var ro = CGPoint(x: 0, y: 0)
    
    var playMisty = Int.random(in: 10..<40) + 20
    var flagFrequency = numberOfPointsBetweenCheckpoints
    var flagNum = 1
    var numLives = numberOfLives
    var counter = 1
    var toSwitch = false
    
    var hitBird = false
    var numBirds = 2
    
    var scene = SKScene()

    func didMove(scene: SKScene, id : Int) {
        
        numBirds = 2
        self.scene = scene
        
        createPlayer()
        
        initCommon(scene: scene, id: id)
        
        self.modelUpdate = Update(graphics : graphics, scene: scene)
    }
    
    func didMoveOcean(scene: SKScene, id : Int) {
        
        numJellyFish = 2
        self.scene = scene
                
        addPlayerOcean()
        
        initCommon(scene: scene, id: id)
        
        initFish(width: scene.size.width, height: scene.size.height)
        
        self.modelUpdate = Update(graphics : graphics, scene: scene)
    }
    
    func update() {

        //Update score text
        scoreLabelNode.text = String(gameScore)
                
        if self.currentGameState == GameState.inGame {
            moveCounter += 1
        }
        
        if self.currentGameState == GameState.inGame {
            modelUpdate.update()
        }
    }
    
    func updateOcean() {
        // TODO :  implement
        update()
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
    
    func initFish(width : CGFloat, height : CGFloat) {
        graphics.fish1.addImage(image: fishImage1a)
        graphics.fish1.addImage(image: fishImage1b)
        graphics.fish1.setHeight(height : height)
        graphics.fish1.setWidth(width : width)
        graphics.fish1.setSize(size: CGSize(width : width / 7.5, height : height / 15))
        graphics.fish1.setPosition(position: CGPoint(x: -1000, y: 0))
        graphics.fish1.setZPosition(zPos: minZPosFishes)
        graphics.fish1.addImagesToScene(scene: scene)
        
        graphics.fish2.addImage(image: fishImage2a)
        graphics.fish2.addImage(image: fishImage2b)
        graphics.fish2.setHeight(height : height)
        graphics.fish2.setWidth(width : width)
        graphics.fish2.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        graphics.fish2.setPosition(position: CGPoint(x: -1000, y: 0))
        graphics.fish2.setZPosition(zPos: minZPosFishes + 1)
        graphics.fish2.addImagesToScene(scene: scene)
        
        graphics.fish3.addImage(image: fishImage3a)
        graphics.fish3.addImage(image: fishImage3b)
        graphics.fish3.setHeight(height : height)
        graphics.fish3.setWidth(width : width)
        graphics.fish3.setSize(size: CGSize(width : width / 7.5, height : height / 15))
        graphics.fish3.setPosition(position: CGPoint(x: -1000, y: 0))
        graphics.fish3.setZPosition(zPos: minZPosFishes + 2)
        graphics.fish3.addImagesToScene(scene: scene)
        
        graphics.fish4.addImage(image: fishImage4a)
        graphics.fish4.addImage(image: fishImage4b)
        graphics.fish4.setHeight(height : height)
        graphics.fish4.setWidth(width : width)
        graphics.fish4.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        graphics.fish4.setPosition(position: CGPoint(x: -1000, y: 0))
        graphics.fish4.setZPosition(zPos: minZPosFishes + 3)
        graphics.fish4.addImagesToScene(scene: scene)
        
        graphics.fish5.addImage(image: fishImage5a)
        graphics.fish5.addImage(image: fishImage5b)
        graphics.fish5.setHeight(height : height)
        graphics.fish5.setWidth(width : width)
        graphics.fish5.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        graphics.fish5.setPosition(position: CGPoint(x: 10 * width, y: 0))
        graphics.fish5.setZPosition(zPos: minZPosFishes + 4)
        graphics.fish5.addImagesToScene(scene: scene)
        
        graphics.fish6.addImage(image: fishImage6a)
        graphics.fish6.addImage(image: fishImage6b)
        graphics.fish6.setHeight(height : height)
        graphics.fish6.setWidth(width : width)
        graphics.fish6.setSize(size: CGSize(width : width / 7.5, height : height / 15))
        graphics.fish6.setPosition(position: CGPoint(x: 10 * width, y: 0))
        graphics.fish6.setZPosition(zPos: minZPosFishes + 5)
        graphics.fish6.addImagesToScene(scene: scene)
        
        graphics.blowFish.addImage(image: blowFishImage1)
        graphics.blowFish.addImage(image: blowFishImage2)
        graphics.blowFish.addImageHit(image: blowFishImage3)
        graphics.blowFish.addImageHit(image: blowFishImage4)
        graphics.blowFish.setHeight(height : height)
        graphics.blowFish.setWidth(width : width)
        graphics.blowFish.setSize(size: CGSize(width : width * 3 / 15, height : height / 7.5))
        graphics.blowFish.setSizeHit(size: CGSize(width : width * 3 / 7.5, height : height * 2 / 7.5))
        graphics.blowFish.setPosition(position: CGPoint(x: -1000, y: 0))
        graphics.blowFish.setZPosition(zPos: minZPosFishes + 6)
        graphics.blowFish.setVelocity(velX: -1.5 * graphics.backgroundSpeed, velY: 0)
        graphics.blowFish.addImagesToScene(scene: scene)
    }
    
    func initImagesFrito(images : [String], height : CGFloat, width : CGFloat) {
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
    
    func initImagesBrownie(images : [String], height : CGFloat, width : CGFloat) {
        for image in images {
            graphics.brownie.addImage(image : image)
        }
        graphics.brownie.setHeight(height : height)
        graphics.brownie.setWidth(width : width)
        graphics.brownie.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        graphics.brownie.setVelocity(velX: -2 * graphics.backgroundSpeed, velY: -2 * graphics.backgroundSpeed)
        graphics.brownie.setZPosition(zPos: zPosCharacters + 1)
        graphics.brownie.setPosition(position: CGPoint(x : -width, y: height * 0.75 + graphics.brownie.images[0].size.height / 2))
        
        graphics.brownie.addImagesToScene(scene: scene)
    }
    
    func initImagesMisty(images : [String], height : CGFloat, width : CGFloat) {
        for image in images {
            graphics.misty.addImage(image : image)
        }
        graphics.misty.setHeight(height : height)
        graphics.misty.setWidth(width : width)
        graphics.misty.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        graphics.misty.setVelMisty(vx: 0, vy: -graphics.backgroundSpeed)
        graphics.misty.setZPosition(zPos: zPosCharacters + 2)
        graphics.misty.setPosition(position: CGPoint(x : width / 2, y : height * 0.75 + graphics.misty.images[0].size.height / 2))
        
        graphics.misty.addImagesToScene(scene: scene)
    }
    
    func initCommon(scene : SKScene, id : Int) {
        
        levelId = id
        playSunPopup = true
        sunPopupFrameCounter = 0
        gameScore = 0
        boundTracker = 1
        graphics.backgroundSpeed = scene.size.width / 400
        
        let width = scene.size.width
        let height = scene.size.height
        
        addSnacks(scene : scene)
        
        graphics.continueButton.addImage(image: continueButtonNotPressed)
        graphics.continueButton.addImageHit(image: continueButtonPressed)
        graphics.continueButton.setPosition(position: CGPoint(x: scene.size.width / 2 - graphics.continueButton.getSize().width / 2, y: scene.size.height / 2))
        graphics.continueButton.setZPosition(zPos: -1)
        graphics.continueButton.setSize(size: CGSize(width: scene.size.width / 5, height: scene.size.height / 10))
        graphics.continueButton.addImagesToScene(scene: scene)
        
        graphics.restartButton.addImage(image: restartButtonNotPressed)
        graphics.restartButton.addImageHit(image: restartButtonPressed)
        graphics.restartButton.setPosition(position: CGPoint(x: scene.size.width / 2 + graphics.restartButton.getSize().width / 2, y: scene.size.height / 2))
        graphics.restartButton.setZPosition(zPos: -1)
        graphics.restartButton.setSize(size: CGSize(width: scene.size.width / 5, height: scene.size.height / 10))
        graphics.restartButton.addImagesToScene(scene: scene)
        
        if levelId != levelId5 {
            graphics.flag.addImage(image: arubanFlag)
            graphics.flag.setZPosition(zPos: -1)
            graphics.flag.setSize(size: CGSize(width: scene.size.width / 5, height: scene.size.height / 5))
            graphics.flag.setPosition(position: CGPoint(x: scene.size.width - graphics.flag.getSize().width, y: scene.size.height * 0.75 - graphics.flag.getSize().height))
            graphics.flag.addImagesToScene(scene: scene)
        }
        else {
            graphics.flag.addImage(image: dutchFlag)
            graphics.flag.setZPosition(zPos: -1)
            graphics.flag.setSize(size: CGSize(width: scene.size.width / 5, height: scene.size.height / 5))
            graphics.flag.setPosition(position: CGPoint(x: scene.size.width - graphics.flag.getSize().width, y: scene.size.height * 0.75 - graphics.flag.getSize().height))
            graphics.flag.addImagesToScene(scene: scene)
        }
        
        pauseButtonNode.setScale(1)
        pauseButtonNode.size = CGSize(width: width / 28, height: height / 28)
        pauseButtonNode.position = CGPoint(x: width - width / 12, y: height / 2 + height * 1.9 / 10)
        pauseButtonNode.zPosition = zPosPauseButton
        pauseButtonNode.removeFromParent()
        scene.addChild(pauseButtonNode)
        
        playButtonNode.setScale(1)
        playButtonNode.size = CGSize(width: width / 28, height: height / 28)
        playButtonNode.position = pauseButtonNode.position
        playButtonNode.zPosition = -1
        playButtonNode.removeFromParent()
        scene.addChild(playButtonNode)
        
        sunPopupNode.setScale(1)
        sunPopupNode.size = CGSize(width: width / 7, height: height / 7)
        sunPopupNode.position = CGPoint(x: width / 2 + sunPopupNode.size.width / 5, y: height / 2 + height / 4 - sunPopupNode.size.height / 2 - width / 11)
        sunPopupNode.zPosition = -1
        sunPopupNode.removeFromParent()
        scene.addChild(sunPopupNode)
        
        scoreLabelNode.text = "0"
        scoreLabelNode.fontSize = 100
        scoreLabelNode.fontColor = SKColor.gray
        scoreLabelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabelNode.position = CGPoint(x: scene.size.width / 12, y: scene.size.height / 2 + scene.size.height * 1.8 / 10)
        
        scoreLabelNode.zPosition = zPosPauseButton
        scoreLabelNode.removeFromParent()
        scene.addChild(scoreLabelNode)
        
        
        let defaults = UserDefaults()
        if levelId == levelId1 {
            graphics.highScore = defaults.integer(forKey: highScoreId1)
        }
        if levelId == levelId2 {
            graphics.highScore = defaults.integer(forKey: highScoreId2)
        }
        if levelId == levelId3 {
            graphics.highScore = defaults.integer(forKey: highScoreId3)
        }
        if levelId == levelId4 {
            graphics.highScore = defaults.integer(forKey: highScoreId4)
        }
        if levelId == levelId5 {
            graphics.highScore = defaults.integer(forKey: highScoreId5)
        }

        isAlreadyUnlocked = graphics.highScore >= numberOfPointsRequiredToUnlockLevel
        muted = defaults.bool(forKey: String(levelId) + gameIsMuted)
        playing = defaults.bool(forKey: String(levelId) + gameIsPlaying)
        
        muteBubbles(bubbles : graphics.player.bubbles, mute : muted)
        muteBubbles(bubbles : graphics.frito.bubbles, mute : muted)
        muteBubbles(bubbles : graphics.brownie.bubbles, mute : muted)
        muteBubbles(bubbles : graphics.misty.bubbles, mute : muted)
        
        if !playing {
            addLives()
        }
        
        startGame()
    }
    
    func initLives() {
    }
    
    func addLives() {
        if numLives > 0 {
            initLives()
        }
    }
    
    func muteBubbles(bubbles : Bubbles, mute : Bool) {
        bubbles.isMuted = mute
    }
    
    func updatePlayerOcean() {
        graphics.player.update()
        
        graphics.player.bubbles.popBubbles(pos : graphics.player.getPosition(), scene : scene, sound : [bubblesSound])
    }
    
    func initBackground(scene : SKScene, numBackgrounds : Int, string1 : String) {
        graphics.blackBackgroundTop.size = CGSize(width: scene.size.width, height: scene.size.height / 4)
        graphics.blackBackgroundTop.position = CGPoint(x: scene.size.width / 2, y: scene.size.height * 0.75 + scene.size.height / 8)
        graphics.blackBackgroundTop.zPosition = zPosBlackCoverImages
        graphics.blackBackgroundBottom.size = CGSize(width: scene.size.width, height: scene.size.height / 4)
        graphics.blackBackgroundBottom.position = CGPoint(x: scene.size.width / 2, y: scene.size.height * 0.25 - scene.size.height / 8)
        graphics.blackBackgroundBottom.zPosition = zPosBlackCoverImages
        graphics.blackBackgroundTop.removeFromParent()
        graphics.blackBackgroundBottom.removeFromParent()
        scene.addChild(graphics.blackBackgroundTop)
        scene.addChild(graphics.blackBackgroundBottom)
        
        self.numBackgrounds = numBackgrounds
        
        for i in 0..<numBackgrounds {
            let string2 = String(i + 1)
            let imageName = string1 + string2
            let background = SKSpriteNode(imageNamed: imageName)
            
            background.size = CGSize(width: scene.size.width, height: scene.size.height / 2)
                        
            graphics.widthBackground = background.size.width
            
            background.anchorPoint = CGPoint(x: 0, y: 0.5)
            background.position = CGPoint(x: graphics.widthBackground * CGFloat(i) - CGFloat(numberOfPixelsOfOverlapBetweenBackgroundImages * i), y: scene.size.height / 2)
            
            background.zPosition = 0
            graphics.backgrounds.append(background)
            background.removeFromParent()
            scene.addChild(background)
        }
    }
    
    func initSnack(bite : String, points : Int, numCheesyBites : Int, snacks : inout [Snack], scene : SKScene) {
        for _ in 0..<numCheesyBites {
            
            let size = CGSize(width: scene.size.width / 14, height: scene.size.height / 14)
            let biteImage = bite
            
            let cheesyBite = Snack(bite: biteImage, points: pointsForCheesyBite, size: size, zPos: zPosSnacks)
            
            cheesyBite.addImagesToScene(scene: scene)

            let factor = 1.0 - (cheesyBite.getSize().height) / (scene.size.height / 2)
            let posX = getRandomNumber() * scene.size.width * 2
            let posY = getRandomNumber() * scene.size.height / 2 * factor + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
            
            cheesyBite.setPosition(position: CGPoint(x: posX, y: posY))
            cheesyBite.setVelocity(velX: -graphics.backgroundSpeed, velY: 0)
            cheesyBite.pointsForSnack = points
            snacks.append(cheesyBite)
        }
    }
    
    func addBubbles(bubbles : Bubbles, bubbleImage : String) {
        bubbles.addBubble(imageId: bubbleImage)
        bubbles.addBubble(imageId: bubbleImage)
        bubbles.addBubble(imageId: bubbleImage)
    }
    
    func addBirds(images : [String]) {
        for j in 0..<numBirds {
            
            var birdImages = [String]()
            
            for x in images {
                birdImages.append(x)
            }
            
            let zPosition = CGFloat(j) + minZPosVillains
            let size = CGSize(width: scene.size.width / 10, height: scene.size.height / 10)
            
            let bird = Bird(birds: birdImages, size: size, zPos: zPosition)
            
            bird.addImagesToScene(scene : scene)

            self.graphics.birds.append(bird)
            
        }
    }
    
    func createPlayer() {
        var playerImages : [String] = [String]()
        let defaults = UserDefaults()
        let playerId = defaults.integer(forKey: "player_id")
        
        if(getPlayerId(player: playerId) == PlayerId.GUAPO) {
            playerImages.append(guapoImage1)
            playerImages.append(guapoImage2)
            graphics.player = createHero(images: playerImages, imageHit: guapoHitImage)
        }
        if(getPlayerId(player: playerId) == PlayerId.TUTTI) {
            playerImages.append(tuttiImage1)
            playerImages.append(tuttiImage2)
            graphics.player = createHero(images: playerImages, imageHit: tuttiHitImage)
        }
    }
    
    private func createHero(images : [String], imageHit : String) -> Player {
        let size = CGSize(width: scene.size.width / 5, height: scene.size.height / 7.5)
        return PlayerBuilder(scene: scene)
            .images(images: images)
            .imageHit(imageHit: imageHit)
            .size(size: size)
            .zPos(zPos: zPosPlayer)
            .position(position: CGPoint(x : scene.size.width / 5, y : scene.size.height / 2))
            .width(width: scene.size.width)
            .height(height: scene.size.height)
            .build()
    }
    
    func addPlayerOcean() {
        let size = CGSize(width: scene.size.width / 5, height: scene.size.height / 7.5)
        
        var playerImages : [String] = [String]()
        
        let defaults = UserDefaults()
        let playerId = defaults.integer(forKey: "player_id")
        
        if(getPlayerId(player: playerId) == PlayerId.GUAPO) {
            playerImages.append(guapoSnorkelImage)
            graphics.player = Player()
                .images(images: playerImages)
                .imageHit(imageHit: guapoSnorkelHitImage)
                .size(size: size)
                .zPos(zPos: zPosPlayer)
        }
        
        if(getPlayerId(player: playerId) == PlayerId.TUTTI) {
            playerImages.append(tuttiSnorkelImage)
            graphics.player = Player()
                .images(images: playerImages)
                .imageHit(imageHit: tuttiSnorkelHitImage)
                .size(size: size)
                .zPos(zPos: zPosPlayer)
        }
        
        graphics.player.setPosition(position: CGPoint(x : scene.size.width / 5, y : scene.size.height / 2))
        graphics.player.setHeight(height : scene.size.height)
        graphics.player.setWidth(width : scene.size.width)
        
        graphics.player.bubbles.addBubble(imageId: bubbleImage)
        graphics.player.bubbles.addBubble(imageId: bubbleImage)
        graphics.player.bubbles.addBubble(imageId: bubbleImage)
        
        for x in graphics.player.bubbles.bubblez {
            x.removeFromParent()
            scene.addChild(x)
        }
        graphics.player.addImagesToScene(scene : scene)
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
    
    func addSnacks(scene : SKScene) {
        initSnack(bite : cheesyBiteImage, points: pointsForCheesyBite, numCheesyBites : Parameters.numberOfCheesyBites, snacks : &graphics.cheesyBites, scene : scene)
        
        initSnack(bite : paprikaImage, points: pointsForPaprika, numCheesyBites : totalNumberOfPaprika, snacks : &graphics.paprikas, scene : scene)
        
        initSnack(bite : broccoliImage, points: pointsForBroccoli, numCheesyBites : totalNumberOfBroccoli, snacks : &graphics.broccolis, scene : scene)
        
        initSnack(bite : cucumberImage, points: pointsForCucumber, numCheesyBites : totalNumberOfCucumbers, snacks : &graphics.cucumbers, scene : scene)
        
        initSnack(bite : begginStripImage, points: pointsBegginStrip, numCheesyBites : totalNumberOfBegginStrips, snacks : &graphics.begginStrips, scene : scene)
        
        // Move beggin strips out of bounds
        for strip in graphics.begginStrips {
            strip.setPosition(position: CGPoint(x : -1000, y : 0))
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
    
    func touchesBegan(_ touches: Set<UITouch>, with _ : UIEvent?) {
        
        if currentGameState == GameState.preGame {
            startGame()
            graphics.player.setVelocity(velX: 0, velY: 0)
        }
        else if currentGameState == GameState.inGame {
            
            for touch: AnyObject in touches {
                let pointOfTouch = touch.location(in: scene)
                
                // Position defines the boundaries of the pause / play button
                let position = CGPoint(x: scene.size.width - 2 * scene.size.width / 12, y: scene.size.height / 2 + scene.size.height * 1.5 / 10)
                
                let touchInGameArea = pointOfTouch.x > 0 && pointOfTouch.x < scene.size.width && pointOfTouch.y > scene.size.height / 4 && pointOfTouch.y < 0.75 * scene.size.height
                
                if pointOfTouch.x > position.x && pointOfTouch.y > position.y {
                    pauseGame()
                }
                else if touchInGameArea {
                    graphics.player.setPosition(position: pointOfTouch)
                    graphics.player.setVelocity(velX: 0, velY: 0)
                }
            }
        }
        else if currentGameState == GameState.gamePaused {
            for touch: AnyObject in touches {
                let pointOfTouch = touch.location(in: scene)
                
                let position = CGPoint(x: scene.size.width - 2 * scene.size.width / 12, y: scene.size.height / 2 + scene.size.height * 1.5 / 20)
                
                if pointOfTouch.x > position.x  && pointOfTouch.y > position.y {
                    startGame()
                }
            }
        }
        else if currentGameState == GameState.afterGame {
            for touch: AnyObject in touches {
                let point = touch.location(in: scene)
                
            }
        }
    }
    
    func touchesMoved(_ touches: Set<UITouch>, with _: UIEvent?) {
        self.ro = graphics.player.images[0].position
        
        if currentGameState == GameState.preGame {
            startGame()
            graphics.player.setVelocity(velX: 0, velY: 0)
        }
        else if currentGameState == GameState.inGame && moveCounter > 10 {
            
            moveCounter = 11
            
            for touch: AnyObject in touches {
                let pointOfTouch = touch.location(in: scene)
                
                let position = CGPoint(x: scene.size.width - 3 * scene.size.width / 12, y: scene.size.height / 2 + scene.size.height * 1.5 / 10)
                
                let touchInGameArea = pointOfTouch.x > 0 && pointOfTouch.x < scene.size.width && pointOfTouch.y > scene.size.height / 4 && pointOfTouch.y < 0.75 * scene.size.height
                
                if pointOfTouch.x > position.x  && pointOfTouch.y > position.y {
                    // Do nothing
                }
                else if touchInGameArea {
                    graphics.player.setPosition(position: pointOfTouch)
                    
                    var velX = (graphics.player.images[0].position.x - self.ro.x) / 2
                    var velY = (graphics.player.images[0].position.y - self.ro.y) / 2
                    
                    let minSpeed2 = 3.1
                    let speed2 = velX * velX + velY * velY

                    if speed2 < CGFloat(minSpeed2) {
                        velX = 0
                        velY = 0
                    }
                    
                    graphics.player.setVelocity(velX: velX, velY: velY)
                }
            }
        }
    }
}

