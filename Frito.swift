//
//  Frito.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class Frito : GameObject {
    override init() { super.init() }
    
    func update(scene : SKScene) {
        super.update()
        updatePosition(scene: scene)
        updateImage(numFrames: num_frames_bird)
    }
    
    func updatePosition(scene : SKScene, at_screen : Int) {
        
        self.images[0].position.x += self.vel_x
        self.images[0].position.y += self.vel_y
        
        if self.images[0].position.x > self.images[0].size.width + scene.size.width {
            
            self.play_sound = true
            self.play_hit_sound = true
            self.hit = false
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = get_rand_num() * scene.size.width + CGFloat(at_screen) * scene.size.width
            self.images[0].position.y = get_rand_num() * scene.size.height / 2 * factor  + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
        }
        for x in self.images {
            x.position = self.images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
    }
    
    func updatePosition(scene : SKScene) {
        
        self.reflect(scene : scene)
        self.updatePosition(scene : scene, at_screen : -15)
        
        if hit {
            self.displayImageNotHit(image_id: 1)
        }
        
        if !hit {
            self.displayImageNotHit(image_id: 0)
        }
        
        self.appeared = self.images[0].position.x > 0 && self.images[0].position.x < scene.size.width
    }
    
    func reflect(scene : SKScene) {
        if self.images[0].position.y < 0.25 * scene.size.height {
            self.images[0].position.y = 0.25 * scene.size.height
            self.vel_y = -self.vel_y
        }
        if self.images[0].position.y > 0.75 * scene.size.height {
            self.images[0].position.y = 0.75 * scene.size.height
            self.vel_y = -self.vel_y
        }
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
    }
}
