//
//  Rocco.swift
//  SoloMission
//
//  Created by Derek Harrison on 01/09/2026.
//

import SpriteKit
import Foundation

class Rocco : GameObject {
    var capeCounter : Int = 1
    var popCounter : Int = 0
    private var randomAngle = 0.0
    var cape1 : SKSpriteNode
    var cape2 : SKSpriteNode
    
    override init() {
        cape1 = SKSpriteNode(imageNamed: capeImage1)
        cape2 = SKSpriteNode(imageNamed: capeImage2)
    }
    
    func update(scene : SKScene) {
        super.update()
        updatePosition(scene : scene)
        updateImage(numFrames: numOfFramesForUpdate)
        updateImagePositions()
        displayImage(imageId: 0)
        updateCape()
        
        popCounter += 1

        if(popCounter >= 300) {
            popCounter = 0
        }
        
        if(State.levelId == LevelId.OCEAN) {
            bubbles.popBubbles(pos: getPosition(), scene: scene, sound: [bubblesSound])
        }
    }
    
    override func displayImage(imageId _: Int) {
        if hit {
            self.displayImageNotHit(imageId: 1)
        }
        if !hit {
            self.displayImageNotHit(imageId: 0)
        }
    }
    
    func updatePosition(scene : SKScene) {
        if(popCounter < 180) {
            posX = State.trajectory.first?.x ?? 0
            posY = State.trajectory.first?.y ?? 0
            randomAngle = Double.random(in: 0...(2 * .pi))
        }
        else {
            
            // Calculate the cosine
            let cosineValue = cos(randomAngle)
            let sineValue = sin(randomAngle)
            
            posX = posX + 100 * cosineValue
            posY = posY + 100 * sineValue
        }
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
    
    private func updateCape() {
        self.cape1.position.x = self.posX - self.cape1.size.width / 2
        self.cape1.position.y = self.posY
        self.cape2.position.x = self.posX - self.cape2.size.width / 2
        self.cape2.position.y = self.posY
        
        if capeCounter <= 5 {
            showCape1()
        }
        else if capeCounter < 10{
            showCape2()
        }
        else if capeCounter == 10 {
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
}
