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
    defaults.set(snacks.count, forKey: prefix + "num_snacks")
    
}

func getSnacks(snacks : inout [Snack], prefix : String) {
    let defaults = UserDefaults()
    let num_snacks = defaults.integer(forKey: prefix + "num_snacks")
    for counter in 0..<num_snacks {
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
    object.points_snack = defaults.integer(forKey: prefix + "points_snack")
}

func saveMisty(object : Misty, levelId : String) {

    let defaults = UserDefaults()
    
    defaults.set(object.zPos, forKey: levelId + MISTY_STR + "z_pos")
    defaults.set(object.velX, forKey: levelId + MISTY_STR + "vel_x")
    defaults.set(object.velY, forKey: levelId + MISTY_STR + "vel_y")
    defaults.set(object.playSound, forKey: levelId + MISTY_STR + "play_sound")
    defaults.set(object.frameCounter, forKey: levelId + MISTY_STR + "bird_counter")
    defaults.set(object.frameCounterHit, forKey: levelId + MISTY_STR + "bird_counter_hit")
    defaults.set(object.imageId, forKey: levelId + MISTY_STR + "bird_id")
    defaults.set(object.imageIdHit, forKey: levelId + MISTY_STR + "bird_id_hit")
    defaults.set(object.width, forKey: levelId + MISTY_STR + "width")
    defaults.set(object.height, forKey: levelId + MISTY_STR + "height")
    defaults.set(object.hit, forKey: levelId + MISTY_STR + "hit")
    defaults.set(object.appeared, forKey: levelId + MISTY_STR + "appeared")
    defaults.set(object.posX, forKey: levelId + MISTY_STR + "pos_x")
    defaults.set(object.posY, forKey: levelId + MISTY_STR + "pos_y")
    
    defaults.set(object.bubbles.bubcounter, forKey: levelId + MISTY_STR + "bubbles.bubcounter")
    defaults.set(object.bubbles.isMuted, forKey: levelId + MISTY_STR + "bubbles.is_muted")
    
    defaults.set(object.top, forKey: levelId + MISTY_STR + "top")
    defaults.set(object.counter1, forKey: levelId + MISTY_STR + "counter1")
    defaults.set(object.counter2, forKey: levelId + MISTY_STR + "counter2")
}

func getMisty(object : inout Misty, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "z_pos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "vel_x"))
    object.velY = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "vel_y"))
    object.playSound = defaults.bool(forKey: levelId + MISTY_STR + "play_sound")
    object.frameCounter = defaults.integer(forKey: levelId + MISTY_STR + "bird_counter")
    object.frameCounterHit = defaults.integer(forKey: levelId + MISTY_STR + "bird_counter_hit")
    object.imageId = defaults.integer(forKey: levelId + MISTY_STR + "bird_id")
    object.imageIdHit = defaults.integer(forKey: levelId + MISTY_STR + "bird_id_hit")
    object.width = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "height"))
    object.hit = defaults.bool(forKey: levelId + MISTY_STR + "hit")
    object.appeared = defaults.bool(forKey: levelId + MISTY_STR + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "pos_x"))
    object.posY = CGFloat(defaults.float(forKey: levelId + MISTY_STR + "pos_y"))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + MISTY_STR + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + MISTY_STR + "bubbles.is_muted")
    
    object.top = defaults.bool(forKey: levelId + MISTY_STR + "top")
    object.counter1 = defaults.integer(forKey: levelId + MISTY_STR + "counter1")
    object.counter2 = defaults.integer(forKey: levelId + MISTY_STR + "counter2")
    
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
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "z_pos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "vel_x"))
    object.velY = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "vel_y"))
    object.playSound = defaults.bool(forKey: levelId + BLOWFISH_STR + "play_sound")
    object.frameCounter = defaults.integer(forKey: levelId + BLOWFISH_STR + "bird_counter")
    object.frameCounterHit = defaults.integer(forKey: levelId + BLOWFISH_STR + "bird_counter_hit")
    object.imageId = defaults.integer(forKey: levelId + BLOWFISH_STR + "bird_id")
    object.imageIdHit = defaults.integer(forKey: levelId + BLOWFISH_STR + "bird_id_hit")
    object.width = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "height"))
    object.hit = defaults.bool(forKey: levelId + BLOWFISH_STR + "hit")
    object.appeared = defaults.bool(forKey: levelId + BLOWFISH_STR + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "pos_x"))
    object.posY = CGFloat(defaults.float(forKey: levelId + BLOWFISH_STR + "pos_y"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + BLOWFISH_STR + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + BLOWFISH_STR + "bubbles.is_muted")
}

