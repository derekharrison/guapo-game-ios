//
//  JellyFish.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation

class JellyFish : GameObject {
    
    var counter : Int = 1
    
    init(jelly_fish : [String], size : CGSize, z_pos : CGFloat) {
        super.init()
        
        for x in jelly_fish {
            self.add_image(image: x)
        }
        
        self.set_pos(pos: CGPoint(x: -5000, y: 0))
        self.set_z_pos(z_pos: z_pos)
        self.set_size(size: size)
    }

    func update_pos_api() {
        
        if counter < 20 {
            for x in images {
                x.position.y += 2
            }
            counter += 1
        }
        else if counter < 40 {
            for x in images {
                x.position.y -= 2
            }
            counter += 1
        }
        else if counter == 40 {
            counter = 1
        }
    }
}
