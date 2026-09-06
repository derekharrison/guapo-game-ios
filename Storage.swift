//
//  Storage.swift
//  SoloMission
//
//  Created by Derek Harrison on 16/08/2026.
//

import Foundation
import SpriteKit


func getPlayerPosition(key: String) -> Position {
    let defaults = UserDefaults()
    let posX = defaults.float(forKey: key + "posX")
    let posY = defaults.float(forKey: key + "posY")
    return Position(posX: CGFloat(posX), posY: CGFloat(posY))
}

func savePlayerPosition(key: String, pos: CGPoint) {
    let defaults = UserDefaults()
    defaults.set(Int(pos.x), forKey: key + "posX")
    defaults.set(Int(pos.y), forKey: key + "posY")
}

func savePlayer(player : Player) {
    savePlayerPosition(key: String(State.levelId.hashValue) + "position", pos: player.getPosition())
}

func saveBoundTracker() {
    let defaults = UserDefaults()
    defaults.set(boundTracker, forKey: String(State.levelId.hashValue) + "boundTracker")
}

func getBoundTracker() -> Int {
    let defaults = UserDefaults()
    return defaults.integer(forKey: String(State.levelId.hashValue) + "boundTracker")
}

func saveCheesyBites(snacks : [Snack]) {
    let defaults = UserDefaults()
    var snackId = 0
    for cheesyBite in snacks {
        defaults.set(cheesyBite.posX, forKey: String(State.levelId.hashValue) + "cheesyBiteX" + String(snackId))
        defaults.set(cheesyBite.posY, forKey: String(State.levelId.hashValue) + "cheesyBiteY" + String(snackId))
        snackId += 1
    }
}

func getCheesyBitePosition(snack : Snack, snackId: Int) -> CGPoint {
    let defaults = UserDefaults()
    let posX = defaults.float(forKey: String(State.levelId.hashValue) + "cheesyBiteX" + String(snackId))
    let posY = defaults.float(forKey: String(State.levelId.hashValue) + "cheesyBiteY" + String(snackId))
    return CGPoint(x: Int(posX), y: Int(posY))
}

func savePaprika(snacks : [Snack]) {
    let defaults = UserDefaults()
    var snackId = 0
    for cheesyBite in snacks {
        defaults.set(cheesyBite.posX, forKey: String(State.levelId.hashValue) + "paprikaX" + String(snackId))
        defaults.set(cheesyBite.posY, forKey: String(State.levelId.hashValue) + "paprikaY" + String(snackId))
        snackId += 1
    }
}

func getPaprikaPosition(snack : Snack, snackId: Int) -> CGPoint {
    let defaults = UserDefaults()
    let posX = defaults.float(forKey: String(State.levelId.hashValue) + "paprikaX" + String(snackId))
    let posY = defaults.float(forKey: String(State.levelId.hashValue) + "paprikaY" + String(snackId))
    return CGPoint(x: Int(posX), y: Int(posY))
}


func saveBroccoli(snacks : [Snack]) {
    let defaults = UserDefaults()
    var snackId = 0
    for cheesyBite in snacks {
        defaults.set(cheesyBite.posX, forKey: String(State.levelId.hashValue) + "broccoliX" + String(snackId))
        defaults.set(cheesyBite.posY, forKey: String(State.levelId.hashValue) + "broccoliY" + String(snackId))
        snackId += 1
    }
}

func getSnackPosition(snack : Snack, snackId: Int, snackType: String) -> CGPoint {
    let defaults = UserDefaults()
    let posX = defaults.float(forKey: String(State.levelId.hashValue) + snackType + "X" + String(snackId))
    let posY = defaults.float(forKey: String(State.levelId.hashValue) + snackType + "Y" + String(snackId))
    return CGPoint(x: Int(posX), y: Int(posY))
}

func saveSnacks(snacks : [Snack], snackType: String) {
    let defaults = UserDefaults()
    var snackId = 0
    for cheesyBite in snacks {
        defaults.set(cheesyBite.posX, forKey: String(State.levelId.hashValue) + snackType + "X" + String(snackId))
        defaults.set(cheesyBite.posY, forKey: String(State.levelId.hashValue) + snackType + "Y" + String(snackId))
        snackId += 1
    }
}

