//
//  Misty.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit


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
    
    func update(scene : SKScene) {
        super.update()
        updatePositionMisty(scene: scene)
        
        if(State.levelId == LevelId.OCEAN) {
            bubbles.popBubbles(pos: getPosition(), scene: scene, sound: [bubblesSound])
        }
    }
    
    func updatePositionMisty(scene : SKScene) {
        for image in images {
            image.position.x += self.velX
            image.position.y += self.velY
        }
        for image in imagesHit {
            image.position = images[0].position
        }
        
        self.posX = images[0].position.x
        self.posY = images[0].position.y
        
        if(State.levelId == LevelId.OCEAN) {
            bubbles.popBubbles(pos: getPosition(), scene: scene, sound: [bubblesSound])
        }
    }
    
    func play(bool : Bool) {
        self.counter1 = 1;
        self.counter2 = 1;
        
        self.top = bool
    }
    
    func setVelMisty(vx : CGFloat, vy : CGFloat) {
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
    
    func popMisty(scene : SKScene) {
        
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
        
        if counter1 != numFramesMisty && counter1 < numFramesMisty + 60 {
            self.updatePositionMisty(scene: scene)
            counter1 += 1
        }
        else if counter1 == numFramesMisty {
            self.velY = -self.velY
            counter1 += 1
        }
    }
}
