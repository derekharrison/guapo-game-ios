//
//  Bubbles.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class Bubbles {
    
    var bubblez : [SKSpriteNode]
    var bubcounter : Int
    var isMuted : Bool
    
    init() {
        self.bubblez = [SKSpriteNode]()
        self.bubcounter = 1
        self.isMuted = false
    }
    
    func addBubble(imageId : String) {
        
        self.bubblez.append(SKSpriteNode(imageNamed: imageId))
    }
    
    func playBubbles() {
        bubcounter = 1
        for x in bubblez {
            x.zPosition = -1
        }
    }
    
    func setPosition(pos : CGPoint) {
        for x in bubblez {
            x.position = pos
        }
    }

    func popBubbles(pos : CGPoint, scene : SKScene, sound : [SKAction]) {
        
        if self.bubcounter == 1 {
            self.bubblez[0].position = pos
            self.bubblez[0].zPosition = 1000
            self.bubcounter += 1
            if self.isMuted == false {
                playSound(scene : scene, sound : sound)
            }
            
        }
        else if self.bubcounter < 40 {
            self.bubblez[0].position.y += bubble_vel_y
            self.bubcounter += 1
        }
        else if bubcounter == 40 {
            self.bubblez[1].position = pos
            self.bubblez[1].zPosition = 1000
            self.bubcounter += 1
        }
        else if bubcounter < 80 {
            self.bubblez[0].position.y += bubble_vel_y
            self.bubblez[1].position.y += bubble_vel_y
            self.bubcounter += 1
        }
        else if self.bubcounter == 80 {
            self.bubblez[2].position = pos
            self.bubblez[2].zPosition = 1000
            self.bubcounter += 1
        }
        else if self.bubcounter < 240 {
            self.bubblez[0].position.y += bubble_vel_y
            self.bubblez[1].position.y += bubble_vel_y
            self.bubblez[2].position.y += bubble_vel_y
            self.bubcounter += 1
        }
        if self.bubcounter == 240 {
            playBubbles()
        }
    }
}
