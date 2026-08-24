//
//  GameLevel2.swift
//  SoloMission
//
//  Created by Derek Harrison on 25/09/2023.
//

import Foundation

import SpriteKit
import GameplayKit

class GameLevel2: SKScene {
    
    var base = GameScene()

    override func update(_ _: TimeInterval) {
        base.update()
    }
    
    override func didMove(to _: SKView) {
        base.createScene(scene: self, id: levelId2)
        
        State.levelId = LevelId.BEACH
        
        var images = [String]()
        images.append(fritoImage)
        images.append(fritoHitImage)
        
        base.createFrito(images: images, height: self.size.height, width: self.size.width)
        base.createBackgrounds(scene: self, numBackgrounds: numberOfBackgroundImagesBeachLevel, string1: backgroundBeachLevelPrefix)
        
        var imagesBrownie = [String]()
        imagesBrownie.append(brownieImage)
        imagesBrownie.append(brownieHitImage)
        
        base.createBrownie(images: imagesBrownie, height: self.size.height, width: self.size.width)
        
        var imagesMisty = [String]()
        imagesMisty.append(mistyImage)
        imagesMisty.append(mistyHitImage)
        imagesMisty.append(mistyRotatedImage)
        imagesMisty.append(mistyRotatedHitImage)
        base.createMisty(images: imagesMisty, height: self.size.height, width: self.size.width)
        
        var birdImages = [String]()
        
        birdImages.append(seagullImage1)
        birdImages.append(seagullImage2)
        birdImages.append(seagullImage3)
        
        base.createBirds(images: birdImages)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        base.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        base.touchesMoved(touches, with: event)
    }
}

