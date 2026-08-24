//
//  Update.swift
//  SoloMission
//
//  Created by Derek Harrison on 16/08/2026.
//

import Foundation
import SpriteKit

class Update {
    var scene : SKScene
    var graphics: Graphics
    var playMisty = Int.random(in: 10..<40) + 20
    
    init(graphics: Graphics, scene: SKScene) {
        self.graphics = graphics
        self.scene = scene
    }
    
    func update() {
        updatePlayer()
        
        if(State.levelId != LevelId.OCEAN) {
            updateBirds()
            
            updateNumberOfBirds()
        }
        else {
            updateJellyFish()
            
            updateNumberOfJellyFish()
        }
        
        updateSnacks()
        
        popFrito()
        
        popBrownie()
        
        popMisty()
        
        updateBackgrounds(backgrounds : graphics.backgrounds, velX : -graphics.backgroundSpeed)
    }
    
    func updatePlayer() {
        graphics.player.update()
    }
    
    func updateNumberOfBirds() {
        if gameScore >= boundTracker * numberOfPointsWhenVillainsAppear && graphics.birds.count < Parameters.totalNumberOfVillains {
            
            let imageNames = self.graphics.birds[0].imageNames
            let size = self.graphics.birds[0].images[0].size
            
            let bird = Bird(birds: imageNames, size: size, zPos: CGFloat(graphics.birds.count) + minZPosVillains)
            bird.addImagesToScene(scene : scene)
            
            graphics.birds.append(bird)
            
            boundTracker += 1
        }
    }
    
    func updateNumberOfJellyFish() {
        if gameScore >= boundTracker * numberOfPointsWhenVillainsAppear && graphics.jellyfishes.count < Parameters.totalNumberOfVillains {
            
            let imageNames = self.graphics.jellyfishes[0].imageNames
            let size = self.graphics.jellyfishes[0].images[0].size
            
            let bird = JellyFish(jellyFish: imageNames, size: size, zPos: CGFloat(graphics.jellyfishes.count) + minZPosVillains)
            bird.addImagesToScene(scene : scene)
            
            graphics.jellyfishes.append(bird)
            
            boundTracker += 1
        }
    }
    
    func updateBackgrounds(backgrounds : [SKSpriteNode], velX : CGFloat) {

        let n = backgrounds.count
        
        for j in 0..<n {
            backgrounds[j].position.x += velX
            if(j > 0 && backgrounds[j - 1].position.x < 0) {
                backgrounds[j].position.x = backgrounds[j - 1].position.x + backgrounds[j - 1].size.width - 10
            }
            if(j == n - 1 && backgrounds[j].position.x < 0) {
                backgrounds[0].position.x = backgrounds[j].position.x + backgrounds[j].size.width - 10
            }
        }
    }
    
    func updateBirds() {
        for bird in graphics.birds {
            
            bird.update(scene : scene, backgroundSpeed : -graphics.backgroundSpeed)
            
            if objectCollidedWithPlayer(bird : bird, player : graphics.player, den : 3.5) {
                
                if muted == false {
                    playSound(scene: scene, sound: [endSound])
                }
                
                runGameOver()
            }
        }
    }
    
    func updateJellyFish() {
        for jellyFish in graphics.jellyfishes {
            
            jellyFish.update(scene : scene, backgroundSpeed : -graphics.backgroundSpeed)
            
            if objectCollidedWithPlayer(bird : jellyFish, player : graphics.player, den : 3.5) {
                
                if muted == false {
                    playSound(scene: scene, sound: [endSound])
                }
                
                runGameOver()
            }
        }
    }
    
    func updateSnacks() {
        //Update positions of snacks and detect eating snacks
        updateSnack(snacks : graphics.cheesyBites, backgroundSpeed : graphics.backgroundSpeed)

        //Update positions of cucumbers and detect eating cucumber
        updateSnack(snacks : graphics.cucumbers, backgroundSpeed : graphics.backgroundSpeed)
        
        //Update positions of paprikas and detect eating paprika
        updateSnack(snacks : graphics.paprikas, backgroundSpeed : graphics.backgroundSpeed)
        
        //Update positions of broccolis and detect eating broccoli
        updateSnack(snacks : graphics.broccolis, backgroundSpeed : graphics.backgroundSpeed)
        
        //Update positions of beggin strips and detect eating beggin strip
        if gameScore >= numberOfPointsWhenBegginStripAppears {
            updateSnack(snacks : graphics.begginStrips, backgroundSpeed : graphics.backgroundSpeed)
        }
    }
    
