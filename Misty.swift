//
//  Misty.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation


class Misty : GameObject {
    var top : Bool
    var counter1 = 1000
    var counter2 = 1000
    
    override init() {
        self.top = true
        super.init()
        self.height = 100000
        self.width = -100000
        self.setPosition(position: CGPoint(x: -5000, y: 0))
    }
    
    override func update() {
        super.update()
        updatePositionMisty()
    }
    
    func updatePositionMisty() {
        for image in images {
            image.position.x += self.vel_x
            image.position.y += self.vel_y
        }
        for image in imagesHit {
            image.position = images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
    }
    
    func play_misty(bool : Bool) {
        self.counter1 = 1;
        self.counter2 = 1;
        
        self.top = bool
    }
    
    func set_vel_misty(vx : CGFloat, vy : CGFloat) {
        self.setVelocity(vel_x: vx, vel_y: vy)
    }
    
    func set_pos_api(pos : CGPoint) {
        if !top {
            self.images[0].position = pos
            self.images[1].position = pos
        }
        else {
            self.images[2].position = pos
            self.images[3].position = pos
        }
    }
    
    func pop_misty(height : CGFloat, speed : CGFloat) {
        
        if !self.hit && top {
            self.displayImageNotHit(image_id: 2)
        }
        
        if self.hit && top {
            self.displayImageNotHit(image_id: 3)
        }
        
        if !self.hit && !top {
            self.displayImageNotHit(image_id: 0)
        }
        
        if self.hit && !top {
            self.displayImageNotHit(image_id: 1)
        }
        
        if counter1 < num_frames_misty {
            self.updatePositionMisty()
            counter1 += 1
        }
        
        else if counter1 == num_frames_misty {
            self.vel_y = -self.vel_y
            counter1 += 1
        }
        
        else if counter1 < num_frames_misty + 60 {
            self.updatePositionMisty()
            counter1 += 1
        }
    }
}
