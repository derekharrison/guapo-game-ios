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
    
    object.zPos = CGFloat(defaults.float(forKey: prefix + "z_pos"))
    object.velX = CGFloat(defaults.float(forKey: prefix + "vel_x"))
    object.velY = CGFloat(defaults.float(forKey: prefix + "vel_y"))
    object.playSound = defaults.bool(forKey: prefix + "play_sound")
    object.frameCounter = defaults.integer(forKey: prefix + "bird_counter")
    object.frameCounterHit = defaults.integer(forKey: prefix + "bird_counter_hit")
    object.imageId = defaults.integer(forKey: prefix + "bird_id")
    object.imageIdHit = defaults.integer(forKey: prefix + "bird_id_hit")
    object.width = CGFloat(defaults.float(forKey: prefix + "width"))
    object.height = CGFloat(defaults.float(forKey: prefix + "height"))
    object.hit = defaults.bool(forKey: prefix + "hit")
    object.appeared = defaults.bool(forKey: prefix + "appeared")
    object.posX = CGFloat(defaults.float(forKey: prefix + "pos_x"))
    object.posY = CGFloat(defaults.float(forKey: prefix + "pos_y"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: prefix + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: prefix + "bubbles.is_muted")
    object.pointsForSnack = defaults.integer(forKey: prefix + "points_snack")
}

func saveMisty(object : Misty, levelId : String) {

    let defaults = UserDefaults()
    
    defaults.set(object.zPos, forKey: levelId + mistyKey + "z_pos")
    defaults.set(object.velX, forKey: levelId + mistyKey + "vel_x")
    defaults.set(object.velY, forKey: levelId + mistyKey + "vel_y")
    defaults.set(object.playSound, forKey: levelId + mistyKey + "play_sound")
    defaults.set(object.frameCounter, forKey: levelId + mistyKey + "bird_counter")
    defaults.set(object.frameCounterHit, forKey: levelId + mistyKey + "bird_counter_hit")
    defaults.set(object.imageId, forKey: levelId + mistyKey + "bird_id")
    defaults.set(object.imageIdHit, forKey: levelId + mistyKey + "bird_id_hit")
    defaults.set(object.width, forKey: levelId + mistyKey + "width")
    defaults.set(object.height, forKey: levelId + mistyKey + "height")
    defaults.set(object.hit, forKey: levelId + mistyKey + "hit")
    defaults.set(object.appeared, forKey: levelId + mistyKey + "appeared")
    defaults.set(object.posX, forKey: levelId + mistyKey + "pos_x")
    defaults.set(object.posY, forKey: levelId + mistyKey + "pos_y")
    
    defaults.set(object.bubbles.bubcounter, forKey: levelId + mistyKey + "bubbles.bubcounter")
    defaults.set(object.bubbles.isMuted, forKey: levelId + mistyKey + "bubbles.is_muted")
    
    defaults.set(object.top, forKey: levelId + mistyKey + "top")
    defaults.set(object.counter1, forKey: levelId + mistyKey + "counter1")
    defaults.set(object.counter2, forKey: levelId + mistyKey + "counter2")
}

func getMisty(object : inout Misty, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + mistyKey + "z_pos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + mistyKey + "vel_x"))
    object.velY = CGFloat(defaults.float(forKey: levelId + mistyKey + "vel_y"))
    object.playSound = defaults.bool(forKey: levelId + mistyKey + "play_sound")
    object.frameCounter = defaults.integer(forKey: levelId + mistyKey + "bird_counter")
    object.frameCounterHit = defaults.integer(forKey: levelId + mistyKey + "bird_counter_hit")
    object.imageId = defaults.integer(forKey: levelId + mistyKey + "bird_id")
    object.imageIdHit = defaults.integer(forKey: levelId + mistyKey + "bird_id_hit")
    object.width = CGFloat(defaults.float(forKey: levelId + mistyKey + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + mistyKey + "height"))
    object.hit = defaults.bool(forKey: levelId + mistyKey + "hit")
    object.appeared = defaults.bool(forKey: levelId + mistyKey + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + mistyKey + "pos_x"))
    object.posY = CGFloat(defaults.float(forKey: levelId + mistyKey + "pos_y"))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + mistyKey + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + mistyKey + "bubbles.is_muted")
    
    object.top = defaults.bool(forKey: levelId + mistyKey + "top")
    object.counter1 = defaults.integer(forKey: levelId + mistyKey + "counter1")
    object.counter2 = defaults.integer(forKey: levelId + mistyKey + "counter2")
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
}

