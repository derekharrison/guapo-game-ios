//
//  Rocco.swift
//  SoloMission
//
//  Created by Derek Harrison on 01/09/2026.
//

import SpriteKit
import Foundation

class Rocco : GameObject {
    var popCounter : Int = 0
    private var randomAngle = 0.0
    
    func update(scene : SKScene) {
        super.update()
        updatePosition(scene : scene)
        updateImage(numFrames: numOfFramesForUpdate)
        updateImagePositions()
        displayImage(imageId: 0)
        
        popCounter += 1

        if(popCounter >= 300) {
            popCounter = 0
        }
    }
    
    override func displayImage(imageId _: Int) {
        if hit {
            self.displayImageNotHit(imageId: 1)
        }
        if !hit {
            self.displayImageNotHit(imageId: 0)
        }
    }
    
    func updatePosition(scene : SKScene) {
        if(popCounter < 180) {
            posX = State.trajectory.first?.x ?? 0
            posY = State.trajectory.first?.y ?? 0
            randomAngle = Double.random(in: 0...(2 * .pi))
        }
        else {
            
            // Calculate the cosine
            let cosineValue = cos(randomAngle)
            let sineValue = sin(randomAngle)
            
            posX = posX + 100 * cosineValue
            posY = posY + 100 * sineValue
        }
    }
}
