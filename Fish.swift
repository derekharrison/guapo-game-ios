//
//  Fish.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit


class Fish : GameObject {
    func update(scene : SKScene, backgroundSpeed : CGFloat) {
        super.update()
        updateImage(numFrames: NUM_FRAMES_BIRD)
        updatePosition(scene: scene, backgroundSpeed: backgroundSpeed)
    }
    
    func updatePosition(scene : SKScene, backgroundSpeed : CGFloat) {
        posX += self.velX
        posY += self.velY
        if posX < -self.images[0].size.width {
            updateSpeed(backgroundSpeed: backgroundSpeed);
            updatePosition(scene: scene)
            playSoundAllowed()
            self.hit = false
        }
        
        updateImagePositions()
    }
    
    func updatePositionGoingInOppositeDirection(scene : SKScene, backgroundSpeed : CGFloat) {
        posX += self.velX
        posY += self.velY
        if posX - self.images[0].size.width > self.width {
            updateSpeed(backgroundSpeed: backgroundSpeed)
            updatePositionForOppositeDirection(scene: scene)
            playSoundAllowed()
            self.hit = false
        }
        updateImagePositions()
        updateImage(numFrames: NUM_FRAMES_BIRD)
        advanceFrameCounter()
    }
    
    func updatePositionForOppositeDirection(scene : SKScene) {
        let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
        posX = -getRandomNumber() * scene.size.width - scene.size.width
        posY = getRandomNumber() * scene.size.height / 2 * factor + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
    }
    
    func updatePosition(scene : SKScene) {
        let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
        posX = getRandomNumber() * scene.size.width + scene.size.width
        posY = getRandomNumber() * scene.size.height / 2 * factor + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
    }
    
    func updateSpeed(backgroundSpeed : CGFloat) {
        let speed = getRandomNumber() * 2 * backgroundSpeed + 1.2 * backgroundSpeed
        setVelocity(velX: speed, velY: 0)
    }
}