func getBroccoli(snack : Snack, snackId: Int) -> CGPoint {
    let defaults = UserDefaults()
    let posX = defaults.float(forKey: String(State.levelId.hashValue) + "broccoliX" + String(snackId))
    let posY = defaults.float(forKey: String(State.levelId.hashValue) + "broccoliY" + String(snackId))
    return CGPoint(x: Int(posX), y: Int(posY))
}

func getFish(graphics : Graphics) {
    getFish(object: &graphics.fish1, prefix : fishKey1)
    getFish(object: &graphics.fish2, prefix : fishKey2)
    getFish(object: &graphics.fish3, prefix : fishKey3)
    getFish(object: &graphics.fish4, prefix : fishKey4)
    getFish(object: &graphics.fish5, prefix : fishKey5)
    getFish(object: &graphics.fish6, prefix : fishKey6)
    getBlowfish(object: &graphics.blowFish)
}

func saveFishes(graphics: Graphics) {
    saveObject(object: graphics.fish1, prefix: fishKey1)
    saveObject(object: graphics.fish2, prefix: fishKey2)
    saveObject(object: graphics.fish3, prefix: fishKey3)
    saveObject(object: graphics.fish4, prefix: fishKey4)
    saveObject(object: graphics.fish5, prefix: fishKey5)
    saveObject(object: graphics.fish6, prefix: fishKey6)
    saveObject(object: graphics.blowFish, prefix: blowFishKey)
}

func saveOther() {
    let defaults = UserDefaults()
    let levelId = State.levelId

    defaults.set(gameScore, forKey: String(getLevelIdInt(levelId: levelId)) + scoreKey)
    defaults.set(numLives, forKey: String(levelId.hashValue) + numberOfLivesKey)
}

func getOther() {
    let defaults = UserDefaults()
    let levelId = State.levelId
    
    gameScore = defaults.integer(forKey: String(getLevelIdInt(levelId: levelId)) + scoreKey)
    numLives = defaults.integer(forKey: String(levelId.hashValue) + numberOfLivesKey)
    
    numBirds = getNumBirds()
}

private func getLevelIdInt(levelId: LevelId) -> Int {
    if(levelId == LevelId.ARUBA) {
        return 0
    }
    if(levelId == LevelId.BEACH) {
        return 1
    }
    if(levelId == LevelId.TRIP) {
        return 2
    }
    if(levelId == LevelId.OCEAN) {
        return 3
    }
    if(levelId == LevelId.UTREG) {
        return 4
    }
    return 0
}

func saveScoreAtWhichToSaveGameState(score: Int) {
    let defaults = UserDefaults()
    let levelId = State.levelId
    defaults.set(score, forKey: String(levelId.hashValue) + "scoreAtWhichToSaveGameStateKey")
}

func getScoreAtWhichToSaveGameState() -> Int {
    let defaults = UserDefaults()
    let levelId = State.levelId
    return defaults.integer(forKey: String(levelId.hashValue) + "scoreAtWhichToSaveGameStateKey")
}

func saveBackgrounds(backgrounds : [SKSpriteNode]) {
    
    var counter = 1
    let defaults = UserDefaults()
    
    for x in backgrounds {
        defaults.set(x.position.x, forKey: String(State.levelId.hashValue) + backgroundsKey + String(counter))
        counter += 1
    }
}

func getBackgrounds(backgrounds : [SKSpriteNode]) {
    
    var counter = 1
    let defaults = UserDefaults()
    
    for x in backgrounds {
        x.position.x = CGFloat(defaults.float(forKey: String(State.levelId.hashValue) + backgroundsKey + String(counter)))
        counter += 1
    }
}

