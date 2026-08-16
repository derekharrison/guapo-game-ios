//
//  PlayerBuilder.swift
//  SoloMission
//
//  Created by Derek Harrison on 16/08/2026.
//

import Foundation
import SpriteKit

class PlayerBuilder {
    var player : Player
    var scene : SKScene
    
    init(scene : SKScene) {
        player = Player()
        self.scene = scene
    }
    
    func images(images: [String]) -> PlayerBuilder {
        for x in images {
            self.player.addImage(image: x)
        }
        return self
    }
    
    func imageHit(imageHit: String) -> PlayerBuilder {
        self.player.addImageHit(image: imageHit)
        return self
    }
    
    func size(size: CGSize) -> PlayerBuilder {
        self.player.setSize(size: size)
        return self
    }
    
    func zPos(zPos : CGFloat) -> PlayerBuilder {
        self.player.setZPosition(zPos: zPos)
        return self
    }
    
    func position(position: CGPoint) -> PlayerBuilder {
        self.player.setPosition(position: position)
        return self
    }
    
    func height(height : CGFloat) -> PlayerBuilder {
        self.player.setHeight(height: height)
        return self
    }
    
    func width(width : CGFloat) -> PlayerBuilder {
        self.player.setWidth(width: width)
        return self
    }
    
    func build() -> Player {
        self.player.addImagesToScene(scene: scene)
        return self.player;
    }
}
