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
    
    static func getNumBackgrounds(levelId : LevelId) -> Int {
        if(levelId == LevelId.ARUBA) {
            return numberOfBackgroundImagesArubaLevel
        }
        if(levelId == LevelId.BEACH) {
            return numberOfBackgroundImagesBeachLevel
        }
        if(levelId == LevelId.TRIP) {
            return numberOfBackgroundImagesTripLevel
        }
        if(levelId == LevelId.OCEAN) {
            return numberOfBackgroundImagesOceanLevel
        }
        if(levelId == LevelId.UTREG) {
            return numberOfBackgroundImagesUtrechtLevel
        }
        return numberOfBackgroundImagesArubaLevel
    }
    
    static func getBackgroundPrefix(levelId : LevelId) -> String {
        if(levelId == LevelId.ARUBA) {
            return backgroundArubaLevelPrefix
        }
        if(levelId == LevelId.BEACH) {
            return backgroundBeachLevelPrefix
        }
        if(levelId == LevelId.TRIP) {
            return backgroundTripLevelPrefix
        }
        if(levelId == LevelId.OCEAN) {
            return backgroundOceanLevelPrefix
        }
        if(levelId == LevelId.UTREG) {
            return backgroundUtrechtLevelPrefix
        }
        return backgroundArubaLevelPrefix
    }
}
