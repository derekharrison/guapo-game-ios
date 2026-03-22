//
//  Brownie.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class Brownie : GameObject {
    func update(scene : SKScene) {
        super.update()
        reflect(scene : scene)
        updatePosition(scene : scene, at : 10)
        updateImage(numFrames: NUM_FRAMES_BIRD)
        updateImagePositions()
        displayImage(imageId: 0)
        checkIfBrownieAppeared(scene: scene)
    }
    
    override func displayImage(imageId _: Int) {
        if hit {
            self.displayImageNotHit(imageId: 1)
        }
        if !hit {
            self.displayImageNotHit(imageId: 0)
        }
    }
    
    func checkIfBrownieAppeared(scene : SKScene) {
        appeared = posX > 0 && posX < scene.size.width
    }
    
    func updatePosition(scene : SKScene, at : Int) {
        posX += self.velX
        posY += self.velY
        if posX < -self.images[0].size.width {
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            posX = getRandomNumber() * scene.size.width + CGFloat(at) * scene.size.width
            posY = getRandomNumber() * scene.size.height / 2 * factor  + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
            playSoundAllowed()
            self.hit = false
        }
    }

    func reflect(scene : SKScene) {
        if posY < 0.25 * scene.size.height {
            posY = 0.25 * scene.size.height
            velY = -velY
        }
        if posY > 0.75 * scene.size.height {
            posY = 0.75 * scene.size.height
            velY = -velY
        }
    }
}
