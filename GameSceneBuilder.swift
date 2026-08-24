//
//  GameSceneBuilder.swift
//  SoloMission
//
//  Created by Derek Harrison on 24/08/2026.
//

import SpriteKit

class GameSceneBuilder {
    
    private var fritoImages = [String]()
    private var mistyImages = [String]()
    private var brownieImages = [String]()
    private var birdImages = [String]()
    private var jellyImages = [String]()
    private var numBackgrounds : Int = 0
    private var backgroundPrefix: String = ""
    private var gameScene : GameScene = GameScene()
    private var scene : SKScene = SKScene()
    private var width: CGFloat = .zero
    private var height: CGFloat = .zero
    private var levelId: LevelId = LevelId.ARUBA
    
    func fritoImages(_ fritoImages: [String]) -> Self {
        self.fritoImages = fritoImages
        return self
    }
    
    func mistyImages(_ mistyImages: [String]) -> Self {
        self.mistyImages = mistyImages
        return self
    }
    
    func brownieImages(_ brownieImages: [String]) -> Self {
        self.brownieImages = brownieImages
        return self
    }
    
    func birdImages(_ birdImages: [String]) -> Self {
        self.birdImages = birdImages
        return self
    }
    
    func jellyImages(_ jellyImages: [String]) -> Self {
        self.jellyImages = jellyImages
        return self
    }
    
    func scene(scene : SKScene) -> Self {
        self.scene = scene
        return self
    }
    
    func width(width : CGFloat) -> Self {
        self.width = width
        return self
    }
    
    func height(height : CGFloat) -> Self {
        self.height = height
        return self
    }
    
    func numBackgrounds(_ numBackgrounds: Int) -> Self {
        self.numBackgrounds = numBackgrounds
        return self
    }
    
    func backgroundPrefix(_ backgroundPrefix: String) -> Self {
        self.backgroundPrefix = backgroundPrefix
        return self
    }
    
    func levelId(_ levelId: LevelId) -> Self {
        self.levelId = levelId
        return self
    }
    
    func build() -> GameScene {
        gameScene.createScene(scene: scene, id: levelId1)
        gameScene.createFrito(images: fritoImages, height: self.height, width: self.width)
        gameScene.createBackgrounds(scene: scene, numBackgrounds: numBackgrounds, string1: backgroundPrefix)
        gameScene.createBrownie(images: brownieImages, height: scene.size.height, width: scene.size.width)
        gameScene.createMisty(images: mistyImages, height: scene.size.height, width: scene.size.width)
        if levelId != LevelId.OCEAN {
            gameScene.createBirds(images: birdImages)
        }
        else {
            gameScene.createJellyFishes(images: jellyImages)
        }
        return gameScene
    }
}
