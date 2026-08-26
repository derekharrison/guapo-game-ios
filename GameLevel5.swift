//
//  GameLevel5.swift
//  SoloMission
//
//  Created by Derek Harrison on 04/10/2023.
//

import Foundation
import SpriteKit

class GameLevel5 : SKScene {
    let levelId = LevelId.UTREG
    
    var model = GameModel()

    override func update(_ _: TimeInterval) {
        model.modelUpdate.update()
    }
    
    override func didMove(to _: SKView) {
        State.levelId = levelId
        
        model = GameModel(scene: self, id: levelId)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        model.modelUpdate.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        model.modelUpdate.touchesMoved(touches, with: event)
    }
}

