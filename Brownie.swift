//
//  Brownie.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class Brownie : GameObject {
    
    override init() { super.init() }
    
    func update_pos_api(scene : SKScene) {
        
        self.reflect(scene : scene)
        self.updatePositionBlowFishOrBrownie(scene : scene, at_screen : 10)
        
        if hit {
            self.displayImageNotHit(image_id: 1)
        }
        
        if !hit {
            self.displayImageNotHit(image_id: 0)
        }
        
        self.appeared = self.images[0].position.x > 0 && self.images[0].position.x < scene.size.width
    }
}
