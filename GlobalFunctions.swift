//
//  GlobalFunctions.swift
//  SoloMission
//
//  Created by Derek Harrison on 04/10/2023.
//

import Foundation
import SpriteKit

func startScene(scene : SKScene, start : inout Bool, gameLevel : SKScene) {
    if start {
        let sceneToMoveTo = gameLevel
        State.gameState = .continueGame
        sceneToMoveTo.scaleMode = scene.scaleMode
        let myTransition = SKTransition.fade(withDuration: 3.0)
        scene.view!.presentScene(sceneToMoveTo, transition: myTransition)
        
        start = false
    }
}

func startScene(scene : SKScene, start : inout Bool) {
    if start {
        State.gameState = .afterGame
        let sceneToMoveTo = MainMenuScene(size: scene.size)
        sceneToMoveTo.scaleMode = scene.scaleMode
        let myTransition = SKTransition.fade(withDuration: 3.0)
        scene.view!.presentScene(sceneToMoveTo, transition: myTransition)
        
        start = false
    }
}

func startLevel(levelId : LevelId, scene : SKScene, start : inout Bool, gameLevel : SKScene) {
    if start {
        resetState(levelId: levelId)
        let sceneToMoveTo = gameLevel
        sceneToMoveTo.scaleMode = scene.scaleMode
        let transition = SKTransition.fade(withDuration: 3.0)
        scene.view!.presentScene(sceneToMoveTo, transition: transition)
        start = false
    }
}

private func resetState(levelId: LevelId) {
    setLevelId(levelId: levelId)
    State.gameState = .preGame
}

private func setLevelId(levelId: LevelId) {
    State.levelId = .ARUBA
    
    if(levelId == LevelId.ARUBA) {
        State.levelId = .ARUBA
    }
    if(levelId == LevelId.BEACH) {
        State.levelId = .BEACH
    }
    if(levelId == LevelId.TRIP) {
        State.levelId = .TRIP
    }
    if(levelId == LevelId.OCEAN) {
        State.levelId = .OCEAN
    }
    if(levelId == LevelId.UTREG) {
        State.levelId = .UTREG
    }
}

func playSound(scene : SKScene, sound : [SKAction]) {
    let bubbleSound = SKSpriteNode()
    bubbleSound.removeFromParent()
    scene.addChild(bubbleSound)

    let bubbleSoundBiteSequence = SKAction.sequence(sound)
    bubbleSound.run(bubbleSoundBiteSequence)
}

func getRandomNumber() -> CGFloat {
    CGFloat(Float(arc4random()) / Float(UINT32_MAX))
}

func objectsOverlap(l1: CGPoint ,r1: CGPoint, l2: CGPoint, r2: CGPoint) -> Bool {
 
    // At least one of the rectangles is a line
    if (l1.x == r1.x || l1.y == r1.y || l2.x == r2.x
        || l2.y == r2.y) {
        return false;
    }
 
    // If one rectangle is on left side of other
    if (l1.x >= r2.x || l2.x >= r1.x) {
        return false;
    }
 
    // If one rectangle is above other
    if (r1.y >= l2.y || r2.y >= l1.y) {
        return false;
    }
 
    return true
}

func objectCollidedWithPlayer(bird : GameObject, player : Player, den : CGFloat) -> Bool {

    if(bird.images.isEmpty) {
        return false
    }
    
    var l1 = bird.images[0].position
    var r1 = l1
    l1.x -= bird.getSize().width / den
    l1.y += bird.getSize().height / den
    r1.x += bird.getSize().width / den
    r1.y -= bird.getSize().height / den
    var l2 = player.images[0].position
    var r2 = player.images[0].position
    l2.x -= player.images[0].size.width / den
    l2.y += player.images[0].size.height / den
    r2.x += player.images[0].size.width / den
    r2.y -= player.images[0].size.height / den
                    
    return objectsOverlap(l1: l1 ,r1: r1, l2: l2, r2: r2)
}
