//
//  GameObjects.swift
//  SoloMission
//
//  Created by Derek Harrison on 04/10/2023.
//

import Foundation
import SpriteKit


class Flag : GameObject {
    
    var popCounter : Int = 0
    var popFlag = false
    var boundTrack : Int = boundTracker
    var scoreForFlagPopup : Int = numberOfPointsBetweenCheckpoints
    
    func update(scene : SKScene) {
        super.update()
        if(gameScore >= scoreForFlagPopup && State.lives > 0) {
            popCounter = 0
            for image in self.images {
                image.zPosition = zPosFlagPopup
            }
            
            if(playSound) {
                SoloMission.playSound(scene: scene, sound: [sunPopupSound])
                playSound = false
            }
            
            scoreForFlagPopup += numberOfPointsBetweenCheckpoints
        }
        
        if(popCounter < 300) {
            popCounter += 1
        }
        
        if(popCounter >= 300) {
            playSound = true
            for image in self.images {
                image.zPosition = -1
            }
        }
    }
}
