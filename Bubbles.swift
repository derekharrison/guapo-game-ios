//
//  Bubbles.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class Bubbles {
    
    var bubbles : [SKSpriteNode]
    var bubcounter : Int
    var isMuted : Bool
    
    init() {
        self.bubbles = [SKSpriteNode]()
        self.bubcounter = 1
        self.isMuted = false
    }
    
    func addBubble(imageId : String) {
        
        self.bubbles.append(SKSpriteNode(imageNamed: imageId))
    }
    
    func playBubbles() {
        bubcounter = 1
        for x in bubbles {
            x.zPosition = -1
        }
    }
    
    func setPosition(pos : CGPoint) {
        for x in bubbles {
            x.position = pos
        }
    }

    func popBubbles(pos : CGPoint, scene : SKScene, sound : [SKAction]) {
        
        if self.bubcounter == 1 {
            self.bubbles[0].position = pos
            self.bubbles[0].zPosition = 1000
            self.bubcounter += 1
            if self.isMuted == false {
                play_sound_api(scene : scene, sound : sound)
            }
            
        }
        else if self.bubcounter < 40 {
            self.bubbles[0].position.y += bubble_vel_y
            self.bubcounter += 1
        }
        else if bubcounter == 40 {
            self.bubbles[1].position = pos
            self.bubbles[1].zPosition = 1000
            self.bubcounter += 1
        }
        else if bubcounter < 80 {
            self.bubbles[0].position.y += bubble_vel_y
            self.bubbles[1].position.y += bubble_vel_y
            self.bubcounter += 1
        }
        else if self.bubcounter == 80 {
            self.bubbles[2].position = pos
            self.bubbles[2].zPosition = 1000
            self.bubcounter += 1
        }
        else if self.bubcounter < 240 {
            self.bubbles[0].position.y += bubble_vel_y
            self.bubbles[1].position.y += bubble_vel_y
            self.bubbles[2].position.y += bubble_vel_y
            self.bubcounter += 1
        }
        if self.bubcounter == 240 {
            playBubbles()
        }
    }
}
