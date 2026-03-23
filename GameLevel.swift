//
//  GameLevel.swift
//  SoloMission
//
//  Created by Derek Harrison on 29/09/2023.
//

import Foundation
import SpriteKit

class GameLevel {

    var player = Player()
    
    var level_id : Int = 0
    
    var muted = false
    var playing = false
    var highScore = 0
    var birds = [Bird]()
    var jellyfishes = [JellyFish]()
    var cheesy_bites = [Snack]()
    var cucumbers = [Snack]()
    var paprikas = [Snack]()
    var beggin_strips = [Snack]()
    var broccolis = [Snack]()
    var continue_button = GameObject()
    var restart_button = GameObject()
    var flag = Flag()
    var width_background : CGFloat = 0
    var black_background_bot = SKSpriteNode(imageNamed: BACKGROUND_OPAQUE_STR)
    var black_background_top = SKSpriteNode(imageNamed: BACKGROUND_OPAQUE_STR)
    var backgrounds = [SKSpriteNode]()
    
    var frito = Frito()
    var brownie = Brownie()
    var misty = Misty()
    var fish1 = Fish()
    var fish2 = Fish()
    var fish3 = Fish()
    var fish4 = Fish()
    var fish5 = Fish()
    var fish6 = Fish()
    var blow_fish = BlowFish()
    
    var background_speed: CGFloat = 0
    
    var currentGameState = gameState.preGame
    var playing_state = playingState.restarted
    var num_backgrounds = 10
    
    var is_already_unlocked = false
    var sun_popup_frame_counter = 0
    var flag_popup_frame_counter = 0
    var flag_counter = 1
    var play_sun_pop_up = true
    var play_flag_pop_up = true
    var start_thread = true
    var start_save = true

    var move_counter = 0
    var is_up = true

    var r_o = CGPoint(x: 0, y: 0)
    
    var play_misty_guard = Int.random(in: 10..<40) + 20
    var flag_freq = FLAG_FREQUENCY
    var flag_num = 1
    var num_lives = NUM_LIVES
    var my_counter = 1
    var my_switch = false
    
    var hit_bird = false
    
    var scene = SKScene()

    func didMove(scene: SKScene, id : Int) {
        
        num_birds = 2
        self.scene = scene
        
        add_player()
        
        init_common(scene: scene, id: id)
    }
    
    func didMove_ocean(scene: SKScene, id : Int) {
        
        num_jellyfish = 2
        self.scene = scene
                
        add_player_ocean()
        
        init_common(scene: scene, id: id)
        
        init_fish(width: scene.size.width, height: scene.size.height)
    }
    
    func update(scene : SKScene) {

        //Update score text
        scoreLabel.text = String(gameScore)
        
        if level_id != LEVEL_ID_5 {
            sun_pop_up()
        }
        
        flag_pop_up()
                
        if self.currentGameState == gameState.inGame {
            move_counter += 1
        }
        
        update_num_birds()
        
        if self.currentGameState == gameState.inGame {
            
            update_player()
            
            update_birds()
        
            update_snacks()
            
            pop_frito()
            
            pop_brownie()
            
            pop_misty()
            
            update_backgrounds(scene : scene, backgrounds : backgrounds, vel_x : -background_speed)
        }
    }
    
    func update_ocean(scene : SKScene) {

        //Update score text
        scoreLabel.text = String(gameScore)
        
        if self.currentGameState == gameState.inGame {
            move_counter += 1
        }
        
        update_num_jelly()
        
        flag_pop_up()
        
        if self.currentGameState == gameState.inGame {
            
            update_player_ocean()
            
            update_jellyfish()
            
            update_fish()
            
            update_blow_fish()
            
            update_snacks()
            
            pop_frito_ocean()
            
            pop_brownie_ocean()
            
            pop_misty_ocean()
            
            update_backgrounds(scene : scene, backgrounds : backgrounds, vel_x : -background_speed)
        }
    }
    
    func game_over() {
        if level_id == LEVEL_ID_1 {
            runGameOver(high_score_id: HIGH_SCORE_ID_1)
        }
        if level_id == LEVEL_ID_2 {
            runGameOver(high_score_id: HIGH_SCORE_ID_2)
        }
        if level_id == LEVEL_ID_3 {
            runGameOver(high_score_id: HIGH_SCORE_ID_3)
        }
        if level_id == LEVEL_ID_4 {
            runGameOver(high_score_id: HIGH_SCORE_ID_4)
        }
        if level_id == LEVEL_ID_5 {
            runGameOver(high_score_id: HIGH_SCORE_ID_5)
        }
    }
    
    func save_backgrounds() {
        
        var counter = 1
        let defaults = UserDefaults()
        
        for x in backgrounds {
            defaults.set(x.position.x, forKey: String(level_id) + BACKGROUNDS_STR + String(counter))
            counter += 1
        }
    }
    
    func get_backgrounds() {
        
        var counter = 1
        let defaults = UserDefaults()
        
        for x in backgrounds {
            x.position.x = CGFloat(defaults.float(forKey: String(level_id) + BACKGROUNDS_STR + String(counter)))
            counter += 1
        }
    }
    
    func save_state() {
        saveObject(object: player, prefix: String(level_id) + PLAYER_STR)
        saveObject(object : brownie, prefix : String(level_id) + BROWNIE_STR)
        saveObject(object : frito, prefix : String(level_id) + FRITO_STR)
        saveMisty(object : misty, levelId : String(level_id))
        saveSnacks(snacks: cheesy_bites, prefix: String(level_id) + CHEESY_STR)
        saveSnacks(snacks: paprikas, prefix: String(level_id) + PAPRIKA_STR)
        saveSnacks(snacks: cucumbers, prefix: String(level_id) + CUCUMBER_STR)
        saveSnacks(snacks: beggin_strips, prefix: String(level_id) + BEGGIN_STR)
        saveSnacks(snacks: broccolis, prefix: String(level_id) + BROCCOLI_STR)
        saveObject(object: fish1, prefix: String(level_id) + FISH_STR_1)
        saveObject(object: fish2, prefix: String(level_id) + FISH_STR_2)
        saveObject(object: fish3, prefix: String(level_id) + FISH_STR_3)
        saveObject(object: fish4, prefix: String(level_id) + FISH_STR_4)
        saveObject(object: fish5, prefix: String(level_id) + FISH_STR_5)
        saveObject(object: fish6, prefix: String(level_id) + FISH_STR_6)
        saveObject(object: blow_fish, prefix: String(level_id) + BLOWFISH_STR)
        save_backgrounds()
        save_other()
    }
    
