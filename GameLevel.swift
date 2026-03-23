//
//  GameLevel.swift
//  SoloMission
//
//  Created by Derek Harrison on 29/09/2023.
//

import Foundation
import SpriteKit

class GameLevel {

    var player = Player()
    
    var levelId : Int = 0
    var muted = false
    var playing = false
    var highScore = 0
    var birds = [Bird]()
    var jellyfishes = [JellyFish]()
    var cheesyBites = [Snack]()
    var cucumbers = [Snack]()
    var paprikas = [Snack]()
    var begginStrips = [Snack]()
    var broccolis = [Snack]()
    var continueButton = GameObject()
    var restartButton = GameObject()
    var flag = Flag()
    var widthBackground : CGFloat = 0
    var blackBackgroundBottom = SKSpriteNode(imageNamed: BACKGROUND_OPAQUE_STR)
    var blackBackgroundTop = SKSpriteNode(imageNamed: BACKGROUND_OPAQUE_STR)
    var backgrounds = [SKSpriteNode]()
    
    var frito = Frito()
    var brownie = Brownie()
    var misty = Misty()
    var fish1 = Fish()
    var fish2 = Fish()
    var fish3 = Fish()
    var fish4 = Fish()
    var fish5 = Fish()
    var fish6 = Fish()
    var blowFish = BlowFish()
    
    var backgroundSpeed: CGFloat = 0
    
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
    var flagFrequency = FLAG_FREQUENCY
    var flagNum = 1
    var numLives = NUM_LIVES
    var counter = 1
    var toSwitch = false
    
    var hitBird = false
    var numBirds = 2
    
    var scene = SKScene()

    func didMove(scene: SKScene, id : Int) {
        
        numBirds = 2
        self.scene = scene
        
        addPlayer()
        
        initCommon(scene: scene, id: id)
    }
    
    func didMoveOcean(scene: SKScene, id : Int) {
        
        numJellyFish = 2
        self.scene = scene
                
        addPlayerOcean()
        
        initCommon(scene: scene, id: id)
        
        initFish(width: scene.size.width, height: scene.size.height)
    }
    
    func update(scene : SKScene) {

        //Update score text
        SCORE_LABEL.text = String(gameScore)
        
        if levelId != LEVEL_ID_5 {
            sunPopup()
        }
        
        flagPopup()
                
        if self.currentGameState == GameState.inGame {
            moveCounter += 1
        }
        
        updateNumberOfBirds()
        
        if self.currentGameState == GameState.inGame {
            
            updatePlayer()
            
            updateBirds()
        
            updateSnacks()
            
            popFrito()
            
            popBrownie()
            
            popMisty()
            
            updateBackgrounds(scene : scene, backgrounds : backgrounds, vel_x : -backgroundSpeed)
        }
    }
    
    func updateOcean(scene : SKScene) {

        //Update score text
        SCORE_LABEL.text = String(gameScore)
        
        if self.currentGameState == GameState.inGame {
            moveCounter += 1
        }
        
        updateNumJelly()
        
        flagPopup()
        
        if self.currentGameState == GameState.inGame {
            
            updatePlayerOcean()
            
            updateJellyfish()
            
            updateFish()
            
            updateBlowFish()
            
            updateSnacks()
            
            popFritoOcean()
            
            popBrownieOcean()
            
            popMistyOcean()
            
            updateBackgrounds(scene : scene, backgrounds : backgrounds, vel_x : -backgroundSpeed)
        }
    }
    
    func gameOver() {
        if levelId == LEVEL_ID_1 {
            runGameOver(high_score_id: HIGH_SCORE_ID_1)
        }
        if levelId == LEVEL_ID_2 {
            runGameOver(high_score_id: HIGH_SCORE_ID_2)
        }
        if levelId == LEVEL_ID_3 {
            runGameOver(high_score_id: HIGH_SCORE_ID_3)
        }
        if levelId == LEVEL_ID_4 {
            runGameOver(high_score_id: HIGH_SCORE_ID_4)
        }
        if levelId == LEVEL_ID_5 {
            runGameOver(high_score_id: HIGH_SCORE_ID_5)
        }
    }
    
    func saveBackgrounds() {
        
        var counter = 1
        let defaults = UserDefaults()
        
        for x in backgrounds {
            defaults.set(x.position.x, forKey: String(levelId) + BACKGROUNDS_STR + String(counter))
            counter += 1
        }
    }
    
    func getBackgrounds() {
        
        var counter = 1
        let defaults = UserDefaults()
        
        for x in backgrounds {
            x.position.x = CGFloat(defaults.float(forKey: String(levelId) + BACKGROUNDS_STR + String(counter)))
            counter += 1
        }
    }
    
    func saveState() {
        saveObject(object: player, prefix: String(levelId) + PLAYER_STR)
        saveObject(object : brownie, prefix : String(levelId) + BROWNIE_STR)
        saveObject(object : frito, prefix : String(levelId) + FRITO_STR)
        saveMisty(object : misty, levelId : String(levelId))
        saveSnacks(snacks: cheesyBites, prefix: String(levelId) + CHEESY_STR)
        saveSnacks(snacks: paprikas, prefix: String(levelId) + PAPRIKA_STR)
        saveSnacks(snacks: cucumbers, prefix: String(levelId) + CUCUMBER_STR)
        saveSnacks(snacks: begginStrips, prefix: String(levelId) + BEGGIN_STR)
        saveSnacks(snacks: broccolis, prefix: String(levelId) + BROCCOLI_STR)
        saveObject(object: fish1, prefix: String(levelId) + FISH_STR_1)
        saveObject(object: fish2, prefix: String(levelId) + FISH_STR_2)
        saveObject(object: fish3, prefix: String(levelId) + FISH_STR_3)
        saveObject(object: fish4, prefix: String(levelId) + FISH_STR_4)
        saveObject(object: fish5, prefix: String(levelId) + FISH_STR_5)
        saveObject(object: fish6, prefix: String(levelId) + FISH_STR_6)
        saveObject(object: blowFish, prefix: String(levelId) + BLOWFISH_STR)
        saveBackgrounds()
        saveOther()
    }
    
