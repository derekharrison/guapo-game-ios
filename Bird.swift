//
//  Bird.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class Bird : GameObject {
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
        updateImagePositions()
    }
    
    func updatePosition(scene : SKScene, backgroundSpeed : CGFloat) {
        posX += self.velX
        posY += self.velY
        if posX < -self.images[0].size.width {
            updateSpeed(backgroundSpeed: backgroundSpeed)
            updatePosition(scene: scene)
            playSoundAllowed()
            self.hit = false
        }
    }
    
    func updateSpeed(backgroundSpeed : CGFloat) {
        let speed = getRandomNumber() * 2 * backgroundSpeed + 1.2 * backgroundSpeed
        setVelocity(velX: speed, velY: 0)
        
    }
    
    func updatePosition(scene : SKScene) {
        let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
        posX = getRandomNumber() * scene.size.width + scene.size.width
        posY = getRandomNumber() * scene.size.height / 2 * factor + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
    }
}
