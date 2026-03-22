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
    var images_hit : [SKSpriteNode]
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
        self.images_hit = [SKSpriteNode]()
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
    
    func set_height(height : CGFloat) {
        self.height = height
    }
    
    func set_width(width : CGFloat) {
        self.width = width
    }
    
    func set_z_pos(z_pos : CGFloat) {
        self.z_pos = z_pos
        for image in images {
            image.zPosition = z_pos
        }
        for image in images_hit {
            image.zPosition = z_pos
        }
    }
    
    func set_z_pos_hit(z_pos : CGFloat) {
        self.z_pos = z_pos
        for image in images {
            image.zPosition = -1
        }
        for image in images_hit {
            image.zPosition = -1
        }
        self.images_hit[0].zPosition = z_pos
    }
    
    func update() {
        
    }
    
    func update_pos() {
        for image in images {
            image.position.x += self.vel_x
            image.position.y += self.vel_y
        }
        for image in images_hit {
            image.position = images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
    }
    
    func set_pos(pos : CGPoint) {
        for image in images {
            image.position = pos
        }
        for image in images_hit {
            image.position = pos
        }
    }
    
    func get_pos() -> CGPoint {
        return self.images[0].position
    }
    
    func set_vel(vel_x : CGFloat, vel_y : CGFloat) {
        self.vel_x = vel_x
        self.vel_y = vel_y
    }
    
    func set_play_sound(play_s : Bool) {
        self.play_sound = play_s
    }
    
    func add_image(image : String) {
        self.images.append(SKSpriteNode(imageNamed: image))
        self.image_names.append(image)
    }
    
    func add_image_hit(image : String) {
        self.images_hit.append(SKSpriteNode(imageNamed: image))
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
        for x in self.images_hit {
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
        for image in 0..<self.images_hit.count {
            self.images_hit[image].zPosition = -1
        }
    }
    
    func displayImageHit(image_id : Int) {
        for image in 0..<self.images_hit.count {
            if(image == image_id) {
                self.images_hit[image].zPosition = self.z_pos
            }
            else {
                self.images_hit[image].zPosition = -1
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
        for x in self.images_hit {
            x.size = size
        }
    }
    
    func set_size_hit(size : CGSize) {
        for x in self.images_hit {
            x.size = size
        }
    }
    
    func get_size() -> CGSize {
        return self.images[0].size
    }
    
    func reflect(scene : SKScene) {
        if self.images[0].position.y < 0.25 * scene.size.height {
            self.images[0].position.y = 0.25 * scene.size.height
            self.vel_y = -self.vel_y
        }
        if self.images[0].position.y > 0.75 * scene.size.height {
            self.images[0].position.y = 0.75 * scene.size.height
            self.vel_y = -self.vel_y
        }
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
    }
    
    func updatePositionBirdsOrFish(scene : SKScene, bk_speed : CGFloat) {
        
        self.images[0].position.x += self.vel_x
        self.images[0].position.y += self.vel_y
        
        if self.images[0].position.x < -self.images[0].size.width {
            
            let speed = get_rand_num() * 2 * bk_speed + 1.2 * bk_speed
            set_vel(vel_x: speed, vel_y: 0)
            
            self.play_sound = true
            self.play_hit_sound = true
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = get_rand_num() * scene.size.width + scene.size.width
            self.images[0].position.y = get_rand_num() * scene.size.height / 2 * factor + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
            
            self.hit = false
        }
        
        for x in self.images {
            x.position = self.images[0].position
        }
        
        for x in self.images_hit {
            x.position = self.images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
        
        updateImage(numFrames: num_frames_bird)
        advanceFrameCounter()
    }
    
    func updatePositionJellyFish(scene : SKScene, bk_speed : CGFloat, num_frames : Int) {
        
        self.images[0].position.x += self.vel_x
        self.images[0].position.y += self.vel_y
        
        if self.images[0].position.x < -self.images[0].size.width {
            
            let speed = get_rand_num() * 2 * bk_speed + 1.2 * bk_speed
            set_vel(vel_x: speed, vel_y: 0)
            
            self.play_sound = true
            self.play_hit_sound = true
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = get_rand_num() * scene.size.width + scene.size.width
            self.images[0].position.y = get_rand_num() * scene.size.height / 2 * factor + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
            
            self.hit = false
        }
        
        for x in self.images {
            x.position = self.images[0].position
        }
        
        for x in self.images_hit {
            x.position = self.images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
        
        updateImage(numFrames: num_frames)
        advanceFrameCounter()
    }
    
    func updatePositionFishGoingInOppositeDirection(scene : SKScene, bk_speed : CGFloat) {
        
        self.images[0].position.x += self.vel_x
        self.images[0].position.y += self.vel_y
        
        if self.images[0].position.x - self.images[0].size.width > self.width {
            
            let speed = get_rand_num() * 2 * bk_speed + 1.2 * bk_speed
            set_vel(vel_x: speed, vel_y: 0)
            
            self.play_sound = true
            self.play_hit_sound = true
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = -get_rand_num() * scene.size.width - scene.size.width
            self.images[0].position.y = get_rand_num() * scene.size.height / 2 * factor + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
            
            self.hit = false
        }
        
        for x in self.images {
            x.position = self.images[0].position
        }
        
        for x in self.images_hit {
            x.position = self.images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
        
        updateImage(numFrames: num_frames_bird)
        advanceFrameCounter()
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
    
    func updatePositionPlayer() {
        
        self.images[0].position.x += self.vel_x
        self.images[0].position.y += self.vel_y
        
        reflect_player_velocity()
        
        for x in self.images {
            x.position = self.images[0].position
        }
        
        for x in self.images_hit {
            x.position = self.images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
        
        updateImage(numFrames: num_frames_bird)
        advanceFrameCounter()
    }
    
    func updatePositionSnacks(scene : SKScene) {
        
        self.images[0].position.x += self.vel_x
        self.images[0].position.y += self.vel_y
        
        if self.images[0].position.x < -self.images[0].size.width {
            
            self.play_sound = true
            self.play_hit_sound = true
            self.hit = false
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = get_rand_num() * scene.size.width + scene.size.width
            self.images[0].position.y = get_rand_num() * scene.size.height / 2 * factor  + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
        }
        for x in self.images {
            x.position = self.images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
    }
    
    func updatePositionBlowFishOrBrownie(scene : SKScene, at_screen : Int) {
        
        self.images[0].position.x += self.vel_x
        self.images[0].position.y += self.vel_y
        
        if self.images[0].position.x < -self.images[0].size.width {
            
            self.play_sound = true
            self.play_hit_sound = true
            self.hit = false
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = get_rand_num() * scene.size.width + CGFloat(at_screen) * scene.size.width
            self.images[0].position.y = get_rand_num() * scene.size.height / 2 * factor  + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
        }
        for x in self.images {
            x.position = self.images[0].position
        }
        
        for x in self.images_hit {
            x.position = self.images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
        
        updateImage(numFrames: num_frames_bird)
        advanceFrameCounter()
    }
    
    func updatePositionBlowFishHit(scene : SKScene, at_screen : Int) {
        
        self.images[0].position.x += self.vel_x
        self.images[0].position.y += self.vel_y
        
        if self.images[0].position.x < -self.images[0].size.width {
            
            self.play_sound = true
            self.play_hit_sound = true
            self.hit = false
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = get_rand_num() * scene.size.width + CGFloat(at_screen) * scene.size.width
            self.images[0].position.y = get_rand_num() * scene.size.height / 2 * factor  + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
        }
        for x in self.images {
            x.position = self.images[0].position
        }
        
        for x in self.images_hit {
            x.position = self.images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
        
        advanceFrameCounterHit()
    }
    
    func updatePositionFrito(scene : SKScene, at_screen : Int) {
        
        self.images[0].position.x += self.vel_x
        self.images[0].position.y += self.vel_y
        
        if self.images[0].position.x > self.images[0].size.width + scene.size.width {
            
            self.play_sound = true
            self.play_hit_sound = true
            self.hit = false
            
            let factor = 1.0 - (self.images[0].size.height) / (scene.size.height / 2)
            self.images[0].position.x = get_rand_num() * scene.size.width + CGFloat(at_screen) * scene.size.width
            self.images[0].position.y = get_rand_num() * scene.size.height / 2 * factor  + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
        }
        for x in self.images {
            x.position = self.images[0].position
        }
        
        self.pos_x = images[0].position.x
        self.pos_y = images[0].position.y
        
        updateImage(numFrames: num_frames_bird)
        advanceFrameCounter()
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
            if(imageIdHit == self.images_hit.count) { imageIdHit = 0 }
            displayImageHit(image_id: imageIdHit)

        }
    }
}
