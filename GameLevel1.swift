//
//  GameLevel1.swift
//  SoloMission
//
//  Created by Derek Harrison on 25/09/2023.
//

import Foundation
import SpriteKit

class GameLevel1 : SKScene {
    
    var base = GameLevel()
    var numBackgrounds: Int = NUM_BACKGROUNDS_LEVEL_1
    
    override func update(_ currentTime: TimeInterval) {
        base.update()
    }
    
    override func didMove(to view: SKView) {
        base.didMove(scene: self, id: LEVEL_ID_1)
        
        var images = [String]()
        images.append(FRITO_IMAGE_1)
        images.append(FRITO_IMAGE_2)
        
        base.initImagesFrito(images: images, height: self.size.height, width: self.size.width)
        base.initBackground(scene: self, numBackgrounds: numBackgrounds, string1: BACKGROUND_STR_LEVEL_1)
        
        var imagesBrownie = [String]()
        imagesBrownie.append(BROWNIE_IMAGE_1)
        imagesBrownie.append(BROWNIE_IMAGE_2)
        
        base.initImagesBrownie(images: imagesBrownie, height: self.size.height, width: self.size.width)
        
        var imagesMisty = [String]()
        imagesMisty.append(MISTY_IMAGE_1)
        imagesMisty.append(MISTY_IMAGE_2)
        imagesMisty.append(MISTY_IMAGE_3)
        imagesMisty.append(MISTY_IMAGE_4)
        base.initImagesMisty(images: imagesMisty, height: self.size.height, width: self.size.width)
        
        var birdImages = [String]()
        
        birdImages.append(BIRD_IMAGE_WARA_1)
        birdImages.append(BIRD_IMAGE_WARA_2)
        birdImages.append(BIRD_IMAGE_WARA_3)
        
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