    func getState() {
        getPlayer(object: &player, levelId: String(levelId))
        getBrownie(object: &brownie, levelId: String(levelId))
        getFrito(object : &frito, levelId : String(levelId))
        getMisty(object: &misty, levelId: String(levelId))
        getSnacks(snacks: &cheesyBites, prefix: String(levelId) + CHEESY_STR)
        getSnacks(snacks: &paprikas, prefix: String(levelId) + PAPRIKA_STR)
        getSnacks(snacks: &cucumbers, prefix: String(levelId) + CUCUMBER_STR)
        getSnacks(snacks: &begginStrips, prefix: String(levelId) + BEGGIN_STR)
        getSnacks(snacks: &broccolis, prefix: String(levelId) + BROCCOLI_STR)
        getFish(object: &fish1, levelId: String(levelId), prefix : FISH_STR_1)
        getFish(object: &fish2, levelId: String(levelId), prefix : FISH_STR_2)
        getFish(object: &fish3, levelId: String(levelId), prefix : FISH_STR_3)
        getFish(object: &fish4, levelId: String(levelId), prefix : FISH_STR_4)
        getFish(object: &fish5, levelId: String(levelId), prefix : FISH_STR_5)
        getFish(object: &fish6, levelId: String(levelId), prefix : FISH_STR_6)
        getBlowfish(object: &blowFish, levelId: String(levelId))
        getBackgrounds()
        getOther()
    }
    
    func saveOther() {
        let defaults = UserDefaults()
        defaults.set(gameScore, forKey: String(levelId) + SCORE_ID)
        defaults.set(playMisty, forKey: String(levelId) + MISTY_GUARD)
        defaults.set(flagNum, forKey: String(levelId) + FLAG_NUM)
        defaults.set(numLives, forKey: String(levelId) + NUM_LIVES_STR)
    }
    
    func getOther() {
        
        let defaults = UserDefaults()
        gameScore = defaults.integer(forKey: String(levelId) + SCORE_ID)
        playMisty = defaults.integer(forKey: String(levelId) + MISTY_GUARD)
        flagNum = defaults.integer(forKey: String(levelId) + FLAG_NUM)
        numLives = defaults.integer(forKey: String(levelId) + NUM_LIVES_STR)
        if numLives > 0 {
            for j in 0..<numLives {
                let lifeImage = SKSpriteNode(imageNamed: HEART_IMAGE_STR)
                lifeImage.setScale(1)
                lifeImage.size = CGSize(width: scene.size.width / 28, height: scene.size.height / 28)
                let size_loc = CGSize(width: scene.size.width / 28, height: scene.size.height / 28)
                lifeImage.position = CGPoint(x: scene.size.width / 2 + CGFloat(j) * size_loc.width + 5, y: CGFloat(scene.size.height * 0.75) - size_loc.height)
                lifeImage.zPosition = Z_POS_LIVES
                lifeImage.removeFromParent()
                scene.addChild(lifeImage)
            }
        }
        else {
            numLives = 0
        }
    }
    
    func updateSnacks() {
        //Update positions of snacks and detect eating snacks
        updateSnack(snacks : cheesyBites, backgroundSpeed : backgroundSpeed)

        //Update positions of cucumbers and detect eating cucumber
        updateSnack(snacks : cucumbers, backgroundSpeed : backgroundSpeed)
        
        //Update positions of paprikas and detect eating paprika
        updateSnack(snacks : paprikas, backgroundSpeed : backgroundSpeed)
        
        //Update positions of broccolis and detect eating broccoli
        updateSnack(snacks : broccolis, backgroundSpeed : backgroundSpeed)
        
        //Update positions of beggin strips and detect eating beggin strip
        if gameScore >= POINTS_AT_WHICH_BEGGIN_STRIPS_APPEAR {
            updateSnack(snacks : begginStrips, backgroundSpeed : backgroundSpeed)
        }
    }
    
    func initFish(width : CGFloat, height : CGFloat) {
        fish1.addImage(image: FISH_IMAGE_1)
        fish1.addImage(image: FISH_IMAGE_2)
        fish1.setHeight(height : height)
        fish1.setWidth(width : width)
        fish1.setSize(size: CGSize(width : width / 7.5, height : height / 15))
        fish1.setPosition(position: CGPoint(x: -1000, y: 0))
        fish1.setZPosition(zPos: MIN_Z_POS_FISHES)
        fish1.addImagesToScene(scene: scene)
        
        fish2.addImage(image: FISH_IMAGE_2A)
        fish2.addImage(image: FISH_IMAGE_2B)
        fish2.setHeight(height : height)
        fish2.setWidth(width : width)
        fish2.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        fish2.setPosition(position: CGPoint(x: -1000, y: 0))
        fish2.setZPosition(zPos: MIN_Z_POS_FISHES + 1)
        fish2.addImagesToScene(scene: scene)
        
        fish3.addImage(image: FISH_IMAGE_3A)
        fish3.addImage(image: FISH_IMAGE_3B)
        fish3.setHeight(height : height)
        fish3.setWidth(width : width)
        fish3.setSize(size: CGSize(width : width / 7.5, height : height / 15))
        fish3.setPosition(position: CGPoint(x: -1000, y: 0))
        fish3.setZPosition(zPos: MIN_Z_POS_FISHES + 2)
        fish3.addImagesToScene(scene: scene)
        
        fish4.addImage(image: FISH_IMAGE_4A)
        fish4.addImage(image: FISH_IMAGE_4B)
        fish4.setHeight(height : height)
        fish4.setWidth(width : width)
        fish4.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        fish4.setPosition(position: CGPoint(x: -1000, y: 0))
        fish4.setZPosition(zPos: MIN_Z_POS_FISHES + 3)
        fish4.addImagesToScene(scene: scene)
        
        fish5.addImage(image: FISH_IMAGE_5A)
        fish5.addImage(image: FISH_IMAGE_5B)
        fish5.setHeight(height : height)
        fish5.setWidth(width : width)
        fish5.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        fish5.setPosition(position: CGPoint(x: 10 * width, y: 0))
        fish5.setZPosition(zPos: MIN_Z_POS_FISHES + 4)
        fish5.addImagesToScene(scene: scene)
        
        fish6.addImage(image: FISH_IMAGE_6A)
        fish6.addImage(image: FISH_IMAGE_6B)
        fish6.setHeight(height : height)
        fish6.setWidth(width : width)
        fish6.setSize(size: CGSize(width : width / 7.5, height : height / 15))
        fish6.setPosition(position: CGPoint(x: 10 * width, y: 0))
        fish6.setZPosition(zPos: MIN_Z_POS_FISHES + 5)
        fish6.addImagesToScene(scene: scene)
        
        blowFish.addImage(image: BLOW_FISH_IMAGE_1)
        blowFish.addImage(image: BLOW_FISH_IMAGE_2)
        blowFish.addImageHit(image: BLOW_FISH_IMAGE_3)
        blowFish.addImageHit(image: BLOW_FISH_IMAGE_4)
        blowFish.setHeight(height : height)
        blowFish.setWidth(width : width)
        blowFish.setSize(size: CGSize(width : width * 3 / 15, height : height / 7.5))
        blowFish.setSizeHit(size: CGSize(width : width * 3 / 7.5, height : height * 2 / 7.5))
        blowFish.setPosition(position: CGPoint(x: -1000, y: 0))
        blowFish.setZPosition(zPos: MIN_Z_POS_FISHES + 6)
        blowFish.setVelocity(velX: -1.5 * backgroundSpeed, velY: 0)
        blowFish.addImagesToScene(scene: scene)
    }
    
