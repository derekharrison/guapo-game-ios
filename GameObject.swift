//
//  GameObject.swift
//  SoloMission
//
//  Created by Derek Harrison on 04/10/2023.
//

import Foundation
import SpriteKit

class GameObject {
    var zPos: CGFloat
    var velX: CGFloat
    var velY: CGFloat
    var playSound: Bool
    var playHitSound : Bool
    var images : [SKSpriteNode]
    var imagesHit : [SKSpriteNode]
    var imageNames : [String]
    var frameCounter = 1
    var frameCounterHit = 1
    var imageId = 0
    var imageIdHit = 0
    var width : CGFloat
    var height : CGFloat
    var hit : Bool
    var appeared : Bool
    var bubbles : Bubbles
    var posX : CGFloat
    var posY : CGFloat
    var cape1 : SKSpriteNode
    var cape2 : SKSpriteNode
    var capeCounter = 1
    
    init() {
        self.zPos = -1
        self.velX = 0
        self.velY = 0
        self.playSound = true
        self.playHitSound = true
        self.images = [SKSpriteNode]()
        self.imagesHit = [SKSpriteNode]()
        self.imageNames = [String]()
        self.width = 0
        self.height = 0
        self.hit = false
        self.appeared = false
        self.bubbles = Bubbles()
        self.posX = -10000
        self.posY = 0
        self.cape1 = SKSpriteNode(imageNamed: capeImage1)
        self.cape2 = SKSpriteNode(imageNamed: capeImage2)
    }
    
    func update() {
        advanceFrameCounter()
    }

    func setHeight(height : CGFloat) {
        self.height = height
    }
    
    func setWidth(width : CGFloat) {
        self.width = width
    }
    
    func setZPosition(zPos : CGFloat) {
        self.zPos = zPos
        for image in images {
            image.zPosition = zPos
        }
        for image in imagesHit {
            image.zPosition = zPos
        }
    }
    
    func setZPositionHit(zPos : CGFloat) {
        self.zPos = zPos
        for image in images {
            image.zPosition = -1
        }
        for image in imagesHit {
            image.zPosition = -1
        }
        self.imagesHit[0].zPosition = zPos
    }
    
    
    func setPosition(position : CGPoint) {
        for image in images {
            image.position = position
        }
        for image in imagesHit {
            image.position = position
        }
        
        posX = position.x
        posY = position.y
    }
    
    func getPosition() -> CGPoint {
        return self.images[0].position
    }
    
    func setVelocity(velX : CGFloat, velY : CGFloat) {
        self.velX = velX
        self.velY = velY
    }
    
    func updateImagePositions() {
        for image in self.images {
            image.position.x = posX
        }
        
        for image in self.images {
            image.position.y = posY
        }
        
        for image in self.imagesHit {
            image.position.x = posX
        }
        
        for image in self.imagesHit {
            image.position.y = posY
        }
    }
    
    func playSoundAllowed() {
        self.playSound = true
        self.playHitSound = true
    }
    
    func setPlaySound(playSound : Bool) {
        self.playSound = playSound
    }
    
    func addImage(image : String) {
        self.images.append(SKSpriteNode(imageNamed: image))
        self.imageNames.append(image)
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
            displayImageHit(imageId: imageId)
        }
        else {
            displayImageNotHit(imageId: imageId)
        }
    }
    
    func displayImageNotHit(imageId : Int) {
        for image in 0..<self.images.count {
            if(image == imageId) {
                self.images[image].zPosition = self.zPos
            }
            else {
                self.images[image].zPosition = -1
            }
        }
        for image in 0..<self.imagesHit.count {
            self.imagesHit[image].zPosition = -1
        }
    }
    
    func displayImageHit(imageId : Int) {
        for image in 0..<self.imagesHit.count {
            if(image == imageId) {
                self.imagesHit[image].zPosition = self.zPos
            }
            else {
                self.imagesHit[image].zPosition = -1
            }
        }
        for image in 0..<self.images.count {
            self.images[image].zPosition = -1
        }
    }
 
    func setSize(size : CGSize) {
        for x in self.images {
            x.size = size
        }
        for x in self.imagesHit {
            x.size = size
        }
    }
    
    func setSizeHit(size : CGSize) {
        for x in self.imagesHit {
            x.size = size
        }
    }
    
    func getSize() -> CGSize {
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
        
        if(frameCounterHit < numberOfFramesBird) {
            displayImageHit(imageId: imageIdHit)
        }
        else {
            frameCounterHit = 0
            imageIdHit += 1
            if(imageIdHit == self.imagesHit.count) { imageIdHit = 0 }
            displayImageHit(imageId: imageIdHit)
        }
    }
}
