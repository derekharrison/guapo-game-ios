//
//  Storage.swift
//  SoloMission
//
//  Created by Derek Harrison on 16/08/2026.
//


//func saveState() {
//    saveObject(object: player, prefix: String(levelId) + playerKey)
//    saveObject(object : brownie, prefix : String(levelId) + brownieKey)
//    saveObject(object : frito, prefix : String(levelId) + fritoKey)
//    saveMisty(object : misty, levelId : String(levelId))
//    saveSnacks(snacks: cheesyBites, prefix: String(levelId) + cheesyBiteKey)
//    saveSnacks(snacks: paprikas, prefix: String(levelId) + paprikaKey)
//    saveSnacks(snacks: cucumbers, prefix: String(levelId) + cucumberKey)
//    saveSnacks(snacks: begginStrips, prefix: String(levelId) + begginStripKey)
//    saveSnacks(snacks: broccolis, prefix: String(levelId) + broccoliKey)
//    saveObject(object: fish1, prefix: String(levelId) + fishKey1)
//    saveObject(object: fish2, prefix: String(levelId) + fishKey2)
//    saveObject(object: fish3, prefix: String(levelId) + fishKey3)
//    saveObject(object: fish4, prefix: String(levelId) + fishKey4)
//    saveObject(object: fish5, prefix: String(levelId) + fishKey5)
//    saveObject(object: fish6, prefix: String(levelId) + fishKey6)
//    saveObject(object: blowFish, prefix: String(levelId) + blowFishKey)
//    saveBackgrounds()
//    saveOther()
//}
//
//func getState() {
//    getPlayer(object: &player, levelId: String(levelId))
//    getBrownie(object: &brownie, levelId: String(levelId))
//    getFrito(object : &frito, levelId : String(levelId))
//    getMisty(object: &misty, levelId: String(levelId))
//    getSnacks(snacks: &cheesyBites, prefix: String(levelId) + cheesyBiteKey)
//    getSnacks(snacks: &paprikas, prefix: String(levelId) + paprikaKey)
//    getSnacks(snacks: &cucumbers, prefix: String(levelId) + cucumberKey)
//    getSnacks(snacks: &begginStrips, prefix: String(levelId) + begginStripKey)
//    getSnacks(snacks: &broccolis, prefix: String(levelId) + broccoliKey)
//    getFish(object: &fish1, levelId: String(levelId), prefix : fishKey1)
//    getFish(object: &fish2, levelId: String(levelId), prefix : fishKey2)
//    getFish(object: &fish3, levelId: String(levelId), prefix : fishKey3)
//    getFish(object: &fish4, levelId: String(levelId), prefix : fishKey4)
//    getFish(object: &fish5, levelId: String(levelId), prefix : fishKey5)
//    getFish(object: &fish6, levelId: String(levelId), prefix : fishKey6)
//    getBlowfish(object: &blowFish, levelId: String(levelId))
//    getBackgrounds()
//    getOther()
//}
//
//func saveOther() {
//    let defaults = UserDefaults()
//    defaults.set(gameScore, forKey: String(levelId) + scoreKey)
//    defaults.set(playMisty, forKey: String(levelId) + mistyGuardKey)
//    defaults.set(flagNum, forKey: String(levelId) + flagNumKey)
//    defaults.set(numLives, forKey: String(levelId) + numberOfLivesKey)
//}


//func saveBackgrounds() {
//    
//    var counter = 1
//    let defaults = UserDefaults()
//    
//    for x in backgrounds {
//        defaults.set(x.position.x, forKey: String(levelId) + backgroundsKey + String(counter))
//        counter += 1
//    }
//}
//
//func getBackgrounds() {
//    
//    var counter = 1
//    let defaults = UserDefaults()
//    
//    for x in backgrounds {
//        x.position.x = CGFloat(defaults.float(forKey: String(levelId) + backgroundsKey + String(counter)))
//        counter += 1
//    }
//}
