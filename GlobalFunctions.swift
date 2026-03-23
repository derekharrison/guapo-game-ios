//
//  GlobalFunctions.swift
//  SoloMission
//
//  Created by Derek Harrison on 04/10/2023.
//

import Foundation
import SpriteKit

func save_snack(object : Snack, prefix : String) {
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
    defaults.set(object.points_snack, forKey: prefix + "points_snack")
}

func save_snacks(snacks : [Snack], prefix : String) {
    let defaults = UserDefaults()
    
    var counter = 0
    
    for snack in snacks {
        save_snack(object: snack, prefix: prefix + String(counter))
        counter += 1
    }
    defaults.set(snacks.count, forKey: prefix + "num_snacks")
    
}

func get_snacks(snacks : inout [Snack], prefix : String) {
    let defaults = UserDefaults()
    let num_snacks = defaults.integer(forKey: prefix + "num_snacks")
    for counter in 0..<num_snacks {
        get_snack(object: &snacks[counter], prefix: prefix + String(counter))
    }
}

func get_snack(object : inout Snack, prefix : String) {
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

func save_misty(object : Misty, prefix : String) {

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
    
    defaults.set(object.top, forKey: prefix + "top")
    defaults.set(object.counter1, forKey: prefix + "counter1")
    defaults.set(object.counter2, forKey: prefix + "counter2")
}

func get_misty_object(object : inout Misty, prefix : String) {
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
    
    object.bubbles.bubcounter = defaults.integer(forKey: prefix + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: prefix + "bubbles.is_muted")
    
    object.top = defaults.bool(forKey: prefix + "top")
    object.counter1 = defaults.integer(forKey: prefix + "counter1")
    object.counter2 = defaults.integer(forKey: prefix + "counter2")
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
}

func save_object(object : GameObject, prefix : String) {
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

func getFish(object : inout Fish, prefix : String) {
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

func get_player_object(object : inout Player, prefix : String) {
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
}

func start_scene(scene : SKScene, start : inout Bool, GameLevel : SKScene) {
    if start {
        let sceneToMoveTo = GameLevel
        sceneToMoveTo.scaleMode = scene.scaleMode
        let myTransition = SKTransition.fade(withDuration: 3.0)
        scene.view!.presentScene(sceneToMoveTo, transition: myTransition)
        
        start = false
    }
}

func play_sound_api(scene : SKScene, sound : [SKAction]) {
    let bubble_sound = SKSpriteNode()
    bubble_sound.removeFromParent()
    scene.addChild(bubble_sound)

    let bubble_sound_biteSequence = SKAction.sequence(sound)
    bubble_sound.run(bubble_sound_biteSequence)
}

func getRandomNumber() -> CGFloat {
    CGFloat(Float(arc4random()) / Float(UINT32_MAX))
}

func doOverlap(l1: CGPoint ,r1: CGPoint, l2: CGPoint, r2: CGPoint) -> Bool {
 
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

func check_collision(bird : GameObject, player : Player, den : CGFloat) -> Bool {
    
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
                    
    return doOverlap(l1: l1 ,r1: r1, l2: l2, r2: r2)
}
