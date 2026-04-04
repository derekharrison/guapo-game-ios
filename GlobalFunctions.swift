//
//  GlobalFunctions.swift
//  SoloMission
//
//  Created by Derek Harrison on 04/10/2023.
//

import Foundation
import SpriteKit

func saveSnack(object : Snack, prefix : String) {
    saveObject(object: object, prefix: prefix)
}

func saveSnacks(snacks : [Snack], prefix : String) {
    let defaults = UserDefaults()
    
    var counter = 0
    
    for snack in snacks {
        saveSnack(object: snack, prefix: prefix + String(counter))
        counter += 1
    }
    defaults.set(snacks.count, forKey: prefix + "numSnacks")
    
}

func getSnacks(snacks : inout [Snack], prefix : String) {
    let defaults = UserDefaults()
    let numSnacks = defaults.integer(forKey: prefix + "numSnacks")
    for counter in 0..<numSnacks {
        getSnack(object: &snacks[counter], prefix: prefix + String(counter))
    }
}

func getSnack(object : inout Snack, prefix : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: prefix + "zPos"))
    object.velX = CGFloat(defaults.float(forKey: prefix + "velX"))
    object.velY = CGFloat(defaults.float(forKey: prefix + "velY"))
    object.playSound = defaults.bool(forKey: prefix + "playSound")
    object.frameCounter = defaults.integer(forKey: prefix + "birdCounter")
    object.frameCounterHit = defaults.integer(forKey: prefix + "birdCounterHit")
    object.imageId = defaults.integer(forKey: prefix + "birdId")
    object.imageIdHit = defaults.integer(forKey: prefix + "birdIdHit")
    object.width = CGFloat(defaults.float(forKey: prefix + "width"))
    object.height = CGFloat(defaults.float(forKey: prefix + "height"))
    object.hit = defaults.bool(forKey: prefix + "hit")
    object.appeared = defaults.bool(forKey: prefix + "appeared")
    object.posX = CGFloat(defaults.float(forKey: prefix + "posX"))
    object.posY = CGFloat(defaults.float(forKey: prefix + "posY"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: prefix + "bubbles.bubCounter")
    object.bubbles.isMuted = defaults.bool(forKey: prefix + "bubbles.isMuted")
    object.points_snack = defaults.integer(forKey: prefix + "pointsSnack")
}

func saveMisty(object : Misty, levelId : String) {

    let defaults = UserDefaults()
    
    defaults.set(object.zPos, forKey: levelId + MISTY_STR + "zPos")
    defaults.set(object.velX, forKey: levelId + MISTY_STR + "velX")
    defaults.set(object.velY, forKey: levelId + MISTY_STR + "velY")
    defaults.set(object.playSound, forKey: levelId + MISTY_STR + "playSound")
    defaults.set(object.frameCounter, forKey: levelId + MISTY_STR + "birdCounter")
    defaults.set(object.frameCounterHit, forKey: levelId + MISTY_STR + "birdCounterHit")
    defaults.set(object.imageId, forKey: levelId + MISTY_STR + "birdId")
    defaults.set(object.imageIdHit, forKey: levelId + MISTY_STR + "birdIdHit")
    defaults.set(object.width, forKey: levelId + MISTY_STR + "width")
    defaults.set(object.height, forKey: levelId + MISTY_STR + "height")
    defaults.set(object.hit, forKey: levelId + MISTY_STR + "hit")
    defaults.set(object.appeared, forKey: levelId + MISTY_STR + "appeared")
    defaults.set(object.posX, forKey: levelId + MISTY_STR + "posX")
    defaults.set(object.posY, forKey: levelId + MISTY_STR + "posY")
    
    defaults.set(object.bubbles.bubcounter, forKey: levelId + MISTY_STR + "bubbles.bubCounter")
    defaults.set(object.bubbles.isMuted, forKey: levelId + MISTY_STR + "bubbles.isMuted")
    
    defaults.set(object.top, forKey: levelId + MISTY_STR + "top")
    defaults.set(object.counter1, forKey: levelId + MISTY_STR + "counter1")
    defaults.set(object.counter2, forKey: levelId + MISTY_STR + "counter2")
}

