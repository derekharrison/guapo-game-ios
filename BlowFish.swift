//
//  BlowFish.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class BlowFish : GameObject {
    func update(scene : SKScene, at : Int) {
        self.updatePosition(scene: scene, at_screen: at)
        updateImagePositions()
        updateImage(numFrames: NUM_FRAMES_BIRD)
    }
    
    func updatePosition(scene : SKScene, at_screen : Int) {
        posX += self.velX
        posY += self.velY
        if posX < -self.images[0].size.width {
            playSoundAllowed()
            self.hit = false
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            posX = getRandomNumber() * scene.size.width + CGFloat(at_screen) * scene.size.width
            posY = getRandomNumber() * scene.size.height / 2 * factor  + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
        }
    }
}
