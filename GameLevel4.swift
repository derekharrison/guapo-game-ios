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
        
        var imagesBrownie = [String]()
        imagesBrownie.append(BROWNIE_OCEAN_1)
        imagesBrownie.append(BROWNIE_OCEAN_2)
        base.addBubbles(bubbles: base.brownie.bubbles, bubbleImage: BUBBLE_IMAGE_STR)
        
        for x in base.brownie.bubbles.bubblez {
            x.removeFromParent()
            self.addChild(x)
        }
        
        base.initImagesBrownie(images: imagesBrownie, height: self.size.height, width: self.size.width)
        
        var imagesMisty = [String]()
        imagesMisty.append(MISTY_OCEAN_1)
        imagesMisty.append(MISTY_OCEAN_2)
        imagesMisty.append(MISTY_OCEAN_3)
        imagesMisty.append(MISTY_OCEAN_4)
        base.addBubbles(bubbles: base.misty.bubbles, bubbleImage: BUBBLE_IMAGE_STR)
        
        for x in base.misty.bubbles.bubblez {
            x.removeFromParent()
            self.addChild(x)
        }
        
        base.initImagesMisty(images: imagesMisty, height: self.size.height, width: self.size.width)
        
        base.initBackground(scene: self, numBackgrounds: NUM_BACKGROUNDS_LEVEL_4, string1: BACKGROUND_STR_LEVEL_4)
        
        var jellyImages = [String]()
        
        jellyImages.append(JELLY_IMAGE_1)
        jellyImages.append(JELLY_IMAGE_2)
        jellyImages.append(JELLY_IMAGE_3)
        
        base.addJellyfish(images : jellyImages)
        
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

