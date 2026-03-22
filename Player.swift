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
            self.add_image(image: x)
        }
        
        self.set_pos(pos: CGPoint(x: -5000, y: 0))
        self.set_z_pos(z_pos: z_pos)
        self.set_size(size: size)
    }
    
    func add_image_hit(image : String, size : CGSize, z_pos : CGFloat) {
        let image_hit = SKSpriteNode(imageNamed: image)
        image_hit.size = size
        image_hit.zPosition = z_pos
        self.images_hit.append(image_hit)
    }
    
    func update_pos_api() {
        self.updatePositionPlayer()
    }
    
    func set_pos_api(pos : CGPoint) {
        self.set_pos(pos: pos)
        
        for x in images_hit {
            x.position = pos
        }
    }
}
