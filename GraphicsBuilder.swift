import SpriteKit

class GraphicsBuilder {
    
    private var graphics : Graphics = Graphics()
    private var scene : SKScene = SKScene()
    private var levelId: LevelId = LevelId.ARUBA
    
    init() {}
    
    func graphics(graphics: Graphics) -> Self {
        self.graphics = graphics
        return self
    }
    
    func scene(scene: SKScene) -> Self {
        self.scene = scene
        return self
    }
    
    func id(id: LevelId) -> Self {
        self.levelId = id
        return self
    }
    
    func build() {
        createCommon()
        createPlayer()
        createFrito()
        createBrownie()
        createMisty()
        
        createBackgrounds()
        
        if levelId != LevelId.OCEAN {
            createBirds()
        }
        else {
            createJellyFishes()
        }
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
    
    func createBackgrounds() {
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
        
        for i in 0..<getNumBackgrounds() {
            let string2 = String(i + 1)
            let imageName = getBackgroundPrefix() + string2
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
    
    private func getNumBackgrounds() -> Int {
        if(levelId == LevelId.ARUBA) {
            return numberOfBackgroundImagesArubaLevel
        }
        if(levelId == LevelId.BEACH) {
            return numberOfBackgroundImagesBeachLevel
        }
        if(levelId == LevelId.TRIP) {
            return numberOfBackgroundImagesTripLevel
        }
        if(levelId == LevelId.OCEAN) {
            return numberOfBackgroundImagesOceanLevel
        }
        if(levelId == LevelId.UTREG) {
            return numberOfBackgroundImagesUtrechtLevel
        }
        return numberOfBackgroundImagesArubaLevel
    }
    
    private func getBackgroundPrefix() -> String {
        if(levelId == LevelId.ARUBA) {
            return backgroundArubaLevelPrefix
        }
        if(levelId == LevelId.BEACH) {
            return backgroundBeachLevelPrefix
        }
        if(levelId == LevelId.TRIP) {
            return backgroundTripLevelPrefix
        }
        if(levelId == LevelId.OCEAN) {
            return backgroundOceanLevelPrefix
        }
        if(levelId == LevelId.UTREG) {
            return backgroundUtrechtLevelPrefix
        }
        return backgroundArubaLevelPrefix
    }
    
    func createFrito() {
        for image in FritoImages.getImages(levelId: levelId) {
            graphics.frito.addImage(image : image)
        }
        graphics.frito.setHeight(height : scene.size.height)
        graphics.frito.setWidth(width : scene.size.width)
        graphics.frito.setSize(size: CGSize(width : scene.size.width / 7.5, height : scene.size.height / 7.5))
        graphics.frito.setVelocity(velX: 2 * graphics.backgroundSpeed, velY: -2 * graphics.backgroundSpeed)
        graphics.frito.setZPosition(zPos: zPosCharacters)
        graphics.frito.setPosition(position: CGPoint(x : 10 * scene.size.width, y : scene.size.height * 0.75 + graphics.frito.images[0].size.height / 2))
        graphics.frito.addImagesToScene(scene: scene)
    }
    
    func createBrownie() {
        for image in BrownieImages.getBrownieImages(levelId: levelId) {
            graphics.brownie.addImage(image : image)
        }
        let height = scene.size.height
        let width = scene.size.width
        graphics.brownie.setHeight(height : height)
        graphics.brownie.setWidth(width : width)
        graphics.brownie.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        graphics.brownie.setVelocity(velX: -2 * graphics.backgroundSpeed, velY: -2 * graphics.backgroundSpeed)
        graphics.brownie.setZPosition(zPos: zPosCharacters + 1)
        graphics.brownie.setPosition(position: CGPoint(x : -width, y: height * 0.75 + graphics.brownie.images[0].size.height / 2))
        
        graphics.brownie.addImagesToScene(scene: scene)
    }
    
    func createMisty() {
        for image in MistyImages.getMistyImages(levelId: levelId) {
            graphics.misty.addImage(image : image)
        }
        let height = scene.size.height
        let width = scene.size.width
        graphics.misty.setHeight(height : height)
        graphics.misty.setWidth(width : width)
        graphics.misty.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        graphics.misty.setVelMisty(vx: 0, vy: -graphics.backgroundSpeed)
        graphics.misty.setZPosition(zPos: zPosCharacters + 2)
        graphics.misty.setPosition(position: CGPoint(x : width / 2, y : height * 0.75 + graphics.misty.images[0].size.height / 2))
        
        graphics.misty.addImagesToScene(scene: scene)
    }
    
    func createBirds() {
        for j in 0..<numBirds {
            
            var birdImages = [String]()
            
            for x in VillainImages.getVillainImages(levelId: levelId) {
                birdImages.append(x)
            }
            
            let zPosition = CGFloat(j) + minZPosVillains
            let size = CGSize(width: scene.size.width / 10, height: scene.size.height / 10)
            
            let bird = Bird(birds: birdImages, size: size, zPos: zPosition)
            
            bird.addImagesToScene(scene : scene)

            self.graphics.birds.append(bird)
            
        }
    }
    
    func createJellyFishes() {
        for j in 0..<numJellyFish {
            
            var birdImages = [String]()
            
            for x in VillainImages.getVillainImages(levelId: levelId) {
                birdImages.append(x)
            }
            
            let zPosition = CGFloat(j) + minZPosVillains
            let size = CGSize(width: scene.size.width / 10, height: scene.size.height / 10)
            
            let jellyFish = JellyFish(jellyFish: birdImages, size: size, zPos: zPosition)
            
            jellyFish.addImagesToScene(scene : scene)

            self.graphics.jellyfishes.append(jellyFish)
            
        }
    }
    
    func createCommon() {
        let levelId = self.levelId
        
        graphics.backgroundSpeed = scene.size.width / 400
        
        let width = scene.size.width
        let height = scene.size.height
        
        createSnacks(scene : scene)
        
        let defaults = UserDefaults()
        if levelId == LevelId.ARUBA {
            graphics.highScore = defaults.integer(forKey: highScoreId1)
        }
        if levelId == LevelId.BEACH {
            graphics.highScore = defaults.integer(forKey: highScoreId2)
        }
        if levelId == LevelId.TRIP {
            graphics.highScore = defaults.integer(forKey: highScoreId3)
        }
        if levelId == LevelId.OCEAN {
            graphics.highScore = defaults.integer(forKey: highScoreId4)
            createFish(width: width, height: height)
        }
        if levelId == LevelId.UTREG {
            graphics.highScore = defaults.integer(forKey: highScoreId5)
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
    }

    func createFish(width : CGFloat, height : CGFloat) {
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
    
    func createSnacks(scene : SKScene) {
        createSnack(bite : cheesyBiteImage, points: pointsForCheesyBite, numCheesyBites : Parameters.numberOfCheesyBites, snacks : &graphics.cheesyBites, scene : scene)
        
        createSnack(bite : paprikaImage, points: pointsForPaprika, numCheesyBites : totalNumberOfPaprika, snacks : &graphics.paprikas, scene : scene)
        
        createSnack(bite : broccoliImage, points: pointsForBroccoli, numCheesyBites : totalNumberOfBroccoli, snacks : &graphics.broccolis, scene : scene)
        
        createSnack(bite : cucumberImage, points: pointsForCucumber, numCheesyBites : totalNumberOfCucumbers, snacks : &graphics.cucumbers, scene : scene)
        
        createSnack(bite : begginStripImage, points: pointsBegginStrip, numCheesyBites : totalNumberOfBegginStrips, snacks : &graphics.begginStrips, scene : scene)
        
        // Move beggin strips out of bounds
        for strip in graphics.begginStrips {
            strip.setPosition(position: CGPoint(x : -1000, y : 0))
        }
    }
    
    func createSnack(bite : String, points : Int, numCheesyBites : Int, snacks : inout [Snack], scene : SKScene) {
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
    
    func createBackgrounds(numBackgrounds : Int, string1 : String) {
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
}
