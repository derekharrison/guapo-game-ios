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
    
    var base = GameLevel()

    override func update(_ _: TimeInterval) {
        base.update()
    }
    
    override func didMove(to _: SKView) {
        base.didMove(scene: self, id: LEVEL_ID_2)
        var images = [String]()
        images.append(fritoImage)
        images.append(fritoHitImage)
        
        base.initImagesFrito(images: images, height: self.size.height, width: self.size.width)
        base.initBackground(scene: self, numBackgrounds: numberOfBackgroundImagesBeachLevel, string1: backgroundBeachLevelPrefix)
        
        var imagesBrownie = [String]()
        imagesBrownie.append(brownieImage)
        imagesBrownie.append(brownieHitImage)
        
        base.initImagesBrownie(images: imagesBrownie, height: self.size.height, width: self.size.width)
        
        var imagesMisty = [String]()
        imagesMisty.append(mistyImage)
        imagesMisty.append(mistyHitImage)
        imagesMisty.append(mistyRotatedImage)
        imagesMisty.append(mistyRotatedHitImage)
        base.initImagesMisty(images: imagesMisty, height: self.size.height, width: self.size.width)
        
        var birdImages = [String]()
        
        birdImages.append(seagullImage1)
        birdImages.append(seagullImage2)
        birdImages.append(seagullImage3)
        
        base.addBirds(images: birdImages)
        
        if base.playing {
            base.getState()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        base.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        base.touchesMoved(touches, with: event)
    }
}