    func get_state() {
        getPlayer(object: &player, levelId: String(level_id))
        getBrownie(object: &brownie, levelId: String(level_id))
        getFrito(object : &frito, levelId : String(level_id))
        getMisty(object: &misty, levelId: String(level_id))
        getSnacks(snacks: &cheesy_bites, prefix: String(level_id) + CHEESY_STR)
        getSnacks(snacks: &paprikas, prefix: String(level_id) + PAPRIKA_STR)
        getSnacks(snacks: &cucumbers, prefix: String(level_id) + CUCUMBER_STR)
        getSnacks(snacks: &beggin_strips, prefix: String(level_id) + BEGGIN_STR)
        getSnacks(snacks: &broccolis, prefix: String(level_id) + BROCCOLI_STR)
        getFish(object: &fish1, prefix: String(level_id) + FISH_STR_1)
        getFish(object: &fish2, prefix: String(level_id) + FISH_STR_2)
        getFish(object: &fish3, prefix: String(level_id) + FISH_STR_3)
        getFish(object: &fish4, prefix: String(level_id) + FISH_STR_4)
        getFish(object: &fish5, prefix: String(level_id) + FISH_STR_5)
        getFish(object: &fish6, prefix: String(level_id) + FISH_STR_6)
        getBlowfish(object: &blow_fish, levelId: String(level_id))
        get_backgrounds()
        get_other()
    }
    
    func save_other() {
        let defaults = UserDefaults()
        defaults.set(gameScore, forKey: String(level_id) + SCORE_ID)
        defaults.set(play_misty_guard, forKey: String(level_id) + MISTY_GUARD)
        defaults.set(flag_num, forKey: String(level_id) + FLAG_NUM)
        defaults.set(num_lives, forKey: String(level_id) + NUM_LIVES_STR)
    }
    
    func get_other() {
        
        let defaults = UserDefaults()
        gameScore = defaults.integer(forKey: String(level_id) + SCORE_ID)
        play_misty_guard = defaults.integer(forKey: String(level_id) + MISTY_GUARD)
        flag_num = defaults.integer(forKey: String(level_id) + FLAG_NUM)
        num_lives = defaults.integer(forKey: String(level_id) + NUM_LIVES_STR)
        if num_lives > 0 {
            for j in 0..<num_lives {
                let life_image = SKSpriteNode(imageNamed: HEART_IMAGE_STR)
                life_image.setScale(1)
                life_image.size = CGSize(width: scene.size.width / 28, height: scene.size.height / 28)
                let size_loc = CGSize(width: scene.size.width / 28, height: scene.size.height / 28)
                life_image.position = CGPoint(x: scene.size.width / 2 + CGFloat(j) * size_loc.width + 5, y: CGFloat(scene.size.height * 0.75) - size_loc.height)
                life_image.zPosition = z_pos_lives
                life_image.removeFromParent()
                scene.addChild(life_image)
            }
        }
        else {
            num_lives = 0
        }
    }
    
    func update_snacks() {
        //Update positions of snacks and detect eating snacks
        update_snack(cucumbers : cheesy_bites, background_speed : background_speed)

        //Update positions of cucumbers and detect eating cucumber
        update_snack(cucumbers : cucumbers, background_speed : background_speed)
        
        //Update positions of paprikas and detect eating paprika
        update_snack(cucumbers : paprikas, background_speed : background_speed)
        
        //Update positions of broccolis and detect eating broccoli
        update_snack(cucumbers : broccolis, background_speed : background_speed)
        
        //Update positions of beggin strips and detect eating beggin strip
        if gameScore >= points_at_which_beggin_strips_appear {
            update_snack(cucumbers : beggin_strips, background_speed : background_speed)
        }
    }
    
    func init_fish(width : CGFloat, height : CGFloat) {
        fish1.addImage(image: FISH_IMAGE_1)
        fish1.addImage(image: FISH_IMAGE_2)
        fish1.setHeight(height : height)
        fish1.setWidth(width : width)
        fish1.setSize(size: CGSize(width : width / 7.5, height : height / 15))
        fish1.setPosition(position: CGPoint(x: -1000, y: 0))
        fish1.setZPosition(zPos: min_z_pos_fishes)
        fish1.addImagesToScene(scene: scene)
        
        fish2.addImage(image: FISH_IMAGE_2A)
        fish2.addImage(image: FISH_IMAGE_2B)
        fish2.setHeight(height : height)
        fish2.setWidth(width : width)
        fish2.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        fish2.setPosition(position: CGPoint(x: -1000, y: 0))
        fish2.setZPosition(zPos: min_z_pos_fishes + 1)
        fish2.addImagesToScene(scene: scene)
        
        fish3.addImage(image: FISH_IMAGE_3A)
        fish3.addImage(image: FISH_IMAGE_3B)
        fish3.setHeight(height : height)
        fish3.setWidth(width : width)
        fish3.setSize(size: CGSize(width : width / 7.5, height : height / 15))
        fish3.setPosition(position: CGPoint(x: -1000, y: 0))
        fish3.setZPosition(zPos: min_z_pos_fishes + 2)
        fish3.addImagesToScene(scene: scene)
        
        fish4.addImage(image: FISH_IMAGE_4A)
        fish4.addImage(image: FISH_IMAGE_4B)
        fish4.setHeight(height : height)
        fish4.setWidth(width : width)
        fish4.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        fish4.setPosition(position: CGPoint(x: -1000, y: 0))
        fish4.setZPosition(zPos: min_z_pos_fishes + 3)
        fish4.addImagesToScene(scene: scene)
        
        fish5.addImage(image: FISH_IMAGE_5A)
        fish5.addImage(image: FISH_IMAGE_5B)
        fish5.setHeight(height : height)
        fish5.setWidth(width : width)
        fish5.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        fish5.setPosition(position: CGPoint(x: 10 * width, y: 0))
        fish5.setZPosition(zPos: min_z_pos_fishes + 4)
        fish5.addImagesToScene(scene: scene)
        
        fish6.addImage(image: FISH_IMAGE_6A)
        fish6.addImage(image: FISH_IMAGE_6B)
        fish6.setHeight(height : height)
        fish6.setWidth(width : width)
        fish6.setSize(size: CGSize(width : width / 7.5, height : height / 15))
        fish6.setPosition(position: CGPoint(x: 10 * width, y: 0))
        fish6.setZPosition(zPos: min_z_pos_fishes + 5)
        fish6.addImagesToScene(scene: scene)
        
        blow_fish.addImage(image: BLOW_FISH_IMAGE_1)
        blow_fish.addImage(image: BLOW_FISH_IMAGE_2)
        blow_fish.addImageHit(image: BLOW_FISH_IMAGE_3)
        blow_fish.addImageHit(image: BLOW_FISH_IMAGE_4)
        blow_fish.setHeight(height : height)
        blow_fish.setWidth(width : width)
        blow_fish.setSize(size: CGSize(width : width * 3 / 15, height : height / 7.5))
        blow_fish.setSizeHit(size: CGSize(width : width * 3 / 7.5, height : height * 2 / 7.5))
        blow_fish.setPosition(position: CGPoint(x: -1000, y: 0))
        blow_fish.setZPosition(zPos: min_z_pos_fishes + 6)
        blow_fish.setVelocity(velX: -1.5 * background_speed, velY: 0)
        blow_fish.addImagesToScene(scene: scene)
    }
    
