//
//  GameObject.swift
//  SoloMission
//
//  Created by Derek Harrison on 04/10/2023.
//

import Foundation
import SpriteKit

class GameObject {
    var z_pos: CGFloat
    var vel_x: CGFloat
    var vel_y: CGFloat
    var play_sound: Bool
    var play_hit_sound : Bool
    var images : [SKSpriteNode]
    var imagesHit : [SKSpriteNode]
    var image_names : [String]
    var frameCounter = 1
    var frameCounterHit = 1
    var imageId = 0
    var imageIdHit = 0
    var width : CGFloat
    var height : CGFloat
    var hit : Bool
    var appeared : Bool
    var bubbles : Bubbles
    var pos_x : CGFloat
    var pos_y : CGFloat
    var cape1 : SKSpriteNode
    var cape2 : SKSpriteNode
    var cape_counter = 1
    
    init() {
        self.z_pos = -1
        self.vel_x = 0
        self.vel_y = 0
        self.play_sound = true
        self.play_hit_sound = true
        self.images = [SKSpriteNode]()
        self.imagesHit = [SKSpriteNode]()
        self.image_names = [String]()
        self.width = 0
        self.height = 0
        self.hit = false
        self.appeared = false
        self.bubbles = Bubbles()
        self.pos_x = -10000
        self.pos_y = 0
        self.cape1 = SKSpriteNode(imageNamed: CAPE_IMAGE1)
        self.cape2 = SKSpriteNode(imageNamed: CAPE_IMAGE2)
    }
    
    func setHeight(height : CGFloat) {
        self.height = height
    }
    
    func setWidth(width : CGFloat) {
        self.width = width
    }
    
    func setZPosition(zPos : CGFloat) {
        self.z_pos = zPos
        for image in images {
            image.zPosition = zPos
        }
        for image in imagesHit {
            image.zPosition = zPos
        }
    }
    
    func setZPositionHit(zPos : CGFloat) {
        self.z_pos = zPos
        for image in images {
            image.zPosition = -1
        }
        for image in imagesHit {
            image.zPosition = -1
        }
        self.imagesHit[0].zPosition = zPos
    }
    
    func update() {
        advanceFrameCounter()
    }

    
    func setPosition(position : CGPoint) {
        for image in images {
            image.position = position
        }
        for image in imagesHit {
            image.position = position
        }
    }
    
    func getPosition() -> CGPoint {
        return self.images[0].position
    }
    
    func setVelocity(vel_x : CGFloat, vel_y : CGFloat) {
        self.vel_x = vel_x
        self.vel_y = vel_y
    }
    
    func setPlaySound(play_s : Bool) {
        self.play_sound = play_s
    }
    
    func addImage(image : String) {
        self.images.append(SKSpriteNode(imageNamed: image))
        self.image_names.append(image)
    }
    
    func addImageHit(image : String) {
        self.imagesHit.append(SKSpriteNode(imageNamed: image))
    }
    
    func addImagesToScene(scene : SKScene) {
        self.cape1.setScale(1)
        self.cape1.size = CGSize(width: scene.size.width / 12, height: scene.size.height / 10)
        self.cape2.setScale(1)
        self.cape2.size = CGSize(width: scene.size.width / 12, height: scene.size.height / 10)
        
        self.cape1.removeFromParent()
        scene.addChild(self.cape1)
        self.cape2.removeFromParent()
        scene.addChild(self.cape2)
        
        for x in self.images {
            x.removeFromParent()
            scene.addChild(x)
        }
        for x in self.imagesHit {
            x.removeFromParent()
            scene.addChild(x)
        }
    }
    
    func displayImage(imageId : Int) {
        if(hit) {
            displayImageHit(image_id: imageId)
        }
        else {
            displayImageNotHit(image_id: imageId)
        }
    }
    
    func displayImageNotHit(image_id : Int) {
        for image in 0..<self.images.count {
            if(image == image_id) {
                self.images[image].zPosition = self.z_pos
            }
            else {
                self.images[image].zPosition = -1
            }
        }
        for image in 0..<self.imagesHit.count {
            self.imagesHit[image].zPosition = -1
        }
    }
    
    func displayImageHit(image_id : Int) {
        for image in 0..<self.imagesHit.count {
            if(image == image_id) {
                self.imagesHit[image].zPosition = self.z_pos
            }
            else {
                self.imagesHit[image].zPosition = -1
            }
        }
        for image in 0..<self.images.count {
            self.images[image].zPosition = -1
        }
    }
 
    func set_size(size : CGSize) {
        for x in self.images {
            x.size = size
        }
        for x in self.imagesHit {
            x.size = size
        }
    }
    
    func set_size_hit(size : CGSize) {
        for x in self.imagesHit {
            x.size = size
        }
    }
    
    func get_size() -> CGSize {
        return self.images[0].size
    }
    
    func updateImage(numFrames : Int) {
        if(frameCounter < numFrames) {
            displayImage(imageId: imageId)
        }
        else {
            frameCounter = 0
            imageId += 1
            if(imageId == self.images.count) { imageId = 0 }
            displayImage(imageId: imageId)

        }
    }
    
    func advanceFrameCounter() {
        frameCounter += 1
    }
    
    func advanceFrameCounterHit() {
        frameCounterHit += 1
        
        if(frameCounterHit < num_frames_bird) {
            displayImageHit(image_id: imageIdHit)
        }
        else {
            frameCounterHit = 0
            imageIdHit += 1
            if(imageIdHit == self.imagesHit.count) { imageIdHit = 0 }
            displayImageHit(image_id: imageIdHit)
        }
    }
}
