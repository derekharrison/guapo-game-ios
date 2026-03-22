//
//  BlowFish.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class BlowFish : GameObject {
    
    override init() {
        super.init()
    }
    
    func update_pos_api(scene : SKScene, at : Int) {
        
        if !self.hit {
            self.updatePositionBlowFishOrBrownie(scene: scene, at_screen : at)
        }
        if self.hit {
            self.updatePositionBlowFishHit(scene: scene, at_screen: at)
        }
    }
}