    func init_images_frito(images : [String], height : CGFloat, width : CGFloat) {
        for image in images {
            frito.addImage(image : image)
        }
        frito.setHeight(height : height)
        frito.setWidth(width : width)
        frito.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        frito.setVelocity(velX: 2 * background_speed, velY: -2 * background_speed)
        frito.setZPosition(zPos: z_pos_chars)
        frito.setPosition(position: CGPoint(x : 10 * width, y : height * 0.75 + frito.images[0].size.height / 2))
        frito.addImagesToScene(scene: scene)
    }
    
    func init_images_brownie(images : [String], height : CGFloat, width : CGFloat) {
        for image in images {
            brownie.addImage(image : image)
        }
        brownie.setHeight(height : height)
        brownie.setWidth(width : width)
        brownie.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        brownie.setVelocity(velX: -2 * background_speed, velY: -2 * background_speed)
        brownie.setZPosition(zPos: z_pos_chars + 1)
        brownie.setPosition(position: CGPoint(x : -width, y : height * 0.75 + brownie.images[0].size.height / 2))
        
        brownie.addImagesToScene(scene: scene)
    }
    
    func init_images_misty(images : [String], height : CGFloat, width : CGFloat) {
        for image in images {
            misty.addImage(image : image)
        }
        misty.setHeight(height : height)
        misty.setWidth(width : width)
        misty.setSize(size: CGSize(width : width / 7.5, height : height / 7.5))
        misty.set_vel_misty(vx: 0, vy: -background_speed)
        misty.setZPosition(zPos: z_pos_chars + 2)
        misty.setPosition(position: CGPoint(x : width / 2, y : height * 0.75 + misty.images[0].size.height / 2))
        
        misty.addImagesToScene(scene: scene)
    }
    
    func init_common(scene : SKScene, id : Int) {
        
        level_id = id
        play_sun_pop_up = true
        sun_popup_frame_counter = 0
        gameScore = 0
        bound_tracker = 1
        background_speed = scene.size.width / 400
        
        let width = scene.size.width
        let height = scene.size.height
        
        add_snacks(scene : scene)
        
        continue_button.addImage(image: CONTINUE_BUTTON_NOT_PRESSED)
        continue_button.addImageHit(image: CONTINUE_BUTTON_PRESSED)
        continue_button.setPosition(position: CGPoint(x: scene.size.width / 2 - continue_button.getSize().width / 2, y: scene.size.height / 2))
        continue_button.setZPosition(zPos: -1)
        continue_button.setSize(size: CGSize(width: scene.size.width / 5, height: scene.size.height / 10))
        continue_button.addImagesToScene(scene: scene)
        
        restart_button.addImage(image: RESTART_BUTTON_NOT_PRESSED)
        restart_button.addImageHit(image: RESTART_BUTTON_PRESSED)
        restart_button.setPosition(position: CGPoint(x: scene.size.width / 2 + restart_button.getSize().width / 2, y: scene.size.height / 2))
        restart_button.setZPosition(zPos: -1)
        restart_button.setSize(size: CGSize(width: scene.size.width / 5, height: scene.size.height / 10))
        restart_button.addImagesToScene(scene: scene)
        
        if level_id != LEVEL_ID_5 {
            flag.addImage(image: FLAG_ARUBA_STR)
            flag.setZPosition(zPos: -1)
            flag.setSize(size: CGSize(width: scene.size.width / 5, height: scene.size.height / 5))
            flag.setPosition(position: CGPoint(x: scene.size.width - flag.getSize().width, y: scene.size.height * 0.75 - flag.getSize().height))
            flag.addImagesToScene(scene: scene)
        }
        else {
            flag.addImage(image: FLAG_NETHERLANDS_STR)
            flag.setZPosition(zPos: -1)
            flag.setSize(size: CGSize(width: scene.size.width / 5, height: scene.size.height / 5))
            flag.setPosition(position: CGPoint(x: scene.size.width - flag.getSize().width, y: scene.size.height * 0.75 - flag.getSize().height))
            flag.addImagesToScene(scene: scene)
        }
        
        pause_button.setScale(1)
        pause_button.size = CGSize(width: width / 28, height: height / 28)
        pause_button.position = CGPoint(x: width - width / 12, y: height / 2 + height * 1.9 / 10)
        pause_button.zPosition = z_pos_pause
        pause_button.removeFromParent()
        scene.addChild(pause_button)
        
        play_button.setScale(1)
        play_button.size = CGSize(width: width / 28, height: height / 28)
        play_button.position = pause_button.position
        play_button.zPosition = -1
        play_button.removeFromParent()
        scene.addChild(play_button)
        
        sun_popup_spr.setScale(1)
        sun_popup_spr.size = CGSize(width: width / 7, height: height / 7)
        sun_popup_spr.position = CGPoint(x: width / 2 + sun_popup_spr.size.width / 5, y: height / 2 + height / 4 - sun_popup_spr.size.height / 2 - width / 11)
        sun_popup_spr.zPosition = -1
        sun_popup_spr.removeFromParent()
        scene.addChild(sun_popup_spr)
        
        scoreLabel.text = "0"
        scoreLabel.fontSize = 100
        scoreLabel.fontColor = SKColor.gray
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.position = CGPoint(x: scene.size.width / 12, y: scene.size.height / 2 + scene.size.height * 1.8 / 10)
        
        scoreLabel.zPosition = z_pos_pause
        scoreLabel.removeFromParent()
        scene.addChild(scoreLabel)
        
        
        let defaults = UserDefaults()
        if level_id == LEVEL_ID_1 {
            highScore = defaults.integer(forKey: HIGH_SCORE_ID_1)
        }
        if level_id == LEVEL_ID_2 {
            highScore = defaults.integer(forKey: HIGH_SCORE_ID_2)
        }
        if level_id == LEVEL_ID_3 {
            highScore = defaults.integer(forKey: HIGH_SCORE_ID_3)
        }
        if level_id == LEVEL_ID_4 {
            highScore = defaults.integer(forKey: HIGH_SCORE_ID_4)
        }
        if level_id == LEVEL_ID_5 {
            highScore = defaults.integer(forKey: HIGH_SCORE_ID_5)
        }

        is_already_unlocked = highScore >= unlock_level_points
        muted = defaults.bool(forKey: String(level_id) + GAME_MUTED)
        playing = defaults.bool(forKey: String(level_id) + PLAYING)
        
        mute_bubbles(bubbles : player.bubbles, mute : muted)
        mute_bubbles(bubbles : frito.bubbles, mute : muted)
        mute_bubbles(bubbles : brownie.bubbles, mute : muted)
        mute_bubbles(bubbles : misty.bubbles, mute : muted)
        
        if !playing {
            add_lives()
        }
        
        startGame()
    }
    
