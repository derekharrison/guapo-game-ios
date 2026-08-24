//
//  GameLevel5.swift
//  SoloMission
//
//  Created by Derek Harrison on 04/10/2023.
//

import Foundation
import SpriteKit

class GameLevel5 : SKScene {
    
    var gameScene = GameScene()

    override func update(_ _: TimeInterval) {
        gameScene.update()
    }
    
    override func didMove(to _: SKView) {
        
        let levelId = LevelId.UTREG
        
        State.levelId = LevelId.UTREG
        
        gameScene = GameSceneBuilder()
            .scene(scene: self)
            .birdImages(VillainImages.getVillainImages(levelId: levelId))
            .mistyImages(MistyImages.getMistyImages(levelId: levelId))
            .brownieImages(BrownieImages.getBrownieImages(levelId: levelId))
            .fritoImages(FritoImages.getImages(levelId: levelId))
            .backgroundPrefix(backgroundUtrechtLevelPrefix)
            .numBackgrounds(numberOfBackgroundImagesUtrechtLevel)
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

