//
//  GameLevel5.swift
//  SoloMission
//
//  Created by Derek Harrison on 04/10/2023.
//

import Foundation
import SpriteKit

class GameLevel5 : SKScene {
    
    var base = GameScene()

    override func update(_ _: TimeInterval) {
        base.update()
    }
    
    override func didMove(to _: SKView) {
        base.createScene(scene: self, id: levelId5)
        State.levelId = LevelId.UTREG
        
        var images = [String]()
        images.append(fritoImage)
        images.append(fritoHitImage)
        
        base.createFrito(images: images, height: self.size.height, width: self.size.width)
        base.createBackgrounds(scene: self, numBackgrounds: numberOfBackgroundImagesUtrechtLevel, string1: backgroundUtrechtLevelPrefix)
        
        var imagesBrownie = [String]()
        imagesBrownie.append(brownieImage)
        imagesBrownie.append(brownieHitImage)
        
        base.createBrownie(images: imagesBrownie, height: self.size.height, width: self.size.width)
        
        var imagesMisty = [String]()
        imagesMisty.append(mistyImage)
        imagesMisty.append(mistyHitImage)
        imagesMisty.append(mistyRotatedImage)
        imagesMisty.append(mistyRotatedHitImage)
        base.createMisty(images: imagesMisty, height: self.size.height, width: self.size.width)
        
        var birdImages = [String]()
        
        birdImages.append(waraWaraImage1)
        birdImages.append(waraWaraImage2)
        birdImages.append(waraWaraImage3)
        
        base.createBirds(images: birdImages)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        base.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        base.touchesMoved(touches, with: event)
    }
}

