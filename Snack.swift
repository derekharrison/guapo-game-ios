//
//  Snack.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class Snack : GameObject {
    var points_snack : Int
    
    init(bite : String, points : Int, size : CGSize, z_pos : CGFloat) {
        self.points_snack = points
        super.init()
        self.addImage(image: bite)
        
        let factor = 1.0 - (self.images[0].size.height) / (self.height / 2)
        let pos_x = get_rand_num() * self.width * 2
        let pos_y = get_rand_num() * self.height / 2 * factor + self.height / 4 + 1/2 * (1 - factor) * self.height / 2
        
        self.setPosition(position: CGPoint(x: pos_x, y: pos_y))
        self.setZPosition(zPos: z_pos)
        self.set_size(size: size)
    }
    
    func update(scene : SKScene) {
        
        self.images[0].position.x += self.vel_x
        self.images[0].position.y += self.vel_y
        
        if self.images[0].position.x < -self.images[0].size.width {
            
            self.play_sound = true
            self.play_hit_sound = true
            self.hit = false
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = get_rand_num() * scene.size.width + scene.size.width
            self.images[0].position.y = get_rand_num() * scene.size.height / 2 * factor  + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
        }
        for x in self.images {
            x.position = self.images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
    }
}