    func add_lives() {
        
        if num_lives > 0 {
            for j in 0..<num_lives {
                let life_image = SKSpriteNode(imageNamed: HEART_IMAGE_STR)
                life_image.setScale(1)
                life_image.size = CGSize(width: scene.size.width / 28, height: scene.size.height / 28)
                let size_loc = CGSize(width: scene.size.width / 28, height: scene.size.height / 28)
                life_image.position = CGPoint(x: scene.size.width / 2 + CGFloat(j) * size_loc.width + 5, y: CGFloat(scene.size.height * 0.75) - size_loc.height)
                life_image.zPosition = z_pos_lives
                life_image.removeFromParent()
                scene.addChild(life_image)
            }
        }
    }
    
    func mute_bubbles(bubbles : Bubbles, mute : Bool) {
        bubbles.isMuted = mute
    }
    
    func update_player_ocean() {
        player.update()
        
        player.bubbles.popBubbles(pos : player.getPosition(), scene : scene, sound : [bubbles_sounds])
    }
    
    func init_background(scene : SKScene, num_backgrounds : Int, string1 : String) {
        black_background_top.size = CGSize(width: scene.size.width, height: scene.size.height / 4)
        black_background_top.position = CGPoint(x: scene.size.width / 2, y: scene.size.height * 0.75 + scene.size.height / 8)
        black_background_top.zPosition = z_pos_black
        black_background_bot.size = CGSize(width: scene.size.width, height: scene.size.height / 4)
        black_background_bot.position = CGPoint(x: scene.size.width / 2, y: scene.size.height * 0.25 - scene.size.height / 8)
        black_background_bot.zPosition = z_pos_black
        black_background_top.removeFromParent()
        black_background_bot.removeFromParent()
        scene.addChild(black_background_top)
        scene.addChild(black_background_bot)
        
        self.num_backgrounds = num_backgrounds
        
        for i in 0..<num_backgrounds {
            let string2 = String(i + 1)
            let image_name = string1 + string2
            let background = SKSpriteNode(imageNamed: image_name)
            
            background.size = CGSize(width: scene.size.width, height: scene.size.height / 2)
                        
            width_background = background.size.width
            
            background.anchorPoint = CGPoint(x: 0, y: 0.5)
            background.position = CGPoint(x: width_background * CGFloat(i) - CGFloat(background_overlap * i), y: scene.size.height / 2)
            
            background.zPosition = 0
            backgrounds.append(background)
            background.removeFromParent()
            scene.addChild(background)
        }
    }
    
    func init_snack(bite : String, points : Int, num_cheesy_bites : Int, cheesy_bites : inout [Snack], scene : SKScene) {
        for _ in 0..<num_cheesy_bites {
            
            let size = CGSize(width: scene.size.width / 14, height: scene.size.height / 14)
            let bite_image = bite
            
            let cheesy_bite = Snack(bite: bite_image, points: points_cheesy_bite, size: size, z_pos: z_pos_snacks)
            
            cheesy_bite.addImagesToScene(scene: scene)

            let factor = 1.0 - (cheesy_bite.getSize().height) / (scene.size.height / 2)
            let pos_x = getRandomNumber() * scene.size.width * 2
            let pos_y = getRandomNumber() * scene.size.height / 2 * factor + scene.size.height / 4 + 1/2 * (1 - factor) * scene.size.height / 2
            
            cheesy_bite.setPosition(position: CGPoint(x: pos_x, y: pos_y))
            cheesy_bite.setVelocity(velX: -background_speed, velY: 0)
            cheesy_bite.points_snack = points
            cheesy_bites.append(cheesy_bite)
        }
    }
    
    func update_backgrounds(scene : SKScene, backgrounds : [SKSpriteNode], vel_x : CGFloat) {

        let n = backgrounds.count
        
        for j in 0..<n {
            backgrounds[j].position.x += vel_x
            if(j > 0 && backgrounds[j - 1].position.x < 0) {
                backgrounds[j].position.x = backgrounds[j - 1].position.x + backgrounds[j - 1].size.width - 10
            }
            if(j == n - 1 && backgrounds[j].position.x < 0) {
                backgrounds[0].position.x = backgrounds[j].position.x + backgrounds[j].size.width - 10
            }
        }
    }
    
