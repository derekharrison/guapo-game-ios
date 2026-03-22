//
//  Brownie.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class Brownie : GameObject {
    
    override init() { super.init() }
    
    func update(scene : SKScene) {
        super.update()
        self.reflect(scene : scene)
        self.updatePosition(scene : scene, at_screen : 10)
        updateImage(numFrames: NUM_FRAMES_BIRD)
        if hit {
            self.displayImageNotHit(image_id: 1)
        }
        
        if !hit {
            self.displayImageNotHit(image_id: 0)
        }
        
        self.appeared = self.images[0].position.x > 0 && self.images[0].position.x < scene.size.width
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
    
    func reflect(scene : SKScene) {
        if self.images[0].position.y < 0.25 * scene.size.height {
            self.images[0].position.y = 0.25 * scene.size.height
            self.velY = -self.velY
        }
        if self.images[0].position.y > 0.75 * scene.size.height {
            self.images[0].position.y = 0.75 * scene.size.height
            self.velY = -self.velY
        }
        self.posX = images[0].position.x
        self.posY = images[0].position.y
    }
}
