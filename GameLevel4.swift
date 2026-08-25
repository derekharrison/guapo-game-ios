//
//  GameLevel4.swift
//  SoloMission
//
//  Created by Derek Harrison on 25/09/2023.
//

import Foundation

import SpriteKit
import GameplayKit

class GameLevel4: SKScene {
    var levelId = LevelId.OCEAN
    var gameScene = GameScene()
 
    override func update(_ _: TimeInterval) {
        gameScene.update()
    }
    
    override func didMove(to _: SKView) {
        State.levelId = LevelId.OCEAN
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