func getMisty(object : inout Misty, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "zPos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "velX"))
    object.velY = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "velY"))
    object.playSound = defaults.bool(forKey: levelId + MISTY_STR + "playSound")
    object.frameCounter = defaults.integer(forKey: levelId + MISTY_STR + "birdCounter")
    object.frameCounterHit = defaults.integer(forKey: levelId + MISTY_STR + "birdCounterHit")
    object.imageId = defaults.integer(forKey: levelId + MISTY_STR + "birdId")
    object.imageIdHit = defaults.integer(forKey: levelId + MISTY_STR + "birdIdHit")
    object.width = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "height"))
    object.hit = defaults.bool(forKey: levelId + MISTY_STR + "hit")
    object.appeared = defaults.bool(forKey: levelId + MISTY_STR + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "posX"))
    object.posY = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "posY"))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + MISTY_STR + "bubbles.bubCounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + MISTY_STR + "bubbles.isMuted")
    
    object.top = defaults.bool(forKey: levelId + MISTY_STR + "top")
    object.counter1 = defaults.integer(forKey: levelId + MISTY_STR + "counter1")
    object.counter2 = defaults.integer(forKey: levelId + MISTY_STR + "counter2")
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
}

func saveObject(object : GameObject, prefix : String) {
    let defaults = UserDefaults()
    
    defaults.set(object.zPos, forKey: prefix + "zPos")
    defaults.set(object.velX, forKey: prefix + "velX")
    defaults.set(object.velY, forKey: prefix + "velY")
    defaults.set(object.playSound, forKey: prefix + "playSound")
    defaults.set(object.frameCounter, forKey: prefix + "birdCounter")
    defaults.set(object.frameCounterHit, forKey: prefix + "birdCounterHit")
    defaults.set(object.imageId, forKey: prefix + "birdId")
    defaults.set(object.imageIdHit, forKey: prefix + "birdIdHit")
    defaults.set(object.width, forKey: prefix + "width")
    defaults.set(object.height, forKey: prefix + "height")
    defaults.set(object.hit, forKey: prefix + "hit")
    defaults.set(object.appeared, forKey: prefix + "appeared")
    defaults.set(object.posX, forKey: prefix + "posX")
    defaults.set(object.posY, forKey: prefix + "posY")
    
    defaults.set(object.bubbles.bubcounter, forKey: prefix + "bubbles.bubCounter")
    defaults.set(object.bubbles.isMuted, forKey: prefix + "bubbles.isMuted")
}

func getFish(object : inout Fish, levelId : String, prefix : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + prefix + "zPos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + prefix + "velX"))
    object.velY = CGFloat(defaults.float(forKey: levelId + prefix + "velY"))
    object.playSound = defaults.bool(forKey: levelId + prefix + "playSound")
    object.frameCounter = defaults.integer(forKey: levelId + prefix + "birdCounter")
    object.frameCounterHit = defaults.integer(forKey: levelId + prefix + "birdCounterHit")
    object.imageId = defaults.integer(forKey: levelId + prefix + "birdId")
    object.imageIdHit = defaults.integer(forKey: levelId + prefix + "birdIdHit")
    object.width = CGFloat(defaults.float(forKey: levelId + prefix + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + prefix + "height"))
    object.hit = defaults.bool(forKey: levelId + prefix + "hit")
    object.appeared = defaults.bool(forKey: levelId + prefix + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + prefix + "posX"))
    object.posY = CGFloat(defaults.float(forKey: levelId + prefix + "posY"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + prefix + "bubbles.bubCounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + prefix + "bubbles.isMuted")
}

func getBlowfish(object : inout BlowFish, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "zPos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "velX"))
    object.velY = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "velY"))
    object.playSound = defaults.bool(forKey: levelId + BLOWFISH_STR + "playSound")
    object.frameCounter = defaults.integer(forKey: levelId + BLOWFISH_STR + "birdCounter")
    object.frameCounterHit = defaults.integer(forKey: levelId + BLOWFISH_STR + "birdCounterHit")
    object.imageId = defaults.integer(forKey: levelId + BLOWFISH_STR + "birdId")
    object.imageIdHit = defaults.integer(forKey: levelId + BLOWFISH_STR + "birdIdHit")
    object.width = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "height"))
    object.hit = defaults.bool(forKey: levelId + BLOWFISH_STR + "hit")
    object.appeared = defaults.bool(forKey: levelId + BLOWFISH_STR + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "posX"))
    object.posY = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "posY"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + BLOWFISH_STR + "bubbles.bubCounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + BLOWFISH_STR + "bubbles.isMuted")
}