    func initImagesFrito(images : [String], height : CGFloat, width : CGFloat) {
        for image in images {
            frito.addImage(image : image)
        }
        frito.setHeight(height : height)
        frito.setWidth(width : width)
        frito.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        frito.setVelocity(velX: 2 * backgroundSpeed, velY: -2 * backgroundSpeed)
        frito.setZPosition(zPos: Z_POS_CHARS)
        frito.setPosition(position: CGPoint(x : 10 * width, y : height * 0.75 + frito.images[0].size.height / 2))
        frito.addImagesToScene(scene: scene)
    }
    
    func initImagesBrownie(images : [String], height : CGFloat, width : CGFloat) {
        for image in images {
            brownie.addImage(image : image)
        }
        brownie.setHeight(height : height)
        brownie.setWidth(width : width)
        brownie.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        brownie.setVelocity(velX: -2 * backgroundSpeed, velY: -2 * backgroundSpeed)
        brownie.setZPosition(zPos: Z_POS_CHARS + 1)
        brownie.setPosition(position: CGPoint(x : -width, y : height * 0.75 + brownie.images[0].size.height / 2))
        
        brownie.addImagesToScene(scene: scene)
    }
    
    func initImagesMisty(images : [String], height : CGFloat, width : CGFloat) {
        for image in images {
            misty.addImage(image : image)
        }
        misty.setHeight(height : height)
        misty.setWidth(width : width)
        misty.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        misty.set_vel_misty(vx: 0, vy: -backgroundSpeed)
        misty.setZPosition(zPos: Z_POS_CHARS + 2)
        misty.setPosition(position: CGPoint(x : width / 2, y : height * 0.75 + misty.images[0].size.height / 2))
        
        misty.addImagesToScene(scene: scene)
    }
    
    func initCommon(scene : SKScene, id : Int) {
        
        levelId = id
        playSunPopup = true
        sunPopupFrameCounter = 0
        gameScore = 0
        bound_tracker = 1
        backgroundSpeed = scene.size.width / 400
        
        let width = scene.size.width
        let height = scene.size.height
        
        addSnacks(scene : scene)
        
        continueButton.addImage(image: CONTINUE_BUTTON_NOT_PRESSED)
        continueButton.addImageHit(image: CONTINUE_BUTTON_PRESSED)
        continueButton.setPosition(position: CGPoint(x: scene.size.width / 2 - continueButton.getSize().width / 2, y: scene.size.height / 2))
        continueButton.setZPosition(zPos: -1)
        continueButton.setSize(size: CGSize(width: scene.size.width / 5, height: scene.size.height / 10))
        continueButton.addImagesToScene(scene: scene)
        
        restartButton.addImage(image: RESTART_BUTTON_NOT_PRESSED)
        restartButton.addImageHit(image: RESTART_BUTTON_PRESSED)
        restartButton.setPosition(position: CGPoint(x: scene.size.width / 2 + restartButton.getSize().width / 2, y: scene.size.height / 2))
        restartButton.setZPosition(zPos: -1)
        restartButton.setSize(size: CGSize(width: scene.size.width / 5, height: scene.size.height / 10))
        restartButton.addImagesToScene(scene: scene)
        
        if levelId != LEVEL_ID_5 {
            flag.addImage(image: FLAG_ARUBA_STR)
            flag.setZPosition(zPos: -1)
            flag.setSize(size: CGSize(width: scene.size.width / 5, height: scene.size.height / 5))
            flag.setPosition(position: CGPoint(x: scene.size.width - flag.getSize().width, y: scene.size.height * 0.75 - flag.getSize().height))
            flag.addImagesToScene(scene: scene)
        }
        else {
            flag.addImage(image: FLAG_NETHERLANDS_STR)
            flag.setZPosition(zPos: -1)
            flag.setSize(size: CGSize(width: scene.size.width / 5, height: scene.size.height / 5))
            flag.setPosition(position: CGPoint(x: scene.size.width - flag.getSize().width, y: scene.size.height * 0.75 - flag.getSize().height))
            flag.addImagesToScene(scene: scene)
        }
        
        PAUSE_BUTTON.setScale(1)
        PAUSE_BUTTON.size = CGSize(width: width / 28, height: height / 28)
        PAUSE_BUTTON.position = CGPoint(x: width - width / 12, y: height / 2 + height * 1.9 / 10)
        PAUSE_BUTTON.zPosition = Z_POS_PAUSE
        PAUSE_BUTTON.removeFromParent()
        scene.addChild(PAUSE_BUTTON)
        
        PLAY_BUTTON.setScale(1)
        PLAY_BUTTON.size = CGSize(width: width / 28, height: height / 28)
        PLAY_BUTTON.position = PAUSE_BUTTON.position
        PLAY_BUTTON.zPosition = -1
        PLAY_BUTTON.removeFromParent()
        scene.addChild(PLAY_BUTTON)
        
        SUN_POPUP_SPR.setScale(1)
        SUN_POPUP_SPR.size = CGSize(width: width / 7, height: height / 7)
        SUN_POPUP_SPR.position = CGPoint(x: width / 2 + SUN_POPUP_SPR.size.width / 5, y: height / 2 + height / 4 - SUN_POPUP_SPR.size.height / 2 - width / 11)
        SUN_POPUP_SPR.zPosition = -1
        SUN_POPUP_SPR.removeFromParent()
        scene.addChild(SUN_POPUP_SPR)
        
        SCORE_LABEL.text = "0"
        SCORE_LABEL.fontSize = 100
        SCORE_LABEL.fontColor = SKColor.gray
        SCORE_LABEL.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        SCORE_LABEL.position = CGPoint(x: scene.size.width / 12, y: scene.size.height / 2 + scene.size.height * 1.8 / 10)
        
        SCORE_LABEL.zPosition = Z_POS_PAUSE
        SCORE_LABEL.removeFromParent()
        scene.addChild(SCORE_LABEL)
        
        
        let defaults = UserDefaults()
        if levelId == LEVEL_ID_1 {
            highScore = defaults.integer(forKey: HIGH_SCORE_ID_1)
        }
        if levelId == LEVEL_ID_2 {
            highScore = defaults.integer(forKey: HIGH_SCORE_ID_2)
        }
        if levelId == LEVEL_ID_3 {
            highScore = defaults.integer(forKey: HIGH_SCORE_ID_3)
        }
        if levelId == LEVEL_ID_4 {
            highScore = defaults.integer(forKey: HIGH_SCORE_ID_4)
        }
        if levelId == LEVEL_ID_5 {
            highScore = defaults.integer(forKey: HIGH_SCORE_ID_5)
        }

        isAlreadyUnlocked = highScore >= unlock_level_points
        muted = defaults.bool(forKey: String(levelId) + GAME_MUTED)
        playing = defaults.bool(forKey: String(levelId) + PLAYING)
        
        muteBubbles(bubbles : player.bubbles, mute : muted)
        muteBubbles(bubbles : frito.bubbles, mute : muted)
        muteBubbles(bubbles : brownie.bubbles, mute : muted)
        muteBubbles(bubbles : misty.bubbles, mute : muted)
        
        if !playing {
            addLives()
        }
        
        startGame()
    }
    
