import SpriteKit

class GraphicsBuilder {
    
    private var graphics : Graphics = Graphics()
    private var scene : SKScene = SKScene()
    private var levelId: LevelId = LevelId.ARUBA
    
    func graphics(graphics: Graphics) -> Self {
        self.graphics = graphics
        return self
    }
    
    func scene(scene: SKScene) -> Self {
        self.scene = scene
        return self
    }
    
    func levelId(id: LevelId) -> Self {
        self.levelId = id
        return self
    }
    
    func build() {
        createCommon()
        createPlayer()
        createFrito()
        createBrownie()
        createRocco()
        createFlag()
        createMisty()
        createBackgrounds()
        
        if levelId != LevelId.OCEAN {
            createBirds()
        }
        else {
            createJellyFishes()
            createFish()
        }
    }
    
    private func createPlayer() {
        var playerImages : [String] = [String]()
        let defaults = UserDefaults()
        let playerId = defaults.integer(forKey: "player_id")
        
        if(ModelUtils.getPlayerId(player: playerId) == PlayerId.GUAPO) {
            playerImages.append(guapoImage1)
            playerImages.append(guapoImage2)
            graphics.player = createHero(images: playerImages, imageHit: guapoHitImage)
        }
        if(ModelUtils.getPlayerId(player: playerId) == PlayerId.TUTTI) {
            playerImages.append(tuttiImage1)
            playerImages.append(tuttiImage2)
            graphics.player = createHero(images: playerImages, imageHit: tuttiHitImage)
        }
        if(ModelUtils.getPlayerId(player: playerId) == PlayerId.MIKA) {
            playerImages.append(mikaImage1)
            playerImages.append(mikaImage2)
            graphics.player = createHero(images: playerImages, imageHit: mikaHitImage)
        }
        if(ModelUtils.getPlayerId(player: playerId) == PlayerId.ROCCO) {
            playerImages.append(roccoImage1)
            playerImages.append(roccoImage2)
            graphics.player = createHero(images: playerImages, imageHit: roccoHitImage)
        }
    }
    
    private func createHero(images : [String], imageHit : String) -> Player {
        let size = CGSize(width: scene.size.width / 5, height: scene.size.height / 7.5)
        var builder = PlayerBuilder(scene: scene)
            .images(images: images)
            .imageHit(imageHit: imageHit)
            .size(size: size)
            .zPos(zPos: zPosPlayer)
            .position(position: CGPoint(x : scene.size.width / 5, y : scene.size.height / 2))
            .width(width: scene.size.width)
            .height(height: scene.size.height)
        
        if(State.gameState == .continueGame) {
            let point = getPlayerPosition(key: String(State.levelId.hashValue) + "position")
            builder = builder.position(position: CGPoint(x: point.posX, y: point.posY))
        }
        
        return builder.build()
    }
    