    func add_bubbles(bubbles_char : Bubbles, bubble_image : String) {
        bubbles_char.addBubble(imageId: bubble_image)
        bubbles_char.addBubble(imageId: bubble_image)
        bubbles_char.addBubble(imageId: bubble_image)
    }
    
    func add_birds(images : [String]) {
        for j in 0..<num_birds {
            
            var bird_images = [String]()
            
            for x in images {
                bird_images.append(x)
            }
            
            let z_pos = CGFloat(j) + min_z_pos_birds
            let size = CGSize(width: scene.size.width / 10, height: scene.size.height / 10)
            
            let bird = Bird(birds: bird_images, size: size, zPos: z_pos)
            
            bird.addImagesToScene(scene : scene)

            birds.append(bird)
            
        }
    }
    
    func add_jellyfish(images : [String]) {
        for j in 0..<num_jellyfish {
            
            var jelly_images = [String]()
            
            for x in images {
                jelly_images.append(x)
            }
            
            let z_pos = CGFloat(j) + min_z_pos_jelly_fish
            let size = CGSize(width: scene.size.width / 10, height: scene.size.height / 10)
            
            let jelly = JellyFish(jelly_fish: jelly_images, size: size, z_pos: z_pos)
            jelly.addImagesToScene(scene : scene)

            jellyfishes.append(jelly)
        }
    }
    
    func add_player() {
        let size = CGSize(width: scene.size.width / 5, height: scene.size.height / 7.5)
        
        var player_images : [String] = [String]()
        
        let defaults = UserDefaults()
        let player_id = defaults.integer(forKey: "player_id")
        
        if(player_id == 0) {
            player_images.append(PLAYER_IMAGE_1)
            player_images.append(PLAYER_IMAGE_2)
            player = Player(images: player_images, size: size, z_pos: z_pos_player)
            player.addImageHit(image: PLAYER_IMAGE_HIT)
        }
        if(player_id == 1) {
            player_images.append(PLAYER_TUTTI_IMAGE_1)
            player_images.append(PLAYER_TUTTI_IMAGE_2)
            player = Player(images: player_images, size: size, z_pos: z_pos_player)
            player.addImageHit(image: PLAYER_TUTTI_IMAGE_HIT)
        }

        player.addImagesToScene(scene : scene)
        player.setVelocity(velX: 0, velY: 0)
        player.setPosition(position: CGPoint(x : scene.size.width / 5, y : scene.size.height / 2))
        player.setHeight(height : scene.size.height)
        player.setWidth(width : scene.size.width)
    }
    
    func add_player_ocean() {
        let size = CGSize(width: scene.size.width / 5, height: scene.size.height / 7.5)
        
        var player_images : [String] = [String]()
        
        let defaults = UserDefaults()
        let player_id = defaults.integer(forKey: "player_id")
        
        if player_id == 0 {
            player_images.append(PLAYER_SNORKEL)
            player = Player(images: player_images, size: size, z_pos: z_pos_player)
            player.addImageHit(image: PLAYER_SNORKEL_HIT)
        }
        
        if player_id == 1 {
            player_images.append(PLAYER_TUTTI_SNORKEL)
            player = Player(images: player_images, size: size, z_pos: z_pos_player)
            player.addImageHit(image: PLAYER_TUTTI_SNORKEL_HIT)
        }
        

        player.setVelocity(velX: 0, velY: 0)
        player.setPosition(position: CGPoint(x : scene.size.width / 5, y : scene.size.height / 2))
        player.setHeight(height : scene.size.height)
        player.setWidth(width : scene.size.width)
        player.bubbles.addBubble(imageId: BUBBLE_IMAGE_STR)
        player.bubbles.addBubble(imageId: BUBBLE_IMAGE_STR)
        player.bubbles.addBubble(imageId: BUBBLE_IMAGE_STR)
        
        for x in player.bubbles.bubblez {
            x.removeFromParent()
            scene.addChild(x)
        }
        player.addImagesToScene(scene : scene)
    }
    
    func add_snacks(scene : SKScene) {
        init_snack(bite : CHEESY_BITE_IMAGE, points: points_cheesy_bite, num_cheesy_bites : num_cheesy_bites, cheesy_bites : &cheesy_bites, scene : scene)
        
        init_snack(bite : PAPRIKA_IMAGE, points: points_paprika, num_cheesy_bites : num_paprikas, cheesy_bites : &paprikas, scene : scene)
        
        init_snack(bite : BROCCOLI_IMAGE, points: points_broccoli, num_cheesy_bites : num_broccolis, cheesy_bites : &broccolis, scene : scene)
        
        init_snack(bite : CUCUMBER_IMAGE, points: points_cucumber, num_cheesy_bites : num_cucumbers, cheesy_bites : &cucumbers, scene : scene)
        
        init_snack(bite : BEGGIN_IMAGE, points: points_beggin_strip, num_cheesy_bites : num_beggin_strips, cheesy_bites : &beggin_strips, scene : scene)
        
        // Move beggin strips out of bounds
        for strip in beggin_strips {
            strip.setPosition(position: CGPoint(x : -1000, y : 0))
        }
    }
    
    func update_snack(cucumbers : [Snack], background_speed : CGFloat) {
        for cucumber in cucumbers {
            cucumber.update(scene: scene)
            cucumber.setVelocity(velX: -background_speed, velY: 0)
            
            if objectCollidedWithPlayer(bird : cucumber, player : player, den : 2.5) {
                cucumber.setPosition(position: CGPoint(x: -scene.size.width * 10, y: 0))
                
                if muted == false {
                    playSound(scene: scene, sound: [eat_sound1])
                }
                
                gameScore += cucumber.points_snack
            }
        }
    }
    
    func pop_frito() {
        if frito.appeared  {

            if muted == false && frito.playSound {
                playSound(scene: scene, sound: [frito_sound_appearing])
                frito.playSound = false
            }
        }

        frito.updatePosition(scene: scene)
        
        if objectCollidedWithPlayer(bird : frito, player : player, den : 2.5) {
            frito.hit = true

            if muted == false && frito.playHitSound {
                playSound(scene: scene, sound: [frito_sound])
                frito.playHitSound = false
            }
        }
    }
    