    func addLives() {
        
        if numLives > 0 {
            for j in 0..<numLives {
                let lifeImage = SKSpriteNode(imageNamed: HEART_IMAGE_STR)
                lifeImage.setScale(1)
                lifeImage.size = CGSize(width: scene.size.width / 28, height: scene.size.height / 28)
                let size_loc = CGSize(width: scene.size.width / 28, height: scene.size.height / 28)
                lifeImage.position = CGPoint(x: scene.size.width / 2 + CGFloat(j) * size_loc.width + 5, y: CGFloat(scene.size.height * 0.75) - size_loc.height)
                lifeImage.zPosition = Z_POS_LIVES
                lifeImage.removeFromParent()
                scene.addChild(lifeImage)
            }
        }
    }
    
    func muteBubbles(bubbles : Bubbles, mute : Bool) {
        bubbles.isMuted = mute
    }
    
    func updatePlayerOcean() {
        player.update()
        
        player.bubbles.popBubbles(pos : player.getPosition(), scene : scene, sound : [BUBBLES_SOUNDS])
    }
    
    func initBackground(scene : SKScene, numBackgrounds : Int, string1 : String) {
        blackBackgroundTop.size = CGSize(width: scene.size.width, height: scene.size.height / 4)
        blackBackgroundTop.position = CGPoint(x: scene.size.width / 2, y: scene.size.height * 0.75 + scene.size.height / 8)
        blackBackgroundTop.zPosition = Z_POS_BLACK
        blackBackgroundBottom.size = CGSize(width: scene.size.width, height: scene.size.height / 4)
        blackBackgroundBottom.position = CGPoint(x: scene.size.width / 2, y: scene.size.height * 0.25 - scene.size.height / 8)
        blackBackgroundBottom.zPosition = Z_POS_BLACK
        blackBackgroundTop.removeFromParent()
        blackBackgroundBottom.removeFromParent()
        scene.addChild(blackBackgroundTop)
        scene.addChild(blackBackgroundBottom)
        
        self.numBackgrounds = numBackgrounds
        
        for i in 0..<numBackgrounds {
            let string2 = String(i + 1)
            let image_name = string1 + string2
            let background = SKSpriteNode(imageNamed: image_name)
            
            background.size = CGSize(width: scene.size.width, height: scene.size.height / 2)
                        
            widthBackground = background.size.width
            
            background.anchorPoint = CGPoint(x: 0, y: 0.5)
            background.position = CGPoint(x: widthBackground * CGFloat(i) - CGFloat(BACKGROUND_OVERLAP * i), y: scene.size.height / 2)
            
            background.zPosition = 0
            backgrounds.append(background)
            background.removeFromParent()
            scene.addChild(background)
        }
    }
    
    func initSnack(bite : String, points : Int, numCheesyBites : Int, snacks : inout [Snack], scene : SKScene) {
        for _ in 0..<numCheesyBites {
            
            let size = CGSize(width: scene.size.width / 14, height: scene.size.height / 14)
            let bite_image = bite
            
            let cheesy_bite = Snack(bite: bite_image, points: POINTS_CHEESY_BITES, size: size, z_pos: Z_POS_SNACKS)
            
            cheesy_bite.addImagesToScene(scene: scene)

            let factor = 1.0 - (cheesy_bite.getSize().height) / (scene.size.height / 2)
            let pos_x = getRandomNumber() * scene.size.width * 2
            let pos_y = getRandomNumber() * scene.size.height / 2 * factor + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
            
            cheesy_bite.setPosition(position: CGPoint(x: pos_x, y: pos_y))
            cheesy_bite.setVelocity(velX: -backgroundSpeed, velY: 0)
            cheesy_bite.points_snack = points
            snacks.append(cheesy_bite)
        }
    }
    
    func updateBackgrounds(scene : SKScene, backgrounds : [SKSpriteNode], vel_x : CGFloat) {

        let n = backgrounds.count
        
        for j in 0..<n {
            backgrounds[j].position.x += vel_x
            if(j > 0 && backgrounds[j - 1].position.x < 0) {
                backgrounds[j].position.x = backgrounds[j - 1].position.x + backgrounds[j - 1].size.width - 10
            }
            if(j == n - 1 && backgrounds[j].position.x < 0) {
                backgrounds[0].position.x = backgrounds[j].position.x + backgrounds[j].size.width - 10
            }
        }
    }
    
