//
//  GameLevel2.swift
//  SoloMission
//
//  Created by Derek Harrison on 25/09/2023.
//

import Foundation

import SpriteKit
import GameplayKit

class GameLevel2: SKScene {
    
    var model = GameModel()

    override func update(_ _: TimeInterval) {
        model.update()
    }

    override func didMove(to _: SKView) {
        let levelId = LevelId.BEACH
        
        State.levelId = LevelId.BEACH
        
        model = GameModel(scene: self, id: levelId)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        model.modelUpdate.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        model.modelUpdate.touchesMoved(touches, with: event)
    }
}