func getBrownie(object : inout Brownie, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "z_pos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "vel_x"))
    object.velY = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "vel_y"))
    object.playSound = defaults.bool(forKey: levelId + BROWNIE_STR + "play_sound")
    object.frameCounter = defaults.integer(forKey: levelId + BROWNIE_STR + "bird_counter")
    object.frameCounterHit = defaults.integer(forKey: levelId + BROWNIE_STR + "bird_counter_hit")
    object.imageId = defaults.integer(forKey: levelId + BROWNIE_STR + "bird_id")
    object.imageIdHit = defaults.integer(forKey: levelId + BROWNIE_STR + "bird_id_hit")
    object.width = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "height"))
    object.hit = defaults.bool(forKey: levelId + BROWNIE_STR + "hit")
    object.appeared = defaults.bool(forKey: levelId + BROWNIE_STR + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "pos_x"))
    object.posY = CGFloat(defaults.float(forKey: levelId + BROWNIE_STR + "pos_y"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + BROWNIE_STR + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + BROWNIE_STR + "bubbles.is_muted")
}

func getFrito(object : inout Frito, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "z_pos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "vel_x"))
    object.velY = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "vel_y"))
    object.playSound = defaults.bool(forKey: levelId + FRITO_STR + "play_sound")
    object.frameCounter = defaults.integer(forKey: levelId + FRITO_STR + "bird_counter")
    object.frameCounterHit = defaults.integer(forKey: levelId + FRITO_STR + "bird_counter_hit")
    object.imageId = defaults.integer(forKey: levelId + FRITO_STR + "bird_id")
    object.imageIdHit = defaults.integer(forKey: levelId + FRITO_STR + "bird_id_hit")
    object.width = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "height"))
    object.hit = defaults.bool(forKey: levelId + FRITO_STR + "hit")
    object.appeared = defaults.bool(forKey: levelId + FRITO_STR + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "pos_x"))
    object.posY = CGFloat(defaults.float(forKey: levelId + FRITO_STR + "pos_y"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + FRITO_STR + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + FRITO_STR + "bubbles.is_muted")
}

func getPlayer(object : inout Player, levelId : String) {
    let defaults = UserDefaults()
    
    object.zPos = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "z_pos"))
    object.velX = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "vel_x"))
    object.velY = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "vel_y"))
    object.playSound = defaults.bool(forKey: levelId + PLAYER_STR + "play_sound")
    object.frameCounter = defaults.integer(forKey: levelId + PLAYER_STR + "bird_counter")
    object.frameCounterHit = defaults.integer(forKey: levelId + PLAYER_STR + "bird_counter_hit")
    object.imageId = defaults.integer(forKey: levelId + PLAYER_STR + "bird_id")
    object.imageIdHit = defaults.integer(forKey: levelId + PLAYER_STR + "bird_id_hit")
    object.width = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "width"))
    object.height = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "height"))
    object.hit = defaults.bool(forKey: levelId + PLAYER_STR + "hit")
    object.appeared = defaults.bool(forKey: levelId + PLAYER_STR + "appeared")
    object.posX = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "pos_x"))
    object.posY = CGFloat(defaults.float(forKey: levelId + PLAYER_STR + "pos_y"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: levelId + PLAYER_STR + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: levelId + PLAYER_STR + "bubbles.is_muted")
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
    let bubble_sound = SKSpriteNode()
    bubble_sound.removeFromParent()
    scene.addChild(bubble_sound)

    let bubble_sound_biteSequence = SKAction.sequence(sound)
    bubble_sound.run(bubble_sound_biteSequence)
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