    func addBubbles(bubbles_char : Bubbles, bubble_image : String) {
        bubbles_char.addBubble(imageId: bubble_image)
        bubbles_char.addBubble(imageId: bubble_image)
        bubbles_char.addBubble(imageId: bubble_image)
    }
    
    func addBirds(images : [String]) {
        for j in 0..<numBirds {
            
            var bird_images = [String]()
            
            for x in images {
                bird_images.append(x)
            }
            
            let z_pos = CGFloat(j) + MIN_Z_POS_BIRDS
            let size = CGSize(width: scene.size.width / 10, height: scene.size.height / 10)
            
            let bird = Bird(birds: bird_images, size: size, zPos: z_pos)
            
            bird.addImagesToScene(scene : scene)

            birds.append(bird)
            
        }
    }
    
    func addJellyfish(images : [String]) {
        for j in 0..<numJellyFish {
            
            var jelly_images = [String]()
            
            for x in images {
                jelly_images.append(x)
            }
            
            let z_pos = CGFloat(j) + MIN_Z_POS_JELLY_FISH
            let size = CGSize(width: scene.size.width / 10, height: scene.size.height / 10)
            
            let jelly = JellyFish(jelly_fish: jelly_images, size: size, z_pos: z_pos)
            jelly.addImagesToScene(scene : scene)

            jellyfishes.append(jelly)
        }
    }
    
    func addPlayer() {
        let size = CGSize(width: scene.size.width / 5, height: scene.size.height / 7.5)
        
        var player_images : [String] = [String]()
        
        let defaults = UserDefaults()
        let player_id = defaults.integer(forKey: "player_id")
        
        if(player_id == 0) {
            player_images.append(PLAYER_IMAGE_1)
            player_images.append(PLAYER_IMAGE_2)
            player = Player(images: player_images, size: size, z_pos: Z_POS_PLAYER)
            player.addImageHit(image: PLAYER_IMAGE_HIT)
        }
        if(player_id == 1) {
            player_images.append(PLAYER_TUTTI_IMAGE_1)
            player_images.append(PLAYER_TUTTI_IMAGE_2)
            player = Player(images: player_images, size: size, z_pos: Z_POS_PLAYER)
            player.addImageHit(image: PLAYER_TUTTI_IMAGE_HIT)
        }

        player.addImagesToScene(scene : scene)
        player.setVelocity(velX: 0, velY: 0)
        player.setPosition(position: CGPoint(x : scene.size.width / 5, y : scene.size.height / 2))
        player.setHeight(height : scene.size.height)
        player.setWidth(width : scene.size.width)
    }
    
    func addPlayerOcean() {
        let size = CGSize(width: scene.size.width / 5, height: scene.size.height / 7.5)
        
        var player_images : [String] = [String]()
        
        let defaults = UserDefaults()
        let player_id = defaults.integer(forKey: "player_id")
        
        if player_id == 0 {
            player_images.append(PLAYER_SNORKEL)
            player = Player(images: player_images, size: size, z_pos: Z_POS_PLAYER)
            player.addImageHit(image: PLAYER_SNORKEL_HIT)
        }
        
        if player_id == 1 {
            player_images.append(PLAYER_TUTTI_SNORKEL)
            player = Player(images: player_images, size: size, z_pos: Z_POS_PLAYER)
            player.addImageHit(image: PLAYER_TUTTI_SNORKEL_HIT)
        }
        

        player.setVelocity(velX: 0, velY: 0)
        player.setPosition(position: CGPoint(x : scene.size.width / 5, y : scene.size.height / 2))
        player.setHeight(height : scene.size.height)
        player.setWidth(width : scene.size.width)
        player.bubbles.addBubble(imageId: BUBBLE_IMAGE_STR)
        player.bubbles.addBubble(imageId: BUBBLE_IMAGE_STR)
        player.bubbles.addBubble(imageId: BUBBLE_IMAGE_STR)
        
        for x in player.bubbles.bubblez {
            x.removeFromParent()
            scene.addChild(x)
        }
        player.addImagesToScene(scene : scene)
    }
    
    func addSnacks(scene : SKScene) {
        initSnack(bite : CHEESY_BITE_IMAGE, points: POINTS_CHEESY_BITES, numCheesyBites : NUM_CHEESY_BITES, snacks : &cheesyBites, scene : scene)
        
        initSnack(bite : PAPRIKA_IMAGE, points: POINTS_PAPRIKA, numCheesyBites : NUM_PAPRIKAS, snacks : &paprikas, scene : scene)
        
        initSnack(bite : BROCCOLI_IMAGE, points: POINTS_BROCCOLI, numCheesyBites : NUM_BROCCOLI, snacks : &broccolis, scene : scene)
        
        initSnack(bite : CUCUMBER_IMAGE, points: POINTS_CUCUMBER, numCheesyBites : NUM_CUCUMBERS, snacks : &cucumbers, scene : scene)
        
        initSnack(bite : BEGGIN_IMAGE, points: POINTS_BEGGIN_STRIP, numCheesyBites : NUM_BEGGIN_STRIPS, snacks : &begginStrips, scene : scene)
        
        // Move beggin strips out of bounds
        for strip in begginStrips {
            strip.setPosition(position: CGPoint(x : -1000, y : 0))
        }
    }
    
    func updateSnack(snacks : [Snack], backgroundSpeed : CGFloat) {
        for cucumber in snacks {
            cucumber.update(scene: scene)
            cucumber.setVelocity(velX: -backgroundSpeed, velY: 0)
            
            if objectCollidedWithPlayer(bird : cucumber, player : player, den : 2.5) {
                cucumber.setPosition(position: CGPoint(x: -scene.size.width * 10, y: 0))
                
                if muted == false {
                    playSound(scene: scene, sound: [EAT_SOUND1])
                }
                
                gameScore += cucumber.points_snack
            }
        }
    }
    
    func popFrito() {
        if frito.appeared  {

            if muted == false && frito.playSound {
                playSound(scene: scene, sound: [FRITO_SOUND_APPEARING])
                frito.playSound = false
            }
        }

        frito.updatePosition(scene: scene)
        
        if objectCollidedWithPlayer(bird : frito, player : player, den : 2.5) {
            frito.hit = true

            if muted == false && frito.playHitSound {
                playSound(scene: scene, sound: [FRITO_SOUND])
                frito.playHitSound = false
            }
        }
    }
    
