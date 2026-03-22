//
//  Player.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class Player : GameObject {
    
    override init() { super.init() }
    
    init(images : [String], size : CGSize, z_pos : CGFloat) {
        super.init()
        
        for x in images {
            self.addImage(image: x)
        }
        
        self.setPosition(position: CGPoint(x: -5000, y: 0))
        self.setZPosition(zPos: z_pos)
        self.set_size(size: size)
    }
    
    override func update() {
        super.update()
        updatePositionPlayer()
        updateImage(numFrames: num_frames_bird)
    }
    
    func updatePositionPlayer() {
        self.images[0].position.x += self.vel_x
        self.images[0].position.y += self.vel_y
        
        reflect_player_velocity()
        
        for x in self.images {
            x.position = self.images[0].position
        }
        
        for x in self.imagesHit {
            x.position = self.images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
    }
    
    
    func reflect_player_velocity() {
        if self.images[0].position.x < 0 {
            self.images[0].position.x = 0
            self.vel_x = -self.vel_x
        }
        if self.images[0].position.x > self.width {
            self.images[0].position.x = self.width
            self.vel_x = -self.vel_x
        }
        if self.images[0].position.y > (self.height / 2 + self.height / 4) {
            self.images[0].position.y = self.height / 2 + self.height / 4
            self.vel_y = -self.vel_y
        }
        if self.images[0].position.y < (self.height / 2 - self.height / 4) {
            self.images[0].position.y = self.height / 2 - self.height / 4
            self.vel_y = -self.vel_y
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
    }
    
    func add_image_hit(image : String, size : CGSize, z_pos : CGFloat) {
        let image_hit = SKSpriteNode(imageNamed: image)
        image_hit.size = size
        image_hit.zPosition = z_pos
        self.imagesHit.append(image_hit)
    }
    
    func update_pos_api() {
        self.updatePositionPlayer()
    }
    
    func set_pos_api(pos : CGPoint) {
        self.setPosition(position: pos)
        
        for x in imagesHit {
            x.position = pos
        }
    }
}
