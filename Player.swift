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
        self.setSize(size: size)
    }
    
    override func update() {
        super.update()
        updatePositionPlayer()
        updateImage(numFrames: NUM_FRAMES_BIRD)
    }
    
    private func updatePositionPlayer() {
        self.images[0].position.x += self.velX
        self.images[0].position.y += self.velY
        
        reflect_player_velocity()
        
        for x in self.images {
            x.position = self.images[0].position
        }
        
        for x in self.imagesHit {
            x.position = self.images[0].position
        }
        
        self.posX = images[0].position.x
        self.posY = images[0].position.y
    }
    
    
    private func reflect_player_velocity() {
        if self.images[0].position.x < 0 {
            self.images[0].position.x = 0
            self.velX = -self.velX
        }
        if self.images[0].position.x > self.width {
            self.images[0].position.x = self.width
            self.velX = -self.velX
        }
        if self.images[0].position.y > (self.height / 2 + self.height / 4) {
            self.images[0].position.y = self.height / 2 + self.height / 4
            self.velY = -self.velY
        }
        if self.images[0].position.y < (self.height / 2 - self.height / 4) {
            self.images[0].position.y = self.height / 2 - self.height / 4
            self.velY = -self.velY
        }
        
        self.posX = images[0].position.x
        self.posY = images[0].position.y
    }
    
    private func set_pos_api(pos : CGPoint) {
        self.setPosition(position: pos)
        
        for x in imagesHit {
            x.position = pos
        }
    }
}
