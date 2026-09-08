//
//  SunPopup.swift
//  SoloMission
//
//  Created by Derek Harrison on 08/09/2026.
//

import SpriteKit

class SunPopup : GameObject {
    
    var popCounter : Int = 0
    var levelUnlockReached : Bool = false
    
    func update(scene : SKScene) {
        super.update()
        if(getHighScore() < numberOfPointsRequiredToUnlockLevel
           && gameScore >= numberOfPointsRequiredToUnlockLevel
            && levelUnlockReached == false) {
            popCounter = 0
            for image in self.images {
                image.zPosition = zPosFlagPopup
            }
            
            if(playSound) {
                SoloMission.playSound(scene: scene, sound: [sunPopupSound])
                playSound = false
            }
            
            levelUnlockReached = true
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
