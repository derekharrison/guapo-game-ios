//
//  ModelUtils.swift
//  SoloMission
//
//  Created by Derek Harrison on 25/08/2026.
//

class ModelUtils {
    static func getLevelIdKeyPrefix(id : LevelId) -> Int {
        if(id == LevelId.ARUBA) {
            return 0
        }
        if(id == LevelId.BEACH) {
            return 1
        }
        if(id == LevelId.TRIP) {
            return 2
        }
        if(id == LevelId.OCEAN) {
            return 3
        }
        if(id == LevelId.UTREG) {
            return 4
        }
        return 0
    }
    
    static func startGame() {
        State.gameState = GameState.inGame
        pauseButtonNode.zPosition = zPosPauseButton
        playButtonNode.zPosition = -1
    }
}