func saveObject(object : GameObject, prefix : String) {
    let defaults = UserDefaults()
    
    defaults.set(object.zPos, forKey: prefix + "z_pos")
    defaults.set(object.velX, forKey: prefix + "vel_x")
    defaults.set(object.velY, forKey: prefix + "vel_y")
    defaults.set(object.playSound, forKey: prefix + "play_sound")
    defaults.set(object.frameCounter, forKey: prefix + "bird_counter")
    defaults.set(object.frameCounterHit, forKey: prefix + "bird_counter_hit")
    defaults.set(object.imageId, forKey: prefix + "bird_id")
    defaults.set(object.imageIdHit, forKey: prefix + "bird_id_hit")
    defaults.set(object.width, forKey: prefix + "width")
    defaults.set(object.height, forKey: prefix + "height")
    defaults.set(object.hit, forKey: prefix + "hit")
    defaults.set(object.appeared, forKey: prefix + "appeared")
    defaults.set(object.posX, forKey: prefix + "pos_x")
    defaults.set(object.posY, forKey: prefix + "pos_y")
    
    defaults.set(object.bubbles.bubcounter, forKey: prefix + "bubbles.bubcounter")
    defaults.set(object.bubbles.isMuted, forKey: prefix + "bubbles.is_muted")
}

func getFish(object : inout Fish, levelId : String, prefix : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + prefix + "z_pos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + prefix + "vel_x"))
    object.velY = CGFloat(defaults.float(forKey: levelId + prefix + "vel_y"))
    object.playSound = defaults.bool(forKey: levelId + prefix + "play_sound")
    object.frameCounter = defaults.integer(forKey: levelId + prefix + "bird_counter")
    object.frameCounterHit = defaults.integer(forKey: levelId + prefix + "bird_counter_hit")
    object.imageId = defaults.integer(forKey: levelId + prefix + "bird_id")
    object.imageIdHit = defaults.integer(forKey: levelId + prefix + "bird_id_hit")
    object.width = CGFloat(defaults.float(forKey: levelId + prefix + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + prefix + "height"))
    object.hit = defaults.bool(forKey: levelId + prefix + "hit")
    object.appeared = defaults.bool(forKey: levelId + prefix + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + prefix + "pos_x"))
    object.posY = CGFloat(defaults.float(forKey: levelId + prefix + "pos_y"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + prefix + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + prefix + "bubbles.is_muted")
}

func getBlowfish(object : inout BlowFish, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + blowFishKey + "z_pos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + blowFishKey + "vel_x"))
    object.velY = CGFloat(defaults.float(forKey: levelId + blowFishKey + "vel_y"))
    object.playSound = defaults.bool(forKey: levelId + blowFishKey + "play_sound")
    object.frameCounter = defaults.integer(forKey: levelId + blowFishKey + "bird_counter")
    object.frameCounterHit = defaults.integer(forKey: levelId + blowFishKey + "bird_counter_hit")
    object.imageId = defaults.integer(forKey: levelId + blowFishKey + "bird_id")
    object.imageIdHit = defaults.integer(forKey: levelId + blowFishKey + "bird_id_hit")
    object.width = CGFloat(defaults.float(forKey: levelId + blowFishKey + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + blowFishKey + "height"))
    object.hit = defaults.bool(forKey: levelId + blowFishKey + "hit")
    object.appeared = defaults.bool(forKey: levelId + blowFishKey + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + blowFishKey + "pos_x"))
    object.posY = CGFloat(defaults.float(forKey: levelId + blowFishKey + "pos_y"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + blowFishKey + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + blowFishKey + "bubbles.is_muted")
}