    func updateSnack(snacks : [Snack], backgroundSpeed : CGFloat) {
        for snack in snacks {
            snack.update(scene: scene)
            snack.setVelocity(velX: -backgroundSpeed, velY: 0)
            
            if objectCollidedWithPlayer(bird : snack, player : graphics.player, den : 2.5) {
                snack.setPosition(position: CGPoint(x: -scene.size.width * 10, y: 0))
                
                if muted == false {
                    playSound(scene: scene, sound: [tuttiEatingKnaagstokSound])
                }
                
                gameScore += snack.pointsForSnack
            }
        }
    }
    
    
    func popFrito() {
        if graphics.frito.appeared && muted == false && graphics.frito.playSound {
            playSound(scene: scene, sound: [fritoAppearingSound])
            graphics.frito.playSound = false
        }

        graphics.frito.updatePosition(scene: scene)
        
        if objectCollidedWithPlayer(bird : graphics.frito, player : graphics.player, den : 2.5) {
            graphics.frito.hit = true

            if muted == false && graphics.frito.playHitSound {
                playSound(scene: scene, sound: [fritoSound])
                graphics.frito.playHitSound = false
            }
        }
    }
    
    func popBrownie() {
        if graphics.brownie.appeared && muted == false && graphics.brownie.playSound {
            playSound(scene: scene, sound: [brownieAppearingSound])
            graphics.brownie.playSound = false
        }

        graphics.brownie.update(scene: scene)
        
        if objectCollidedWithPlayer(bird : graphics.brownie, player : graphics.player, den : 2.5) {
            graphics.brownie.hit = true

            if muted == false && graphics.brownie.playHitSound {
                playSound(scene: scene, sound: [brownieSound])
                graphics.brownie.playHitSound = false
            }
        }
    }
    
    func popMisty() {
        graphics.misty.popMisty(graphics.misty.height, graphics.backgroundSpeed)
        
        if objectCollidedWithPlayer(bird : graphics.misty, player : graphics.player, den : 2.5) {
            graphics.misty.hit = true
            
            if muted == false && graphics.misty.playSound {
                graphics.misty.playSound = false
                playSound(scene: scene, sound: [mistySound])
            }
        }
        
        if gameScore >= playMisty {
            playMisty += 200 + Int.random(in: 10..<40)
            playMistyFcn()
        }
    }
    
    func playMistyFcn() {
        graphics.misty.play(bool: Bool.random())
        if graphics.misty.top {
            graphics.misty.setPosition(position: CGPoint(x : graphics.misty.width / 2, y : graphics.misty.height * 0.75 + graphics.misty.images[0].size.height / 2))
            graphics.misty.setVelMisty(vx: graphics.misty.velX, vy: -graphics.backgroundSpeed)
        }
        else {
            graphics.misty.setPosition(position: CGPoint(x : graphics.misty.width / 2, y : graphics.misty.height * 0.25 - graphics.misty.images[0].size.height / 2))
            graphics.misty.setVelMisty(vx: graphics.misty.velX, vy: graphics.backgroundSpeed)
        }
        
        graphics.misty.playSound = true
        graphics.misty.hit = false
        
        if muted == false {
            playSound(scene: scene, sound: [mistyAppearingSound])
        }
    }
    
    func runGameOver() {
        graphics.player.setZPosition(zPos: -1)
        graphics.player.setZPositionHit(zPos: zPosPlayer)
      
        let changeSceneAction = SKAction.run(changeScene)
        let waitToChangeScene = SKAction.wait(forDuration: 1)
        let changeSceneSequence = SKAction.sequence([waitToChangeScene, changeSceneAction])
        scene.run(changeSceneSequence)
    }
    
    func changeScene() {
        let sceneToMoveTo = MainMenuScene(size: scene.size)
        sceneToMoveTo.scaleMode = scene.scaleMode
        let myTransition = SKTransition.fade(withDuration: 0.5)
        scene.view!.presentScene(sceneToMoveTo, transition: myTransition)
    }
}