    func pop_brownie() {
        if brownie.appeared  {

            if muted == false && brownie.playSound {
                playSound(scene: scene, sound: [brownie_sound_appearing])
                brownie.playSound = false
            }
        }

        brownie.update(scene: scene)
        
        if objectCollidedWithPlayer(bird : brownie, player : player, den : 2.5) {
            brownie.hit = true

            if muted == false && brownie.playHitSound {
                playSound(scene: scene, sound: [brownie_sound])
                brownie.playHitSound = false
            }
        }
    }
    
    func pop_misty() {
        misty.pop_misty(height : misty.height, speed : background_speed)
        
        if objectCollidedWithPlayer(bird : misty, player : player, den : 2.5) {
            misty.hit = true
            
            if muted == false && misty.playSound {
                misty.playSound = false
                playSound(scene: scene, sound: [misty_sound])
            }
        }
        
        if gameScore >= play_misty_guard {
            play_misty_guard += 200 + Int.random(in: 10..<40)
            misty.play_misty(bool: Bool.random())
            if misty.top {
                misty.setPosition(position: CGPoint(x : misty.width / 2, y : misty.height * 0.75 + misty.images[0].size.height / 2))
                misty.set_vel_misty(vx: misty.velX, vy: -background_speed)
            }
            else {
                misty.setPosition(position: CGPoint(x : misty.width / 2, y : misty.height * 0.25 - misty.images[0].size.height / 2))
                misty.set_vel_misty(vx: misty.velX, vy: background_speed)
            }
            
            misty.playSound = true
            misty.hit = false
            
            if muted == false {
                playSound(scene: scene, sound: [misty_sound_appearing])
            }
        }
    }
    
    func pop_frito_ocean() {
        if frito.appeared  {

            if muted == false && frito.playSound {
                playSound(scene: scene, sound: [frito_sound_appearing])
                frito.playSound = false
            }
            
            frito.bubbles.popBubbles(pos: frito.getPosition(), scene : scene, sound : [bubbles_sounds])
        }
        else {
            frito.bubbles.setPosition(pos: CGPoint(x: -1000, y: 0))
        }

        frito.updatePosition(scene: scene)
        
        if objectCollidedWithPlayer(bird : frito, player : player, den : 2.5) {
            frito.hit = true

            if muted == false && frito.playHitSound {
                playSound(scene: scene, sound: [frito_sound])
                frito.playHitSound = false
            }
        }
    }
    
    func pop_brownie_ocean() {
        if brownie.appeared  {

            if muted == false && brownie.playSound {
                playSound(scene: scene, sound: [brownie_sound_appearing])
                brownie.playSound = false
            }
            
            brownie.bubbles.popBubbles(pos: brownie.getPosition(), scene : scene, sound : [bubbles_sounds])

        }
        else {
            brownie.bubbles.setPosition(pos: CGPoint(x: -1000, y: 0))
        }

        brownie.update(scene: scene)
        
        if objectCollidedWithPlayer(bird : brownie, player : player, den : 2.5) {
            brownie.hit = true

            if muted == false && brownie.playHitSound {
                playSound(scene: scene, sound: [brownie_sound])
                brownie.playHitSound = false
            }
        }
    }
    
    func pop_misty_ocean() {
        misty.pop_misty(height : misty.height, speed : background_speed)
        
        if objectCollidedWithPlayer(bird : misty, player : player, den : 2.5) {
            misty.hit = true
            
            if muted == false && misty.playSound {
                playSound(scene: scene, sound: [misty_sound])
                misty.playSound = false
            }
        }
        
        if gameScore >= play_misty_guard {
            play_misty_guard += 20 + Int.random(in: 10..<40)
            misty.play_misty(bool: Bool.random())
            if misty.top {
                misty.setPosition(position: CGPoint(x : misty.width / 2, y : misty.height * 0.75 + misty.images[0].size.height / 2))
                misty.set_vel_misty(vx: misty.velX, vy: -background_speed)
            }
            else {
                misty.setPosition(position: CGPoint(x : misty.width / 2, y : misty.height * 0.25 - misty.images[0].size.height / 2))
                misty.set_vel_misty(vx: misty.velX, vy: background_speed)
            }
            
            misty.playSound = true
            misty.hit = false
            
            if muted == false {
                playSound(scene: scene, sound: [misty_sound_appearing])
                misty.bubbles.popBubbles(pos: misty.getPosition(), scene : scene, sound : [bubbles_sounds])
            }
        }
        else {
            misty.bubbles.setPosition(pos: CGPoint(x: -1000, y: 0))
        }
    }
    
    func update_jellyfish() {
        let defaults = UserDefaults()
        
        for jelly in jellyfishes {
            jelly.update(scene : scene, backgroundSpeed: -background_speed)
            
            if objectCollidedWithPlayer(bird : jelly, player : player, den : 3.5) {

                if muted == false {
                    playSound(scene: scene, sound: [endSound])
                }
                
                self.currentGameState = gameState.afterGame
                
                if !hit_bird {
                    hit_bird = true
                    num_lives = num_lives - 1
                }
                
                defaults.set(num_lives, forKey: String(level_id) + NUM_LIVES_STR)
                
                if(num_lives < 0) {
                    num_lives = 0
                    defaults.set(num_lives, forKey: String(level_id) + NUM_LIVES_STR)
                    game_over()
                }
                else if(num_lives >= 0) {
                    show_restart_continue()
                }
            }
        }
    }
    
    func update_fish() {
        fish1.update(scene : scene, backgroundSpeed : -background_speed)
        fish2.updatePosition(scene : scene, backgroundSpeed : -background_speed)
        fish3.updatePosition(scene : scene, backgroundSpeed : -background_speed)
        fish4.updatePosition(scene : scene, backgroundSpeed : -background_speed)
        fish5.updatePositionGoingInOppositeDirection(scene : scene, backgroundSpeed : background_speed)
        fish6.updatePositionGoingInOppositeDirection(scene : scene, backgroundSpeed : background_speed)
    }
    
    func update_blow_fish() {
        blow_fish.update(scene: scene, at: 5)
        
        if objectCollidedWithPlayer(bird : blow_fish, player : player, den : 3.5) {

            if muted == false && blow_fish.playHitSound {
                playSound(scene: scene, sound: [blowfish_sound])
            }
            blow_fish.playSound = false
            blow_fish.playHitSound = false
            blow_fish.hit = true
        }
    }
    
