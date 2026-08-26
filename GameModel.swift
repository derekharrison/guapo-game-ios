//
//  GameLevel.swift
//  SoloMission
//
//  Created by Derek Harrison on 29/09/2023.
//

import Foundation
import SpriteKit

class GameModel {

    var graphics : Graphics = Graphics()
    var modelUpdate : ModelUpdate = ModelUpdate(graphics: Graphics(), scene: SKScene())
    var levelId : Int = 0
    var scene = SKScene()
    
    init() {}

    init(scene: SKScene, id : LevelId) {
        self.scene = scene
        
        initGameVariables(scene: scene)
        
        createGraphics(scene: scene, id: id)
        
        createModelUpdate(scene: scene)
        
        startGame()
    }
    
    private func createGraphics(scene: SKScene, id : LevelId) {
        GraphicsBuilder()
            .graphics(graphics: graphics)
            .scene(scene: scene)
            .id(id: id)
            .build()
    }
    
    private func createModelUpdate(scene: SKScene) {
        modelUpdate = ModelUpdate(graphics : graphics, scene: scene)
    }

    private func initGameVariables(scene: SKScene) {
        gameScore = 0
        boundTracker = 1
    }
    
    private func startGame() {
        ModelUtils.startGame()
    }
}

