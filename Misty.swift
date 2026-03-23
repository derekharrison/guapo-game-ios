//
//  Misty.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation


class Misty : GameObject {
    var top : Bool
    var counter1 = 1000
    var counter2 = 1000
    
    override init() {
        self.top = true
        super.init()
        self.height = 100000
        self.width = -100000
        self.setPosition(position: CGPoint(x: -5000, y: 0))
    }
    
    override func update() {
        super.update()
        updatePositionMisty()
    }
    
    func updatePositionMisty() {
        for image in images {
            image.position.x += self.velX
            image.position.y += self.velY
        }
        for image in imagesHit {
            image.position = images[0].position
        }
        
        self.posX = images[0].position.x
        self.posY = images[0].position.y
    }
    
    func play(bool : Bool) {
        self.counter1 = 1;
        self.counter2 = 1;
        
        self.top = bool
    }
    
    func set_vel_misty(vx : CGFloat, vy : CGFloat) {
        self.setVelocity(velX: vx, velY: vy)
    }
    
    func setPosition(pos : CGPoint) {
        if !top {
            self.images[0].position = pos
            self.images[1].position = pos
        }
        else {
            self.images[2].position = pos
            self.images[3].position = pos
        }
    }
    
    func popMisty(height : CGFloat, speed : CGFloat) {
        
        if !self.hit && top {
            self.displayImageNotHit(imageId: 2)
        }
        
        if self.hit && top {
            self.displayImageNotHit(imageId: 3)
        }
        
        if !self.hit && !top {
            self.displayImageNotHit(imageId: 0)
        }
        
        if self.hit && !top {
            self.displayImageNotHit(imageId: 1)
        }
        
        if counter1 < NUM_FRAMES_MISTY {
            self.updatePositionMisty()
            counter1 += 1
        }
        
        else if counter1 == NUM_FRAMES_MISTY {
            self.velY = -self.velY
            counter1 += 1
        }
        
        else if counter1 < NUM_FRAMES_MISTY + 60 {
            self.updatePositionMisty()
            counter1 += 1
        }
    }
}