    func update_player() {
        player.update()
        
        player.cape1.position.x = player.posX - player.cape1.size.width / 2
        player.cape1.position.y = player.posY
        player.cape2.position.x = player.posX - player.cape2.size.width / 2
        player.cape2.position.y = player.posY
        
        if my_counter < 5 {
            if my_switch {
                player.cape1.zPosition = 2
                player.cape2.zPosition = -1
            }
            else {
                player.cape1.zPosition = -1
                player.cape2.zPosition = 2
            }
            my_counter += 1
        }
        else {
            my_switch = !my_switch
            my_counter = 1
        }
    }
    
    func update_birds() {
        let defaults = UserDefaults()
        
        for bird in birds {
            bird.update(scene : scene, backgroundSpeed: -background_speed)

            if objectCollidedWithPlayer(bird : bird, player : player, den : 3.5) {

                if muted == false {
                    playSound(scene: scene, sound: [endSound])
                }
                
                self.currentGameState = gameState.afterGame
                
                if !hit_bird {
                    hit_bird = true
                    num_lives = num_lives - 1
                }
                
                defaults.set(num_lives, forKey: String(level_id) + NUM_LIVES_STR)
                
                if(num_lives < 0) {
                    num_lives = 0
                    defaults.set(num_lives, forKey: String(level_id) + NUM_LIVES_STR)
                    game_over()
                }
                else if(num_lives >= 0) {
                    if(level_id == LEVEL_ID_1) {
                        show_restart_continue()
                    }
                    if(level_id == LEVEL_ID_2) {
                        show_restart_continue()
                    }
                    if(level_id == LEVEL_ID_3) {
                        show_restart_continue()
                    }
                    if(level_id == LEVEL_ID_5) {
                        show_restart_continue()
                    }
                }
            }
        }
    }
    
    func sun_pop_up() {
        if gameScore >=  LEVEL_UNLOCK_GUARD && !is_already_unlocked && sun_popup_frame_counter <= num_frames_sun_popup {
            sun_popup_frame_counter += 1
            if muted == false && play_sun_pop_up {
                playSound(scene: scene, sound: [sun_popup_sound])
                play_sun_pop_up = false
            }
            
            sun_popup_spr.zPosition = z_pos_sun
        }
        else {
            //Reset sun popup zposition
            sun_popup_spr.zPosition = -1
        }
    }
    
    func flag_pop_up() {
        
        if gameScore == 0 {
            if start_save {
                start_save = false
                
                // Spawn thread to save state
                class MyThread: Thread {
                    var base : GameLevel
                    init(base : GameLevel) {
                        self.base = base
                    }
                    override func main() {
                        base.save_state()
                    }
                }

                let thread = MyThread(base : self)
                thread.start()
            }
        }
        
        if gameScore >= flag_num * flag_freq && flag_popup_frame_counter <= num_frames_flag_popup && num_lives > 0 {
            
            flag_popup_frame_counter += 1
            
            if muted == false && play_flag_pop_up {
                playSound(scene: scene, sound: [sun_popup_sound])
                play_flag_pop_up = false
            }
            
            flag.setZPosition(zPos: z_pos_flag)
            
            if start_thread {
                start_thread = false
                
                // Spawn thread to save state
                class MyThread: Thread {
                    var base : GameLevel
                    init(base : GameLevel) {
                        self.base = base
                    }
                    override func main() {
                        base.save_state()
                    }
                }

                let thread = MyThread(base : self)
                thread.start()
            }
        }
        else if flag_popup_frame_counter > num_frames_flag_popup {
            
            flag_num += 1
            flag_popup_frame_counter = 0
            play_flag_pop_up = true
            start_thread = true
            
            //Reset flag popup zposition
            flag.setZPosition(zPos: -1)
        }
    }
    
    func update_num_birds() {
        if gameScore >= bound_tracker * num_points_when_birds_appear && birds.count < tot_num_birds {
            
            let image_names = self.birds[0].imageNames
            let size = self.birds[0].images[0].size
            
            let bird = Bird(birds: image_names, size: size, zPos: CGFloat(birds.count) + min_z_pos_birds)
            bird.addImagesToScene(scene : scene)
            
            birds.append(bird)
            
            bound_tracker += 1
        }
    }
    
    func update_num_jelly() {
        if gameScore >= bound_tracker * num_points_when_birds_appear && jellyfishes.count < tot_num_birds {
            
            let image_names = self.jellyfishes[0].imageNames
            let size = self.jellyfishes[0].images[0].size
            
            let jelly = JellyFish(jelly_fish: image_names, size: size, z_pos: CGFloat(jellyfishes.count) + min_z_pos_birds)
            jelly.addImagesToScene(scene : scene)
            
            jellyfishes.append(jelly)
            
            bound_tracker += 1
        }
    }
    
    func run_continue(high_score_id: String, GameLevel : SKScene) {
        let defaults = UserDefaults()
        if gameScore > highScore {
            defaults.set(gameScore, forKey: high_score_id)
        }
        
        player.setZPosition(zPos: -1)
        player.setZPositionHit(zPos: z_pos_player)
        var start = true
        startScene(scene : scene, start : &start, GameLevel : GameLevel)
    }
    
    func run_restart(high_score_id: String) {
        runGameOver(high_score_id: high_score_id)
    }
    
    func runGameOver(high_score_id : String) {
        let defaults = UserDefaults()
        
        if gameScore > highScore {
            defaults.set(gameScore, forKey: high_score_id)
        }
        
        player.setZPosition(zPos: -1)
        player.setZPositionHit(zPos: z_pos_player)
        
        playing = false
        defaults.set(playing, forKey: String(level_id) + PLAYING)
        
        let changeSceneAction = SKAction.run(changeScene)
        let waitToChangeScene = SKAction.wait(forDuration: 1)
        let changeSceneSequence = SKAction.sequence([waitToChangeScene, changeSceneAction])
        scene.run(changeSceneSequence)
    }
    
    func show_restart_continue() {
        
        player.setZPosition(zPos: -1)
        player.setZPositionHit(zPos: z_pos_player)
        continue_button.images[0].zPosition = z_pos_continue
        restart_button.images[0].zPosition = z_pos_restart
        
        end_game()
    }
    
