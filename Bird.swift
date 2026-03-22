//
//  Bird.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class Bird : GameObject {
    
    override init() { super.init() }
    
    init(birds : [String], size : CGSize, zPos : CGFloat) {
        super.init()
        
        for x in birds {
            self.addImage(image: x)
        }
        
        self.setPosition(position: CGPoint(x: -5000, y: 0))
        self.setZPosition(zPos: zPos)
        self.setSize(size: size)
    }
    
    func update(scene : SKScene, backgroundSpeed : CGFloat) {
        super.update()
        updateImage(numFrames: NUM_FRAMES_BIRD)
        updatePosition(scene: scene, backgroundSpeed: backgroundSpeed)
    }
    
    func updatePosition(scene : SKScene, backgroundSpeed : CGFloat) {
        
        self.images[0].position.x += self.velX
        self.images[0].position.y += self.velY
        
        if self.images[0].position.x < -self.images[0].size.width {
            
            let speed = getRandomNumber() * 2 * backgroundSpeed + 1.2 * backgroundSpeed
            setVelocity(vel_x: speed, vel_y: 0)
            
            self.playSound = true
            self.playHitSound = true
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = getRandomNumber() * scene.size.width + scene.size.width
            self.images[0].position.y = getRandomNumber() * scene.size.height / 2 * factor + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
            
            self.hit = false
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
