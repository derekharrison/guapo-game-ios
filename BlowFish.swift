//
//  BlowFish.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class BlowFish : GameObject {
    
    override init() {
        super.init()
    }
    
    func update(scene : SKScene, at : Int) {
        if !self.hit {
            self.updatePosition(scene: scene, at_screen : at)
        }
        if self.hit {
            self.updatePosition(scene: scene, at_screen: at)
        }
        
        updateImage(numFrames: NUM_FRAMES_BIRD)
    }
    
    func updatePosition(scene : SKScene, at_screen : Int) {
        
        self.images[0].position.x += self.velX
        self.images[0].position.y += self.velY
        
        if self.images[0].position.x < -self.images[0].size.width {
            
            self.playSound = true
            self.playHitSound = true
            self.hit = false
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = getRandomNumber() * scene.size.width + CGFloat(at_screen) * scene.size.width
            self.images[0].position.y = getRandomNumber() * scene.size.height / 2 * factor  + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
        }
        for x in self.images {
            x.position = self.images[0].position
        }
        
        for x in self.imagesHit {
            x.position = self.images[0].position
        }
        
        self.posX = images[0].position.x
        self.posY = images[0].position.y
    }
}
