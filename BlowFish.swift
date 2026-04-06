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
        self.updatePosition(scene: scene, atScreen: at)
        updateImagePositions()
        updateImage(numFrames: numberOfFramesBird)
    }
    
    func updatePosition(scene : SKScene, atScreen : Int) {
        posX += self.velX
        posY += self.velY
        if posX < -self.images[0].size.width {
            playSoundAllowed()
            self.hit = false
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            posX = getRandomNumber() * scene.size.width + CGFloat(atScreen) * scene.size.width
            posY = getRandomNumber() * scene.size.height / 2 * factor  + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
        }
    }
}