    private func createBackgrounds() {
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
        
        for i in 0..<ModelUtils.getNumBackgrounds(levelId: levelId) {
            let string2 = String(i + 1)
            let imageName = ModelUtils.getBackgroundPrefix(levelId: levelId) + string2
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
        
        if(State.gameState == GameState.continueGame) {
            getBackgrounds(backgrounds: graphics.backgrounds)
        }
    }
    
    private func createFrito() {
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
        
        if(State.gameState == .continueGame) {
            getFrito(object: &graphics.frito, level: State.levelId)
        }
    }
    
    private func createBrownie() {
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
        
        if(State.gameState == .continueGame) {
            getBrownie(object: &graphics.brownie, level: State.levelId)
        }
    }
    
    private func createRocco() {
        for image in RoccoImages.getImages(levelId: levelId) {
            graphics.rocco.addImage(image : image)
        }
        let height = scene.size.height
        let width = scene.size.width
        graphics.rocco.setHeight(height : height)
        graphics.rocco.setWidth(width : width)
        graphics.rocco.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        graphics.rocco.setVelocity(velX: -2 * graphics.backgroundSpeed, velY: -2 * graphics.backgroundSpeed)
        graphics.rocco.setZPosition(zPos: zPosCharacters + 1)
        graphics.rocco.setPosition(position: CGPoint(x : -width, y: height * 0.75 + graphics.brownie.images[0].size.height / 2))
        
        graphics.rocco.addImagesToScene(scene: scene)
    }
    
    private func createFlag() {
        if levelId != LevelId.UTREG {
            graphics.flag.addImage(image : arubanFlag)
        }
        else {
            graphics.flag.addImage(image: dutchFlag)
        }
        let height = scene.size.height
        let width = scene.size.width
        graphics.flag.setHeight(height : height)
        graphics.flag.setWidth(width : width)
        graphics.flag.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        graphics.flag.setZPosition(zPos: -1)
        graphics.flag.setPosition(position: CGPoint(x : width * 0.5, y: height * 0.6))
        
        graphics.flag.addImagesToScene(scene: scene)
    }
    
    private func createMisty() {
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
        
        if(State.gameState == .continueGame) {
            getMisty(object: &graphics.misty, level: State.levelId)
        }
    }
    
    private func createBirds() {
        
        if(State.gameState == .continueGame) {
            numBirds = getNumBirds()
        }
        for j in 0..<Parameters.totalNumberOfVillains + 1 {
            
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
    
    private func createJellyFishes() {
        if(State.gameState == .continueGame) {
            numJellyFish = getNumJellyFish()
        }
        
        for j in 0..<Parameters.totalNumberOfVillains + 1 {
            
            var images = [String]()
            
            for x in VillainImages.getVillainImages(levelId: levelId) {
                images.append(x)
            }
            
            let zPosition = CGFloat(j) + minZPosVillains
            let size = CGSize(width: scene.size.width / 10, height: scene.size.height / 10)
            
            let jellyFish = JellyFish(jellyFish: images, size: size, zPos: zPosition)
            
            jellyFish.addImagesToScene(scene : scene)

            self.graphics.jellyfishes.append(jellyFish)
            
        }
    }
    
    private func createCommon() {
        let width = getSceneWidth()
        let height = getSceneHeight()
        
        initBackgroundSpeed()
        
        createSnacks(scene : scene)
        
        getHighScore()
        
        addLivesToScene(width: width, height: height)
        
        addPauseButtonToScene(width: width, height: height)
        
        addPlayButtonToScene(width: width, height: height)
        
        addSunPopUpToScene(width: width, height: height)
        
        addScoreLabelToScene(width: width, height: height)
    }
    
    private func createFish() {
        let width = scene.size.width
        let height = scene.size.height
        
        createFish(images: FishImages.getFish1Images(), fish: graphics.fish1, width: width, height: height, zPos: Int(minZPosFishes))
        createFish(images: FishImages.getFish2Images(), fish: graphics.fish2, width: width, height: height, zPos: Int(minZPosFishes) + 1)
        createFish(images: FishImages.getFish3Images(), fish: graphics.fish3, width: width, height: height, zPos: Int(minZPosFishes) + 2)
        createFish(images: FishImages.getFish4Images(), fish: graphics.fish4, width: width, height: height, zPos: Int(minZPosFishes) + 3)
        createFishMovingInOppositeDirection(images: FishImages.getFish5Images(), fish: graphics.fish5, width: width, height: height, zPos: Int(minZPosFishes) + 4)
        createFishMovingInOppositeDirection(images: FishImages.getFish6Images(), fish: graphics.fish6, width: width, height: height, zPos: Int(minZPosFishes) + 5)
        createBlowFish(width: width, height: height)
        
        if(State.gameState == .continueGame) {
            getFish(graphics: graphics)
        }
    }
    
    private func createFish(images : [String], fish : Fish, width: CGFloat, height : CGFloat, zPos: Int) {
        for image in images {
            fish.addImage(image: image)
        }
        fish.setHeight(height : height)
        fish.setWidth(width : width)
        fish.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        fish.setPosition(position: CGPoint(x: -1000, y: 0))
        fish.setZPosition(zPos: CGFloat(zPos))
        fish.addImagesToScene(scene: scene)
    }
    
    private func createFishMovingInOppositeDirection(images : [String], fish : Fish, width: CGFloat, height : CGFloat, zPos: Int) {
        for image in images {
            fish.addImage(image: image)
        }
        fish.setHeight(height : height)
        fish.setWidth(width : width)
        fish.setSize(size: CGSize(width : width / 7.5, height : height / 15))
        fish.setPosition(position: CGPoint(x: 10 * width, y: 0))
        fish.setZPosition(zPos: CGFloat(zPos))
        fish.addImagesToScene(scene: scene)
    }
    
    private func createBlowFish(width : CGFloat, height : CGFloat) {
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
    
    private func createSnacks(scene : SKScene) {
        createSnack(bite : cheesyBiteImage, points: pointsForCheesyBite, numCheesyBites : Parameters.numberOfCheesyBites, snacks : &graphics.cheesyBites, scene : scene, snackType: "cheesyBite")
        
        createSnack(bite : paprikaImage, points: pointsForPaprika, numCheesyBites : totalNumberOfPaprika, snacks : &graphics.paprikas, scene : scene, snackType: "paprika")
        
        createSnack(bite : broccoliImage, points: pointsForBroccoli, numCheesyBites : totalNumberOfBroccoli, snacks : &graphics.broccolis, scene : scene, snackType: "broccoli")
        
        createSnack(bite : cucumberImage, points: pointsForCucumber, numCheesyBites : totalNumberOfCucumbers, snacks : &graphics.cucumbers, scene : scene, snackType: "cucumber")
        
        createSnack(bite : begginStripImage, points: pointsBegginStrip, numCheesyBites : totalNumberOfBegginStrips, snacks : &graphics.begginStrips, scene : scene, snackType: "begginStrip")
        
        // Move beggin strips out of bounds
        for strip in graphics.begginStrips {
            strip.setPosition(position: CGPoint(x : -1000, y : 0))
        }
    }
    
    private func createSnack(bite : String, points : Int, numCheesyBites : Int, snacks : inout [Snack], scene : SKScene, snackType: String) {
        for id in 0..<numCheesyBites {
            
            let size = CGSize(width: scene.size.width / 14, height: scene.size.height / 14)
            let biteImage = bite
            
            let cheesyBite = Snack(bite: biteImage, points: pointsForCheesyBite, size: size, zPos: zPosSnacks)
            
            cheesyBite.addImagesToScene(scene: scene)

            let factor = 1.0 - (cheesyBite.getSize().height) / (scene.size.height / 2)
            let posX = getRandomNumber() * scene.size.width * 2
            let posY = getRandomNumber() * scene.size.height / 2 * factor + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
            cheesyBite.setPosition(position: CGPoint(x: posX, y: posY))
            
            if State.gameState == .continueGame {
                let point = getSnackPosition(snack: cheesyBite, snackId: id, snackType: snackType)
                cheesyBite.setPosition(position: CGPoint(x: point.x, y: point.y))
            }
            
            cheesyBite.setVelocity(velX: -graphics.backgroundSpeed, velY: 0)
            cheesyBite.pointsForSnack = points
            snacks.append(cheesyBite)
        }
    }
    
    private func addLivesToScene(width: CGFloat, height: CGFloat) {
        if State.lives >= 1 {
            addLife(node: lifeNode1, width: width, height: height, position: CGPoint(x: width - width / 2, y: height / 2 + height * 1.9 / 10))
        }
        if( State.lives >= 2) {
            addLife(node: lifeNode2, width: width, height: height, position: CGPoint(x: width - width / 2 + width / 26, y: height / 2 + height * 1.9 / 10))
        }
        if State.lives >= 3 {
            addLife(node: lifeNode3, width: width, height: height, position: CGPoint(x: width - width / 2 + width / 13, y: height / 2 + height * 1.9 / 10))
        }
    }
    
    private func addLife(node: SKSpriteNode, width: CGFloat, height: CGFloat, position: CGPoint) {
        node.setScale(1)
        node.size = CGSize(width: width / 28, height: height / 28)
        node.position = position
        node.zPosition = zPosPauseButton
        node.removeFromParent()
        scene.addChild(node)
    }
    
    private func addPauseButtonToScene(width: CGFloat, height: CGFloat) {
        pauseButtonNode.setScale(1)
        pauseButtonNode.size = CGSize(width: width / 28, height: height / 28)
        pauseButtonNode.position = CGPoint(x: width - width / 12, y: height / 2 + height * 1.9 / 10)
        pauseButtonNode.zPosition = zPosPauseButton
        pauseButtonNode.removeFromParent()
        scene.addChild(pauseButtonNode)
    }
    
    private func addPlayButtonToScene(width: CGFloat, height: CGFloat) {
        playButtonNode.setScale(1)
        playButtonNode.size = CGSize(width: width / 28, height: height / 28)
        playButtonNode.position = pauseButtonNode.position
        playButtonNode.zPosition = -1
        playButtonNode.removeFromParent()
        scene.addChild(playButtonNode)
    }
    
    private func addSunPopUpToScene(width: CGFloat, height: CGFloat) {
        sunPopupNode.setScale(1)
        sunPopupNode.size = CGSize(width: width / 7, height: height / 7)
        sunPopupNode.position = CGPoint(x: width / 2 + sunPopupNode.size.width / 5, y: height / 2 + height / 4 - sunPopupNode.size.height / 2 - width / 11)
        sunPopupNode.zPosition = -1
        sunPopupNode.removeFromParent()
        scene.addChild(sunPopupNode)
    }
    
    private func addScoreLabelToScene(width: CGFloat, height: CGFloat) {
        scoreLabelNode.text = "0"
        scoreLabelNode.fontSize = 100
        scoreLabelNode.fontColor = SKColor.gray
        scoreLabelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabelNode.position = CGPoint(x: width / 12, y: height / 2 + height * 1.8 / 10)
        scoreLabelNode.zPosition = zPosPauseButton
        scoreLabelNode.removeFromParent()
        scene.addChild(scoreLabelNode)
    }
    
    private func getHighScore() {
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
        }
        if levelId == LevelId.UTREG {
            graphics.highScore = defaults.integer(forKey: highScoreId5)
        }
    }
    
    private func initBackgroundSpeed() {
        graphics.backgroundSpeed = scene.size.width / 400
    }
    
    private func getSceneWidth() -> CGFloat {
        return scene.size.width
    }
    
    private func getSceneHeight() -> CGFloat {
        return scene.size.height
    }
}