func saveMisty(object : Misty, level : LevelId) {

    let defaults = UserDefaults()
    let levelId = String(level.hashValue)
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

func getMisty(object : inout Misty, level : LevelId) {
    let defaults = UserDefaults()
    let levelId = String(level.hashValue)
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

func saveBirds(graphics : Graphics) {
    let levelId = String(State.levelId.hashValue)
    var birdId = 0
    for bird in graphics.birds {
        saveObject(object: bird, prefix: levelId + birdKey + String(birdId))
        birdId += 1
    }
    saveNumBirds()
}

func saveJellyFish(graphics : Graphics) {
    var jellyId = 0
    for jellyFish in graphics.jellyfishes {
        saveObject(object: jellyFish, prefix: jellyFishKey + String(jellyId))
        jellyId += 1
    }
    saveNumJellyFish()
}

func getJellyFish(jelly: inout JellyFish, jellyId : Int) {
    getJellyFish(object: &jelly, prefix: jellyFishKey + String(jellyId))
}

func getBird(bird : inout Bird, birdId : Int) {
    let levelId = String(State.levelId.hashValue)
    getBird(object: &bird, prefix: levelId + birdKey + String(birdId))
}

func getNumBirds() -> Int {
    let defaults = UserDefaults()
    let levelId = String(State.levelId.hashValue)
    return defaults.integer(forKey: levelId + "numBirds")
}

func saveNumBirds() {
    let defaults = UserDefaults()
    let levelId = String(State.levelId.hashValue)
    defaults.set(numBirds, forKey: levelId + "numBirds")
}

func saveNumJellyFish() {
    let defaults = UserDefaults()
    let levelId = String(State.levelId.hashValue)
    defaults.set(numJellyFish, forKey: levelId + "numJellyFish")
}

func getNumJellyFish() -> Int {
    let defaults = UserDefaults()
    let levelId = String(State.levelId.hashValue)
    return defaults.integer(forKey: levelId + "numJellyFish")
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

func getBird(object : inout Bird, prefix : String) {
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

func getJellyFish(object : inout JellyFish, prefix : String) {
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

func getBlowfish(object : inout BlowFish) {
    let defaults = UserDefaults()
    object.zPos = CGFloat(defaults.float(forKey: blowFishKey + "z_pos"))
    object.velX = CGFloat(defaults.float(forKey: blowFishKey + "vel_x"))
    object.velY = CGFloat(defaults.float(forKey: blowFishKey + "vel_y"))
    object.playSound = defaults.bool(forKey: blowFishKey + "play_sound")
    object.frameCounter = defaults.integer(forKey: blowFishKey + "bird_counter")
    object.frameCounterHit = defaults.integer(forKey: blowFishKey + "bird_counter_hit")
    object.imageId = defaults.integer(forKey: blowFishKey + "bird_id")
    object.imageIdHit = defaults.integer(forKey: blowFishKey + "bird_id_hit")
    object.width = CGFloat(defaults.float(forKey: blowFishKey + "width"))
    object.height = CGFloat(defaults.float(forKey: blowFishKey + "height"))
    object.hit = defaults.bool(forKey: blowFishKey + "hit")
    object.appeared = defaults.bool(forKey: blowFishKey + "appeared")
    object.posX = CGFloat(defaults.float(forKey: blowFishKey + "pos_x"))
    object.posY = CGFloat(defaults.float(forKey: blowFishKey + "pos_y"))
    
    object.setPosition(position: CGPoint(x: object.posX, y: object.posY))
    
    object.bubbles.bubcounter = defaults.integer(forKey: blowFishKey + "bubbles.bubcounter")
    object.bubbles.isMuted = defaults.bool(forKey: blowFishKey + "bubbles.is_muted")
}

func getBrownie(object : inout Brownie, level : LevelId) {
    let defaults = UserDefaults()
    let levelId = String(level.hashValue)
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

func saveFrito(object : Frito) {
    saveObject(object: object, prefix: String(State.levelId.hashValue) + fritoKey)
}

func saveBrownie(object : Brownie) {
    saveObject(object: object, prefix: String(State.levelId.hashValue) + brownieKey)
}

func getFrito(object : inout Frito, level : LevelId) {
    let defaults = UserDefaults()
    let levelId = String(level.hashValue)
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
