//
//  GameLevel3.swift
//  SoloMission
//
//  Created by Derek Harrison on 25/09/2023.
//

import Foundation

import SpriteKit
import GameplayKit

class GameLevel3: SKScene {
    
    var gameScene = GameScene()

    override func update(_ _: TimeInterval) {
        gameScene.update()
    }
    
    override func didMove(to _: SKView) {
        
        let levelId = LevelId.TRIP
        
        State.levelId = LevelId.TRIP
        
        gameScene = GameSceneBuilder()
            .scene(scene: self)
            .birdImages(VillainImages.getVillainImages(levelId: levelId))
            .mistyImages(MistyImages.getMistyImages(levelId: levelId))
            .brownieImages(BrownieImages.getBrownieImages(levelId: levelId))
            .fritoImages(FritoImages.getImages(levelId: levelId))
            .backgroundPrefix(backgroundTripLevelPrefix)
            .numBackgrounds(numberOfBackgroundImagesTripLevel)
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

