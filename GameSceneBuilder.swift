//
//  GameSceneBuilder.swift
//  SoloMission
//
//  Created by Derek Harrison on 24/08/2026.
//

import SpriteKit

class GameSceneBuilder {
    private var gameScene : GameScene = GameScene()
    private var scene : SKScene = SKScene()
    private var levelId: LevelId = LevelId.ARUBA
    
    func scene(scene : SKScene) -> Self {
        self.scene = scene
        return self
    }
    
    func levelId(_ levelId: LevelId) -> Self {
        self.levelId = levelId
        return self
    }
    
    func build() -> GameScene {
        gameScene.createScene(scene: scene, id: levelId)
        return gameScene
    }
}
