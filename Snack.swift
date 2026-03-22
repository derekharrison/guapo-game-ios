//
//  Snack.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation

class Snack : GameObject {
    var points_snack : Int
    
    init(bite : String, points : Int, size : CGSize, z_pos : CGFloat) {
        self.points_snack = points
        super.init()
        self.add_image(image: bite)
        
        let factor = 1.0 - (self.images[0].size.height) / (self.height / 2)
        let pos_x = get_rand_num() * self.width * 2
        let pos_y = get_rand_num() * self.height / 2 * factor + self.height / 4 + 1/2 * (1 - factor) * self.height / 2
        
        self.set_pos(pos: CGPoint(x: pos_x, y: pos_y))
        self.set_z_pos(z_pos: z_pos)
        self.set_size(size: size)
    }
}
