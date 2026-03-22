//
//  JellyFish.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class JellyFish : GameObject {
    var counter : Int = 1
    
    init(jelly_fish : [String], size : CGSize, z_pos : CGFloat) {
        super.init()
        
        for x in jelly_fish {
            self.addImage(image: x)
        }
        
        self.setPosition(position: CGPoint(x: -5000, y: 0))
        self.setZPosition(zPos: z_pos)
        self.setSize(size: size)
    }
    
    func update(scene : SKScene, backgroundSpeed : CGFloat) {
        super.update()
        updatePosition(scene: scene, backgroundSpeed: backgroundSpeed, numFrames: num_frames_jelly)
        updateImage(numFrames: num_frames_jelly)
        updatePosition()
    }
    
    func updatePosition(scene : SKScene, backgroundSpeed : CGFloat, numFrames : Int) {
        
        self.images[0].position.x += self.velX
        self.images[0].position.y += self.velY
        
        if self.images[0].position.x < -self.images[0].size.width {
            
            let speed = getRandomNumber() * 2 * backgroundSpeed + 1.2 * backgroundSpeed
            setVelocity(velX: speed, velY: 0)
            
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

    func updatePosition() {
        
        if counter < 20 {
            for x in images {
                x.position.y += 2
            }
            counter += 1
        }
        else if counter < 40 {
            for x in images {
                x.position.y -= 2
            }
            counter += 1
        }
        else if counter == 40 {
            counter = 1
        }
    }
}
