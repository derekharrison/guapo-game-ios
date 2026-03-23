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
    var num_backgrounds : Int = NUM_BACKGROUNDS_LEVEL_1
    
    override func update(_ currentTime: TimeInterval) {
        base.update()
    }
    
    override func didMove(to view: SKView) {
        base.didMove(scene: self, id: LEVEL_ID_1)
        
        var images = [String]()
        images.append(FRITO_IMAGE_1)
        images.append(FRITO_IMAGE_2)
        
        base.initImagesFrito(images: images, height: self.size.height, width: self.size.width)
        base.initBackground(scene: self, numBackgrounds: num_backgrounds, string1: BACKGROUND_STR_LEVEL_1)
        
        var images_brownie = [String]()
        images_brownie.append(BROWNIE_IMAGE_1)
        images_brownie.append(BROWNIE_IMAGE_2)
        
        base.initImagesBrownie(images: images_brownie, height: self.size.height, width: self.size.width)
        
        var images_misty = [String]()
        images_misty.append(MISTY_IMAGE_1)
        images_misty.append(MISTY_IMAGE_2)
        images_misty.append(MISTY_IMAGE_3)
        images_misty.append(MISTY_IMAGE_4)
        base.initImagesMisty(images: images_misty, height: self.size.height, width: self.size.width)
        
        var bird_images = [String]()
        
        bird_images.append(BIRD_IMAGE_WARA_1)
        bird_images.append(BIRD_IMAGE_WARA_2)
        bird_images.append(BIRD_IMAGE_WARA_3)
        
        base.addBirds(images: bird_images)
        
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