    func popBrownie() {
        if brownie.appeared  {

            if muted == false && brownie.playSound {
                playSound(scene: scene, sound: [BROWNIE_SOUND_APPEARING])
                brownie.playSound = false
            }
        }

        brownie.update(scene: scene)
        
        if objectCollidedWithPlayer(bird : brownie, player : player, den : 2.5) {
            brownie.hit = true

            if muted == false && brownie.playHitSound {
                playSound(scene: scene, sound: [BROWNIE_SOUND])
                brownie.playHitSound = false
            }
        }
    }
    
    func popMisty() {
        misty.pop_misty(height : misty.height, speed : backgroundSpeed)
        
        if objectCollidedWithPlayer(bird : misty, player : player, den : 2.5) {
            misty.hit = true
            
            if muted == false && misty.playSound {
                misty.playSound = false
                playSound(scene: scene, sound: [MISTY_SOUND])
            }
        }
        
        if gameScore >= playMisty {
            playMisty += 200 + Int.random(in: 10..<40)
            misty.play_misty(bool: Bool.random())
            if misty.top {
                misty.setPosition(position: CGPoint(x : misty.width / 2, y : misty.height * 0.75 + misty.images[0].size.height / 2))
                misty.set_vel_misty(vx: misty.velX, vy: -backgroundSpeed)
            }
            else {
                misty.setPosition(position: CGPoint(x : misty.width / 2, y : misty.height * 0.25 - misty.images[0].size.height / 2))
                misty.set_vel_misty(vx: misty.velX, vy: backgroundSpeed)
            }
            
            misty.playSound = true
            misty.hit = false
            
            if muted == false {
                playSound(scene: scene, sound: [MISTY_SOUND_APPEARING])
            }
        }
    }
    
    func popFritoOcean() {
        if frito.appeared  {

            if muted == false && frito.playSound {
                playSound(scene: scene, sound: [FRITO_SOUND_APPEARING])
                frito.playSound = false
            }
            
            frito.bubbles.popBubbles(pos: frito.getPosition(), scene : scene, sound : [BUBBLES_SOUNDS])
        }
        else {
            frito.bubbles.setPosition(pos: CGPoint(x: -1000, y: 0))
        }

        frito.updatePosition(scene: scene)
        
        if objectCollidedWithPlayer(bird : frito, player : player, den : 2.5) {
            frito.hit = true

            if muted == false && frito.playHitSound {
                playSound(scene: scene, sound: [FRITO_SOUND])
                frito.playHitSound = false
            }
        }
    }
    
    func popBrownieOcean() {
        if brownie.appeared  {

            if muted == false && brownie.playSound {
                playSound(scene: scene, sound: [BROWNIE_SOUND_APPEARING])
                brownie.playSound = false
            }
            
            brownie.bubbles.popBubbles(pos: brownie.getPosition(), scene : scene, sound : [BUBBLES_SOUNDS])

        }
        else {
            brownie.bubbles.setPosition(pos: CGPoint(x: -1000, y: 0))
        }

        brownie.update(scene: scene)
        
        if objectCollidedWithPlayer(bird : brownie, player : player, den : 2.5) {
            brownie.hit = true

            if muted == false && brownie.playHitSound {
                playSound(scene: scene, sound: [BROWNIE_SOUND])
                brownie.playHitSound = false
            }
        }
    }
    
    func popMistyOcean() {
        misty.pop_misty(height : misty.height, speed : backgroundSpeed)
        
        if objectCollidedWithPlayer(bird : misty, player : player, den : 2.5) {
            misty.hit = true
            
            if muted == false && misty.playSound {
                playSound(scene: scene, sound: [MISTY_SOUND])
                misty.playSound = false
            }
        }
        
        if gameScore >= playMisty {
            playMisty += 20 + Int.random(in: 10..<40)
            misty.play_misty(bool: Bool.random())
            if misty.top {
                misty.setPosition(position: CGPoint(x : misty.width / 2, y : misty.height * 0.75 + misty.images[0].size.height / 2))
                misty.set_vel_misty(vx: misty.velX, vy: -backgroundSpeed)
            }
            else {
                misty.setPosition(position: CGPoint(x : misty.width / 2, y : misty.height * 0.25 - misty.images[0].size.height / 2))
                misty.set_vel_misty(vx: misty.velX, vy: backgroundSpeed)
            }
            
            misty.playSound = true
            misty.hit = false
            
            if muted == false {
                playSound(scene: scene, sound: [MISTY_SOUND_APPEARING])
                misty.bubbles.popBubbles(pos: misty.getPosition(), scene : scene, sound : [BUBBLES_SOUNDS])
            }
        }
        else {
            misty.bubbles.setPosition(pos: CGPoint(x: -1000, y: 0))
        }
    }
    
    func updateJellyfish() {
        let defaults = UserDefaults()
        
        for jelly in jellyfishes {
            jelly.update(scene : scene, backgroundSpeed: -backgroundSpeed)
            
            if objectCollidedWithPlayer(bird : jelly, player : player, den : 3.5) {

                if muted == false {
                    playSound(scene: scene, sound: [END_SOUND])
                }
                
                self.currentGameState = GameState.afterGame
                
                if !hitBird {
                    hitBird = true
                    numLives = numLives - 1
                }
                
                defaults.set(numLives, forKey: String(levelId) + NUM_LIVES_STR)
                
                if(numLives < 0) {
                    numLives = 0
                    defaults.set(numLives, forKey: String(levelId) + NUM_LIVES_STR)
                    gameOver()
                }
                else if(numLives >= 0) {
                    showRestartContinue()
                }
            }
        }
    }
    
    func updateFish() {
        fish1.update(scene : scene, backgroundSpeed : -backgroundSpeed)
        fish2.updatePosition(scene : scene, backgroundSpeed : -backgroundSpeed)
        fish3.updatePosition(scene : scene, backgroundSpeed : -backgroundSpeed)
        fish4.updatePosition(scene : scene, backgroundSpeed : -backgroundSpeed)
        fish5.updatePositionGoingInOppositeDirection(scene : scene, backgroundSpeed : backgroundSpeed)
        fish6.updatePositionGoingInOppositeDirection(scene : scene, backgroundSpeed : backgroundSpeed)
    }
    
