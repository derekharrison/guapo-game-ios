//
//  Graphics.swift
//  SoloMission
//
//  Created by Derek Harrison on 16/08/2026.
//

import Foundation
import SpriteKit

class Graphics {
    var player = Player()
    
    var highScore = 0
    var birds = [Bird]()
    var jellyfishes = [JellyFish]()
    var cheesyBites = [Snack]()
    var cucumbers = [Snack]()
    var paprikas = [Snack]()
    var begginStrips = [Snack]()
    var broccolis = [Snack]()
    var continueButton = GameObject()
    var restartButton = GameObject()
    var flag = Flag()
    var widthBackground : CGFloat = 0
    var blackBackgroundBottom = SKSpriteNode(imageNamed: coverBackgroundPrefix)
    var blackBackgroundTop = SKSpriteNode(imageNamed: coverBackgroundPrefix)
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
    var blowFish = BlowFish()
    
    var numBackgrounds = 10
    
    var backgroundSpeed: CGFloat = 0
}