func getBrownie(object : inout Brownie, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + brownieKey + "z_pos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + brownieKey + "vel_x"))
    object.velY = CGFloat(defaults.float(forKey: levelId + brownieKey + "vel_y"))
    object.playSound = defaults.bool(forKey: levelId + brownieKey + "play_sound")
    object.frameCounter = defaults.integer(forKey: levelId + brownieKey + "bird_counter")
    object.frameCounterHit = defaults.integer(forKey: levelId + brownieKey + "bird_counter_hit")
    object.imageId = defaults.integer(forKey: levelId + brownieKey + "bird_id")
    object.imageIdHit = defaults.integer(forKey: levelId + brownieKey + "bird_id_hit")
    object.width = CGFloat(defaults.float(forKey: levelId + brownieKey + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + brownieKey + "height"))
    object.hit = defaults.bool(forKey: levelId + brownieKey + "hit")
    object.appeared = defaults.bool(forKey: levelId + brownieKey + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + brownieKey + "pos_x"))
    object.posY = CGFloat(defaults.float(forKey: levelId + brownieKey + "pos_y"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + brownieKey + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + brownieKey + "bubbles.is_muted")
}

func getFrito(object : inout Frito, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + fritoKey + "z_pos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + fritoKey + "vel_x"))
    object.velY = CGFloat(defaults.float(forKey: levelId + fritoKey + "vel_y"))
    object.playSound = defaults.bool(forKey: levelId + fritoKey + "play_sound")
    object.frameCounter = defaults.integer(forKey: levelId + fritoKey + "bird_counter")
    object.frameCounterHit = defaults.integer(forKey: levelId + fritoKey + "bird_counter_hit")
    object.imageId = defaults.integer(forKey: levelId + fritoKey + "bird_id")
    object.imageIdHit = defaults.integer(forKey: levelId + fritoKey + "bird_id_hit")
    object.width = CGFloat(defaults.float(forKey: levelId + fritoKey + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + fritoKey + "height"))
    object.hit = defaults.bool(forKey: levelId + fritoKey + "hit")
    object.appeared = defaults.bool(forKey: levelId + fritoKey + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + fritoKey + "pos_x"))
    object.posY = CGFloat(defaults.float(forKey: levelId + fritoKey + "pos_y"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + fritoKey + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + fritoKey + "bubbles.is_muted")
}

func getPlayer(object : inout Player, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + playerKey + "z_pos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + playerKey + "vel_x"))
    object.velY = CGFloat(defaults.float(forKey: levelId + playerKey + "vel_y"))
    object.playSound = defaults.bool(forKey: levelId + playerKey + "play_sound")
    object.frameCounter = defaults.integer(forKey: levelId + playerKey + "bird_counter")
    object.frameCounterHit = defaults.integer(forKey: levelId + playerKey + "bird_counter_hit")
    object.imageId = defaults.integer(forKey: levelId + playerKey + "bird_id")
    object.imageIdHit = defaults.integer(forKey: levelId + playerKey + "bird_id_hit")
    object.width = CGFloat(defaults.float(forKey: levelId + playerKey + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + playerKey + "height"))
    object.hit = defaults.bool(forKey: levelId + playerKey + "hit")
    object.appeared = defaults.bool(forKey: levelId + playerKey + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + playerKey + "pos_x"))
    object.posY = CGFloat(defaults.float(forKey: levelId + playerKey + "pos_y"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + playerKey + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + playerKey + "bubbles.is_muted")
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