    func updateBlowFish() {
        blowFish.update(scene: scene, at: 5)
        
        if objectCollidedWithPlayer(bird : blowFish, player : player, den : 3.5) {

            if muted == false && blowFish.playHitSound {
                playSound(scene: scene, sound: [BLOWFISH_SOUND])
            }
            blowFish.playSound = false
            blowFish.playHitSound = false
            blowFish.hit = true
        }
    }
    
    func updatePlayer() {
        player.update()
        
        player.cape1.position.x = player.posX - player.cape1.size.width / 2
        player.cape1.position.y = player.posY
        player.cape2.position.x = player.posX - player.cape2.size.width / 2
        player.cape2.position.y = player.posY
        
        if counter < 5 {
            if toSwitch {
                player.cape1.zPosition = 2
                player.cape2.zPosition = -1
            }
            else {
                player.cape1.zPosition = -1
                player.cape2.zPosition = 2
            }
            counter += 1
        }
        else {
            toSwitch = !toSwitch
            counter = 1
        }
    }
    
    func updateBirds() {
        let defaults = UserDefaults()
        
        for bird in birds {
            bird.update(scene : scene, backgroundSpeed : -backgroundSpeed)

            if objectCollidedWithPlayer(bird : bird, player : player, den : 3.5) {

                if muted == false {
                    playSound(scene: scene, sound: [END_SOUND])
                }
                
                self.currentGameState = GameState.afterGame
                
                if !hitBird {
                    hitBird = true
                    numLives = numLives - 1
                }
                
                defaults.set(numLives, forKey: String(levelId) + NUM_LIVES_STR)
                
                if(numLives < 0) {
                    numLives = 0
                    defaults.set(numLives, forKey: String(levelId) + NUM_LIVES_STR)
                    gameOver()
                }
                else if(numLives >= 0) {
                    if(levelId == LEVEL_ID_1) {
                        showRestartContinue()
                    }
                    if(levelId == LEVEL_ID_2) {
                        showRestartContinue()
                    }
                    if(levelId == LEVEL_ID_3) {
                        showRestartContinue()
                    }
                    if(levelId == LEVEL_ID_5) {
                        showRestartContinue()
                    }
                }
            }
        }
    }
    
    func sunPopup() {
        if gameScore >=  LEVEL_UNLOCK_GUARD && !isAlreadyUnlocked && sunPopupFrameCounter <= NUM_FRAMES_SUN_POPUP {
            sunPopupFrameCounter += 1
            if muted == false && playSunPopup {
                playSound(scene: scene, sound: [SUN_POPUP_SOUND])
                playSunPopup = false
            }
            
            SUN_POPUP_SPR.zPosition = Z_POS_SUN
        }
        else {
            //Reset sun popup zposition
            SUN_POPUP_SPR.zPosition = -1
        }
    }
    
    func flagPopup() {
        
        if gameScore == 0 {
            if startSave {
                startSave = false
                
                // Spawn thread to save state
                class MyThread: Thread {
                    var base : GameLevel
                    init(base : GameLevel) {
                        self.base = base
                    }
                    override func main() {
                        base.saveState()
                    }
                }

                let thread = MyThread(base : self)
                thread.start()
            }
        }
        
        if gameScore >= flagNum * flagFrequency && flagPopupFrameCounter <= NUM_FRAMES_FLAG_POPUP && numLives > 0 {
            
            flagPopupFrameCounter += 1
            
            if muted == false && playFlagPopup {
                playSound(scene: scene, sound: [SUN_POPUP_SOUND])
                playFlagPopup = false
            }
            
            flag.setZPosition(zPos: Z_POS_FLAG)
            
            if startThread {
                startThread = false
                
                // Spawn thread to save state
                class MyThread: Thread {
                    var base : GameLevel
                    init(base : GameLevel) {
                        self.base = base
                    }
                    override func main() {
                        base.saveState()
                    }
                }

                let thread = MyThread(base : self)
                thread.start()
            }
        }
        else if flagPopupFrameCounter > NUM_FRAMES_FLAG_POPUP {
            
            flagNum += 1
            flagPopupFrameCounter = 0
            playFlagPopup = true
            startThread = true
            
            //Reset flag popup zposition
            flag.setZPosition(zPos: -1)
        }
    }
    
    func updateNumberOfBirds() {
        if gameScore >= bound_tracker * NUM_POINTS_WHEN_BIRDS_APPEAR && birds.count < TOT_NUM_BIRDS {
            
            let image_names = self.birds[0].imageNames
            let size = self.birds[0].images[0].size
            
            let bird = Bird(birds: image_names, size: size, zPos: CGFloat(birds.count) + MIN_Z_POS_BIRDS)
            bird.addImagesToScene(scene : scene)
            
            birds.append(bird)
            
            bound_tracker += 1
        }
    }
    
    func updateNumJelly() {
        if gameScore >= bound_tracker * NUM_POINTS_WHEN_BIRDS_APPEAR && jellyfishes.count < TOT_NUM_BIRDS {
            
            let image_names = self.jellyfishes[0].imageNames
            let size = self.jellyfishes[0].images[0].size
            
            let jelly = JellyFish(jelly_fish: image_names, size: size, z_pos: CGFloat(jellyfishes.count) + MIN_Z_POS_BIRDS)
            jelly.addImagesToScene(scene : scene)
            
            jellyfishes.append(jelly)
            
            bound_tracker += 1
        }
    }
    
    func runContinue(high_score_id: String, GameLevel : SKScene) {
        let defaults = UserDefaults()
        if gameScore > highScore {
            defaults.set(gameScore, forKey: high_score_id)
        }
        
        player.setZPosition(zPos: -1)
        player.setZPositionHit(zPos: Z_POS_PLAYER)
        var start = true
        startScene(scene : scene, start : &start, GameLevel : GameLevel)
    }
    
    func runRestart(high_score_id: String) {
        runGameOver(high_score_id: high_score_id)
    }
    
