//
//  Fish.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit


class Fish : GameObject {
    
    func update(scene : SKScene, backgroundSpeed : CGFloat) {
        super.update()
        updateImage(numFrames: num_frames_bird)
        updatePosition(scene: scene, backgroundSpeed: backgroundSpeed)
    }
    
    func updatePosition(scene : SKScene, backgroundSpeed : CGFloat) {
        
        self.images[0].position.x += self.vel_x
        self.images[0].position.y += self.vel_y
        
        if self.images[0].position.x < -self.images[0].size.width {
            
            let speed = get_rand_num() * 2 * backgroundSpeed + 1.2 * backgroundSpeed
            setVelocity(vel_x: speed, vel_y: 0)
            
            self.play_sound = true
            self.play_hit_sound = true
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = get_rand_num() * scene.size.width + scene.size.width
            self.images[0].position.y = get_rand_num() * scene.size.height / 2 * factor + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
            
            self.hit = false
        }
        
        for x in self.images {
            x.position = self.images[0].position
        }
        
        for x in self.imagesHit {
            x.position = self.images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
    }
    
    func updatePositionGoingInOppositeDirection(scene : SKScene, bk_speed : CGFloat) {
        
        self.images[0].position.x += self.vel_x
        self.images[0].position.y += self.vel_y
        
        if self.images[0].position.x - self.images[0].size.width > self.width {
            
            let speed = get_rand_num() * 2 * bk_speed + 1.2 * bk_speed
            setVelocity(vel_x: speed, vel_y: 0)
            
            self.play_sound = true
            self.play_hit_sound = true
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = -get_rand_num() * scene.size.width - scene.size.width
            self.images[0].position.y = get_rand_num() * scene.size.height / 2 * factor + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
            
            self.hit = false
        }
        
        for x in self.images {
            x.position = self.images[0].position
        }
        
        for x in self.imagesHit {
            x.position = self.images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
        
        updateImage(numFrames: num_frames_bird)
        advanceFrameCounter()
    }
}
