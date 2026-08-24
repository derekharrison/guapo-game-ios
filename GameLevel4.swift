//
//  GameLevel4.swift
//  SoloMission
//
//  Created by Derek Harrison on 25/09/2023.
//

import Foundation

import SpriteKit
import GameplayKit

class GameLevel4: SKScene {
    
    var base = GameLevel()
 
    override func update(_ _: TimeInterval) {
        base.updateOcean()
    }
    
    override func didMove(to _: SKView) {
        base.didMoveOcean(scene: self, id : levelId4)
        State.levelId = LevelId.OCEAN

        var images = [String]()
        images.append(fritoSnorkelImage)
        images.append(fritoSNorkelHitImage)


        base.initImagesFrito(images: images, height: self.size.height, width: self.size.width)
        
        var imagesBrownie = [String]()
        imagesBrownie.append(brownieSnorkelImage)
        imagesBrownie.append(brownieSnorkerHitImage)

        base.initImagesBrownie(images: imagesBrownie, height: self.size.height, width: self.size.width)
        
        var imagesMisty = [String]()
        imagesMisty.append(mistySnorkelImage)
        imagesMisty.append(mistySnorkelHitImage)
        imagesMisty.append(mistySnorkelRotatedImage)
        imagesMisty.append(mistySnorkelRotatedHitImage)

        base.initImagesMisty(images: imagesMisty, height: self.size.height, width: self.size.width)
        
        var jellyImages = [String]()
        
        jellyImages.append(jellyFishImage1)
        jellyImages.append(jellyFishImage2)
        jellyImages.append(jellyFishImage3)
        
        base.addJellyFish(images: jellyImages)
        
        base.initBackground(scene: self, numBackgrounds: numberOfBackgroundImagesOceanLevel, string1: backgroundOceanLevelPrefix)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        base.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        base.touchesMoved(touches, with: event)
    }
}