func getBrownie(object : inout Brownie, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "zPos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "velX"))
    object.velY = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "velY"))
    object.playSound = defaults.bool(forKey: levelId + BROWNIE_STR + "playSound")
    object.frameCounter = defaults.integer(forKey: levelId + BROWNIE_STR + "birdCounter")
    object.frameCounterHit = defaults.integer(forKey: levelId + BROWNIE_STR + "birdCounterHit")
    object.imageId = defaults.integer(forKey: levelId + BROWNIE_STR + "birdId")
    object.imageIdHit = defaults.integer(forKey: levelId + BROWNIE_STR + "birdIdHit")
    object.width = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "height"))
    object.hit = defaults.bool(forKey: levelId + BROWNIE_STR + "hit")
    object.appeared = defaults.bool(forKey: levelId + BROWNIE_STR + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "posX"))
    object.posY = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "posY"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + BROWNIE_STR + "bubbles.bubCounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + BROWNIE_STR + "bubbles.isMuted")
}

func getFrito(object : inout Frito, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "zPos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "velX"))
    object.velY = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "velY"))
    object.playSound = defaults.bool(forKey: levelId + FRITO_STR + "playSound")
    object.frameCounter = defaults.integer(forKey: levelId + FRITO_STR + "birdCounter")
    object.frameCounterHit = defaults.integer(forKey: levelId + FRITO_STR + "birdCounterHit")
    object.imageId = defaults.integer(forKey: levelId + FRITO_STR + "birdId")
    object.imageIdHit = defaults.integer(forKey: levelId + FRITO_STR + "birdIdHit")
    object.width = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "height"))
    object.hit = defaults.bool(forKey: levelId + FRITO_STR + "hit")
    object.appeared = defaults.bool(forKey: levelId + FRITO_STR + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "posX"))
    object.posY = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "posY"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + FRITO_STR + "bubbles.bubCounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + FRITO_STR + "bubbles.isMuted")
}

func getPlayer(object : inout Player, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "zPos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "velX"))
    object.velY = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "velY"))
    object.playSound = defaults.bool(forKey: levelId + PLAYER_STR + "playSound")
    object.frameCounter = defaults.integer(forKey: levelId + PLAYER_STR + "birdCounter")
    object.frameCounterHit = defaults.integer(forKey: levelId + PLAYER_STR + "birdCounterHit")
    object.imageId = defaults.integer(forKey: levelId + PLAYER_STR + "birdId")
    object.imageIdHit = defaults.integer(forKey: levelId + PLAYER_STR + "birdIdHit")
    object.width = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "height"))
    object.hit = defaults.bool(forKey: levelId + PLAYER_STR + "hit")
    object.appeared = defaults.bool(forKey: levelId + PLAYER_STR + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "posX"))
    object.posY = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "posY"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + PLAYER_STR + "bubbles.bubCounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + PLAYER_STR + "bubbles.isMuted")
}

func startScene(scene : SKScene, start : inout Bool, gameLevel : SKScene) {
    if start {
        let sceneToMoveTo = gameLevel
        sceneToMoveTo.scaleMode = scene.scaleMode
        let myTransition = SKTransition.fade(withDuration: 3.0)
        scene.view!.presentScene(sceneToMoveTo, transition: myTransition)
        
        start = false
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
