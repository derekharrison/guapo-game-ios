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
    var toSwitch = false
    var positions: [Position] = []
    
    override init() {
        cape1 = SKSpriteNode(imageNamed: capeImage1)
        cape2 = SKSpriteNode(imageNamed: capeImage2)
        super.init()
        
        setPosition(position: CGPoint(x: -5000, y: 0))
    }
    
    func images(images: [String]) -> Player {
        for x in images {
            addImage(image: x)
        }
        return self;
    }
    
    func imageHit(imageHit: String) -> Player {
        addImageHit(image: imageHit)
        return self;
    }
    
    func size(size: CGSize) -> Player {
        setSize(size: size)
        return self;
    }
    
    func zPos(zPos : CGFloat) -> Player {
        setZPosition(zPos: zPos)
        return self;
    }
    
    func position(position: CGPoint) -> Player {
        setPosition(position: position)
        return self;
    }
    
    override func update() {
        super.update()
        updatePositionPlayer()
        updateImage(numFrames: numOfFramesForUpdate)
        updateTrajectory()
        
        if(State.levelId != LevelId.OCEAN) {
            updateCape()
        }
    }
    
    private func updateTrajectory() {
        State.trajectory.append(CGPoint(x: self.posX, y: self.posY))
        
        if(State.trajectory.count > 20) {
            State.trajectory.remove(at: 0)
        }
    }
    
    private func updateCape() {
        self.cape1.position.x = self.posX - self.cape1.size.width / 2
        self.cape1.position.y = self.posY
        self.cape2.position.x = self.posX - self.cape2.size.width / 2
        self.cape2.position.y = self.posY
        
        if capeCounter < 5 {
            showCape1()
        }
        else if capeCounter < 10{
            showCape2()
        }
        else if capeCounter == 15 {
            capeCounter = 0
        }
        capeCounter += 1
    }
    
    private func showCape1() {
        self.cape1.zPosition = 2
        self.cape2.zPosition = -1
    }

    private func showCape2() {
        self.cape1.zPosition = -1
        self.cape2.zPosition = 2
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
