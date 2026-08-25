//
//  GameLevel1.swift
//  SoloMission
//
//  Created by Derek Harrison on 25/09/2023.
//

import Foundation
import SpriteKit

class GameLevel1 : SKScene {
    
    var gameScene = GameScene()
    var numBackgrounds: Int = numberOfBackgroundImagesArubaLevel
    
    override func update(_ _: TimeInterval) {
        gameScene.update()
    }
    
    override func didMove(to _: SKView) {
        let levelId = LevelId.ARUBA
        gameScene = GameSceneBuilder()
            .scene(scene: self)
            .levelId(levelId)
            .build()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        gameScene.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        gameScene.touchesMoved(touches, with: event)
    }
}

