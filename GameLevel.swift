//
//  GameLevel.swift
//  SoloMission
//
//  Created by Derek Harrison on 26/08/2026.
//

import SpriteKit

class GameLevel : SKScene {
    var model : GameModel = GameModel()
    
    override func update(_ _: TimeInterval) {
        model.modelUpdate.update()
    }
    
    override func didMove(to _: SKView) {
        model = GameModel(scene: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        model.modelUpdate.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        model.modelUpdate.touchesMoved(touches, with: event)
    }
}