    func changeScene() {
        
        let sceneToMoveTo = MainMenuScene(size: scene.size)
        sceneToMoveTo.scaleMode = scene.scaleMode
        let myTransition = SKTransition.fade(withDuration: 0.5)
        scene.view!.presentScene(sceneToMoveTo, transition: myTransition)
    }
    
    func startGame() {
        currentGameState = gameState.inGame
        pause_button.zPosition = z_pos_pause
        play_button.zPosition = -1
    }
    
    func pause_game() {
        currentGameState = gameState.gamePaused
        pause_button.zPosition = -1
        play_button.zPosition = z_pos_pause
    }
    
    func end_game() {
        currentGameState = gameState.afterGame
    }
    
    func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if currentGameState == gameState.preGame {
            startGame()
            player.setVelocity(velX: 0, velY: 0)
        }
        else if currentGameState == gameState.inGame {
            
            for touch: AnyObject in touches {
                let pointOfTouch = touch.location(in: scene)
                
                // Position defines the boundaries of the pause / play button
                let position = CGPoint(x: scene.size.width - 2 * scene.size.width / 12, y: scene.size.height / 2 + scene.size.height * 1.5 / 10)
                
                let touch_in_game_area = pointOfTouch.x > 0 && pointOfTouch.x < scene.size.width && pointOfTouch.y > scene.size.height / 4 && pointOfTouch.y < 0.75 * scene.size.height
                
                if pointOfTouch.x > position.x && pointOfTouch.y > position.y {
                    pause_game()
                }
                else if touch_in_game_area {
                    player.setPosition(position: pointOfTouch)
                    player.setVelocity(velX: 0, velY: 0)
                }
            }
        }
        else if currentGameState == gameState.gamePaused {
            
            for touch: AnyObject in touches {
                let pointOfTouch = touch.location(in: scene)
                
                let position = CGPoint(x: scene.size.width - 2 * scene.size.width / 12, y: scene.size.height / 2 + scene.size.height * 1.5 / 20)
                
                if pointOfTouch.x > position.x  && pointOfTouch.y > position.y {
                    startGame()
                }
            }
        }
        else if currentGameState == gameState.afterGame {
            for touch: AnyObject in touches {
                let point = touch.location(in: scene)
                
                let p1 = continue_button.images[0].position
                let w1 = continue_button.images[0].size.width / 2
                let h1 = continue_button.images[0].size.height / 2
                let p2 = restart_button.images[0].position
                let w2 = restart_button.images[0].size.width / 2
                let h2 = restart_button.images[0].size.height / 2
                if point.x > p1.x - w1 && point.x < p1.x + w1 && point.y > p1.y - h1 && point.y < p1.y + h1 {
                    continue_button.imagesHit[0].zPosition = z_pos_continue
                    continue_button.images[0].zPosition = -1
                    let defaults = UserDefaults()
                    playing = true
                    defaults.set(playing, forKey: String(level_id) + PLAYING)
                    
                    if level_id == LEVEL_ID_1 {
                        run_continue(high_score_id: HIGH_SCORE_ID_1, GameLevel: GameLevel1(size: scene.size))
                    }
                    if level_id == LEVEL_ID_2 {
                        run_continue(high_score_id: HIGH_SCORE_ID_2, GameLevel: GameLevel2(size: scene.size))
                    }
                    if level_id == LEVEL_ID_3 {
                        run_continue(high_score_id: HIGH_SCORE_ID_3, GameLevel: GameLevel3(size: scene.size))
                    }
                    if level_id == LEVEL_ID_4 {
                        run_continue(high_score_id: HIGH_SCORE_ID_4, GameLevel: GameLevel4(size: scene.size))
                    }
                    if level_id == LEVEL_ID_5 {
                        run_continue(high_score_id: HIGH_SCORE_ID_5, GameLevel: GameLevel5(size: scene.size))
                    }
                }
                
                if point.x > p2.x - w2 && point.x < p2.x + w2 && point.y > p2.y - h2 && point.y < p2.y + h2 {
                    restart_button.imagesHit[0].zPosition = z_pos_restart
                    restart_button.images[0].zPosition = -1
                    let defaults = UserDefaults()
                    playing = false
                    defaults.set(playing, forKey: String(level_id) + PLAYING)
                    if level_id == LEVEL_ID_1 {
                        run_restart(high_score_id: HIGH_SCORE_ID_1)
                    }
                    if level_id == LEVEL_ID_2 {
                        run_restart(high_score_id: HIGH_SCORE_ID_2)
                    }
                    if level_id == LEVEL_ID_3 {
                        run_restart(high_score_id: HIGH_SCORE_ID_3)
                    }
                    if level_id == LEVEL_ID_4 {
                        run_restart(high_score_id: HIGH_SCORE_ID_4)
                    }
                    if level_id == LEVEL_ID_5 {
                        run_restart(high_score_id: HIGH_SCORE_ID_5)
                    }
                }
            }
        }
    }
    
    func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.r_o = player.images[0].position
        
        if currentGameState == gameState.preGame {
            startGame()
            player.setVelocity(velX: 0, velY: 0)
        }
        else if currentGameState == gameState.inGame && move_counter > 10 {
            
            move_counter = 11
            
            for touch: AnyObject in touches {
                let pointOfTouch = touch.location(in: scene)
                
                let position = CGPoint(x: scene.size.width - 3 * scene.size.width / 12, y: scene.size.height / 2 + scene.size.height * 1.5 / 10)
                
                let touch_in_game_area = pointOfTouch.x > 0 && pointOfTouch.x < scene.size.width && pointOfTouch.y > scene.size.height / 4 && pointOfTouch.y < 0.75 * scene.size.height
                
                if pointOfTouch.x > position.x  && pointOfTouch.y > position.y {
                    // Do nothing
                }
                else if touch_in_game_area {
                    player.setPosition(position: pointOfTouch)
                    
                    var vel_x = (self.player.images[0].position.x - self.r_o.x) / 2
                    var vel_y = (self.player.images[0].position.y - self.r_o.y) / 2
                    
                    let min_speed2 = 3.1
                    let speed2 = vel_x * vel_x + vel_y * vel_y

                    if speed2 < CGFloat(min_speed2) {
                        vel_x = 0
                        vel_y = 0
                    }
                    
                    player.setVelocity(velX: vel_x, velY: vel_y)
                }
            }
        }
    }
}
