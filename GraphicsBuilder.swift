import SpriteKit

class GraphicsBuilder {
    
    var graphics : Graphics = Graphics()
    var scene : SKScene = SKScene()
    var id: Int = 0
    
    init() {}
    
    func graphics(graphics: Graphics) -> Self {
        self.graphics = graphics
        return self
    }
    
    func scene(scene: SKScene) -> Self {
        self.scene = scene
        return self
    }
    
    func id(id: Int) -> Self {
        self.id = id
        return self
    }
    
    func build() {
        initCommon()
        createPlayer()
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
    
    func initCommon() {
        let levelId = self.id
        
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
            initFish(width: width, height: height)
        }
        if levelId == levelId5 {
            graphics.highScore = defaults.integer(forKey: highScoreId5)
        }

        muteBubbles(bubbles : graphics.player.bubbles, mute : muted)
        muteBubbles(bubbles : graphics.frito.bubbles, mute : muted)
        muteBubbles(bubbles : graphics.brownie.bubbles, mute : muted)
        muteBubbles(bubbles : graphics.misty.bubbles, mute : muted)

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
    
    func muteBubbles(bubbles : Bubbles, mute : Bool) {
        bubbles.isMuted = mute
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
}
