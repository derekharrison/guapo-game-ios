//
//  Bird.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation

class Bird : GameObject {
    
    override init() { super.init() }
    
    init(birds : [String], size : CGSize, z_pos : CGFloat) {
        super.init()
        
        for x in birds {
            self.add_image(image: x)
        }
        
        self.set_pos(pos: CGPoint(x: -5000, y: 0))
        self.set_z_pos(z_pos: z_pos)
        self.set_size(size: size)
    }
}