    func runGameOver(high_score_id : String) {
        let defaults = UserDefaults()
        
        if gameScore > highScore {
            defaults.set(gameScore, forKey: high_score_id)
        }
        
        player.setZPosition(zPos: -1)
        player.setZPositionHit(zPos: Z_POS_PLAYER)
        
        playing = false
        defaults.set(playing, forKey: String(levelId) + PLAYING)
        
        let changeSceneAction = SKAction.run(changeScene)
        let waitToChangeScene = SKAction.wait(forDuration: 1)
        let changeSceneSequence = SKAction.sequence([waitToChangeScene, changeSceneAction])
        scene.run(changeSceneSequence)
    }
    
    func showRestartContinue() {
        
        player.setZPosition(zPos: -1)
        player.setZPositionHit(zPos: Z_POS_PLAYER)
        continueButton.images[0].zPosition = Z_POS_CONTINUE
        restartButton.images[0].zPosition = Z_POS_RESTART
        
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
        PAUSE_BUTTON.zPosition = Z_POS_PAUSE
        PLAY_BUTTON.zPosition = -1
    }
    
    func pauseGame() {
        currentGameState = GameState.gamePaused
        PAUSE_BUTTON.zPosition = -1
        PLAY_BUTTON.zPosition = Z_POS_PAUSE
    }
    
    func endGame() {
        currentGameState = GameState.afterGame
    }
    
    func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if currentGameState == GameState.preGame {
            startGame()
            player.setVelocity(velX: 0, velY: 0)
        }
        else if currentGameState == GameState.inGame {
            
            for touch: AnyObject in touches {
                let pointOfTouch = touch.location(in: scene)
                
                // Position defines the boundaries of the pause / play button
                let position = CGPoint(x: scene.size.width - 2 * scene.size.width / 12, y: scene.size.height / 2 + scene.size.height * 1.5 / 10)
                
                let touch_in_game_area = pointOfTouch.x > 0 && pointOfTouch.x < scene.size.width && pointOfTouch.y > scene.size.height / 4 && pointOfTouch.y < 0.75 * scene.size.height
                
                if pointOfTouch.x > position.x && pointOfTouch.y > position.y {
                    pauseGame()
                }
                else if touch_in_game_area {
                    player.setPosition(position: pointOfTouch)
                    player.setVelocity(velX: 0, velY: 0)
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
                
                let p1 = continueButton.images[0].position
                let w1 = continueButton.images[0].size.width / 2
                let h1 = continueButton.images[0].size.height / 2
                let p2 = restartButton.images[0].position
                let w2 = restartButton.images[0].size.width / 2
                let h2 = restartButton.images[0].size.height / 2
                if point.x > p1.x - w1 && point.x < p1.x + w1 && point.y > p1.y - h1 && point.y < p1.y + h1 {
                    continueButton.imagesHit[0].zPosition = Z_POS_CONTINUE
                    continueButton.images[0].zPosition = -1
                    let defaults = UserDefaults()
                    playing = true
                    defaults.set(playing, forKey: String(levelId) + PLAYING)
                    
                    if levelId == LEVEL_ID_1 {
                        runContinue(high_score_id: HIGH_SCORE_ID_1, GameLevel: GameLevel1(size: scene.size))
                    }
                    if levelId == LEVEL_ID_2 {
                        runContinue(high_score_id: HIGH_SCORE_ID_2, GameLevel: GameLevel2(size: scene.size))
                    }
                    if levelId == LEVEL_ID_3 {
                        runContinue(high_score_id: HIGH_SCORE_ID_3, GameLevel: GameLevel3(size: scene.size))
                    }
                    if levelId == LEVEL_ID_4 {
                        runContinue(high_score_id: HIGH_SCORE_ID_4, GameLevel: GameLevel4(size: scene.size))
                    }
                    if levelId == LEVEL_ID_5 {
                        runContinue(high_score_id: HIGH_SCORE_ID_5, GameLevel: GameLevel5(size: scene.size))
                    }
                }
                
                if point.x > p2.x - w2 && point.x < p2.x + w2 && point.y > p2.y - h2 && point.y < p2.y + h2 {
                    restartButton.imagesHit[0].zPosition = Z_POS_RESTART
                    restartButton.images[0].zPosition = -1
                    let defaults = UserDefaults()
                    playing = false
                    defaults.set(playing, forKey: String(levelId) + PLAYING)
                    if levelId == LEVEL_ID_1 {
                        runRestart(high_score_id: HIGH_SCORE_ID_1)
                    }
                    if levelId == LEVEL_ID_2 {
                        runRestart(high_score_id: HIGH_SCORE_ID_2)
                    }
                    if levelId == LEVEL_ID_3 {
                        runRestart(high_score_id: HIGH_SCORE_ID_3)
                    }
                    if levelId == LEVEL_ID_4 {
                        runRestart(high_score_id: HIGH_SCORE_ID_4)
                    }
                    if levelId == LEVEL_ID_5 {
                        runRestart(high_score_id: HIGH_SCORE_ID_5)
                    }
                }
            }
        }
    }
    
    func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.ro = player.images[0].position
        
        if currentGameState == GameState.preGame {
            startGame()
            player.setVelocity(velX: 0, velY: 0)
        }
        else if currentGameState == GameState.inGame && moveCounter > 10 {
            
            moveCounter = 11
            
            for touch: AnyObject in touches {
                let pointOfTouch = touch.location(in: scene)
                
                let position = CGPoint(x: scene.size.width - 3 * scene.size.width / 12, y: scene.size.height / 2 + scene.size.height * 1.5 / 10)
                
                let touch_in_game_area = pointOfTouch.x > 0 && pointOfTouch.x < scene.size.width && pointOfTouch.y > scene.size.height / 4 && pointOfTouch.y < 0.75 * scene.size.height
                
                if pointOfTouch.x > position.x  && pointOfTouch.y > position.y {
                    // Do nothing
                }
                else if touch_in_game_area {
                    player.setPosition(position: pointOfTouch)
                    
                    var vel_x = (self.player.images[0].position.x - self.ro.x) / 2
                    var vel_y = (self.player.images[0].position.y - self.ro.y) / 2
                    
                    let min_speed2 = 3.1
                    let speed2 = vel_x * vel_x + vel_y * vel_y

                    if speed2 < CGFloat(min_speed2) {
                        vel_x = 0
                        vel_y = 0
                    }
                    
                    player.setVelocity(velX: vel_x, velY: vel_y)
                }
            }
        }
    }
}

