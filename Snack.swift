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
    
    init(bite : String, points : Int, size : CGSize, zPos : CGFloat) {
        self.points_snack = points
        super.init()
        self.addImage(image: bite)
        
        let factor = 1.0 - (self.images[0].size.height) / (self.height / 2)
        let pos_x = getRandomNumber() * self.width * 2
        let pos_y = getRandomNumber() * self.height / 2 * factor + self.height / 4 + 1/2 * (1 - factor) * self.height / 2
        
        self.setPosition(position: CGPoint(x: pos_x, y: pos_y))
        self.setZPosition(zPos: zPos)
        self.setSize(size: size)
    }
    
    func update(scene : SKScene) {
        
        self.images[0].position.x += self.velX
        self.images[0].position.y += self.velY
        
        if self.images[0].position.x < -self.images[0].size.width {
            
            self.playSound = true
            self.playHitSound = true
            self.hit = false
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = getRandomNumber() * scene.size.width + scene.size.width
            self.images[0].position.y = getRandomNumber() * scene.size.height / 2 * factor  + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
        }
        for x in self.images {
            x.position = self.images[0].position
        }
        
        self.posX = images[0].position.x
        self.posY = images[0].position.y
    }
}
