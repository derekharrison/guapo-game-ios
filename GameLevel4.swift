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
    var num_backgrounds : Int = NUM_BACKGROUNDS_LEVEL_4
    
    override func update(_ currentTime: TimeInterval) {
        base.updateOcean(scene: self)
    }
    
    override func didMove(to view: SKView) {
        base.didMoveOcean(scene: self, id : LEVEL_ID_4)

        base.addBubbles(bubbles: base.player.bubbles, bubbleImage: BUBBLE_IMAGE_STR)

        var images = [String]()
        images.append(FRITO_OCEAN_1)
        images.append(FRITO_OCEAN_2)
        base.addBubbles(bubbles: base.frito.bubbles, bubbleImage: BUBBLE_IMAGE_STR)
        
        for x in base.frito.bubbles.bubblez {
            x.removeFromParent()
            self.addChild(x)
        }
        
        base.initImagesFrito(images: images, height: self.size.height, width: self.size.width)
        
        var images_brownie = [String]()
        images_brownie.append(BROWNIE_OCEAN_1)
        images_brownie.append(BROWNIE_OCEAN_2)
        base.addBubbles(bubbles: base.brownie.bubbles, bubbleImage: BUBBLE_IMAGE_STR)
        
        for x in base.brownie.bubbles.bubblez {
            x.removeFromParent()
            self.addChild(x)
        }
        
        base.initImagesBrownie(images: images_brownie, height: self.size.height, width: self.size.width)
        
        var images_misty = [String]()
        images_misty.append(MISTY_OCEAN_1)
        images_misty.append(MISTY_OCEAN_2)
        images_misty.append(MISTY_OCEAN_3)
        images_misty.append(MISTY_OCEAN_4)
        base.addBubbles(bubbles: base.misty.bubbles, bubbleImage: BUBBLE_IMAGE_STR)
        
        for x in base.misty.bubbles.bubblez {
            x.removeFromParent()
            self.addChild(x)
        }
        
        base.initImagesMisty(images: images_misty, height: self.size.height, width: self.size.width)
        
        base.initBackground(scene: self, numBackgrounds: num_backgrounds, string1: BACKGROUND_STR_LEVEL_4)
        
        var jelly_images = [String]()
        
        jelly_images.append(JELLY_IMAGE_1)
        jelly_images.append(JELLY_IMAGE_2)
        jelly_images.append(JELLY_IMAGE_3)
        
        base.addJellyfish(images : jelly_images)
        
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

