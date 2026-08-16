//
//  Player.swift
//  SoloMission
//
//  Created by Derek Harrison on 22/03/2026.
//

import Foundation
import SpriteKit

class Player : GameObject {
    var cape1 : SKSpriteNode
    var cape2 : SKSpriteNode
    var capeCounter = 1
    
    var positions: [Position] = []
    
    override init() {
        self.cape1 = SKSpriteNode(imageNamed: capeImage1)
        self.cape2 = SKSpriteNode(imageNamed: capeImage2)
        super.init()
        
        self.setPosition(position: CGPoint(x: -5000, y: 0))
    }
    
    func images(images: [String]) -> Player {
        for x in images {
            self.addImage(image: x)
        }
        return self;
    }
    
    func imageHit(imageHit: String) -> Player {
        self.addImageHit(image: imageHit)
        return self;
    }
    
    func size(size: CGSize) -> Player {
        self.setSize(size: size)
        return self;
    }
    
    func zPos(zPos : CGFloat) -> Player {
        self.setZPosition(zPos: zPos)
        return self;
    }
    
    func position(position: CGPoint) -> Player {
        self.setPosition(position: position)
        return self;
    }
    
    override func update() {
        super.update()
        updatePositionPlayer()
        updateImage(numFrames: numberOfFramesBird)
    }
    
    override func addImagesToScene(scene : SKScene) {
        super.addImagesToScene(scene: scene)
        
        self.cape1.setScale(1)
        self.cape1.size = CGSize(width: scene.size.width / 12, height: scene.size.height / 10)
        self.cape2.setScale(1)
        self.cape2.size = CGSize(width: scene.size.width / 12, height: scene.size.height / 10)
        
        self.cape1.removeFromParent()
        scene.addChild(self.cape1)
        self.cape2.removeFromParent()
        scene.addChild(self.cape2)
    }
    
    private func updatePositionPlayer() {
        self.positions.append(Position(posX: self.images[0].position.x, posY: self.images[0].position.y))
        
        if(self.positions.count > 25) {
            self.positions.remove(at: 0)
        }
        
        self.images[0].position.x += self.velX
        self.images[0].position.y += self.velY
        
        reflectPlayerVelocity()
        
        for x in self.images {
            x.position = self.images[0].position
        }
        
        for x in self.imagesHit {
            x.position = self.images[0].position
        }
        
        self.posX = images[0].position.x
        self.posY = images[0].position.y
    }
    
    
    private func reflectPlayerVelocity() {
        if self.images[0].position.x < 0 {
            self.images[0].position.x = 0
            self.velX = -self.velX
        }
        if self.images[0].position.x > self.width {
            self.images[0].position.x = self.width
            self.velX = -self.velX
        }
        if self.images[0].position.y > (self.height / 2 + self.height / 4) {
            self.images[0].position.y = self.height / 2 + self.height / 4
            self.velY = -self.velY
        }
        if self.images[0].position.y < (self.height / 2 - self.height / 4) {
            self.images[0].position.y = self.height / 2 - self.height / 4
            self.velY = -self.velY
        }
        
        self.posX = images[0].position.x
        self.posY = images[0].position.y
    }
}
