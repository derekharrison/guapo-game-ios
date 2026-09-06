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
    var scene = SKScene()
    
    init() {
        // Allow construction of base model
    }
    
    init(scene: SKScene) {
        self.scene = scene
        
        initGameVariables()
        
        createGraphics(scene: scene)
        
        createModelUpdate(scene: scene)
        
        startGame()
    }
    
    private func createGraphics(scene: SKScene) {
        GraphicsBuilder()
            .graphics(graphics: graphics)
            .scene(scene: scene)
            .levelId(id: getLevelId())
            .build()
    }
    
    private func createModelUpdate(scene: SKScene) {
        modelUpdate = ModelUpdate(graphics : graphics, scene: scene)
    }

    private func initGameVariables() {
        gameScore = 0
        if(State.gameState == GameState.continueGame) {
            boundTracker = getBoundTracker()
            scoreAtWhichToSaveGameState = getScoreAtWhichToSaveGameState()
            getOther()
        }
        else {
            initLives()
            initScore()
            initNumVillains()
            
            initScoreAtWhichToSaveGameState()
            initBoundTracker()
        }
    }
    
    private func initLives() {
        numLives = 3
        State.lives = 3
    }
    
    private func initScore() {
        gameScore = 0
    }
    
    private func initNumVillains() {
        numBirds = 1
        numJellyFish = 1
    }
    
    private func initScoreAtWhichToSaveGameState() {
        scoreAtWhichToSaveGameState = 0
    }
    
    private func initBoundTracker() {
        boundTracker = 1
    }
    
    private func startGame() {
        ModelUtils.startGame()
    }
    
    private func getLevelId() -> LevelId {
        return State.levelId
    }
}

