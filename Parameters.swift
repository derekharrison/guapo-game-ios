//
//  Parameters.swift
//  SoloMission
//
//  Created by Derek Harrison on 25/09/2023.
//

import Foundation
import SpriteKit

var numBirds = 1
var numJellyFish = 1
var gameScore = 0
var muted = false
var boundTracker = 1

class Parameters {
    static let totalNumberOfVillains = 12
    static let numberOfCheesyBites = 5
    static let tuttiButtonNotPressed = "tutti_button_not_pressed_cropped"
    static let tuttiButtonPressed = "tutti_button_pressed_cropped"
    static let guapoButtonNotPressed = "guapo_button_not_pressed_cropped"
    static let guapoButtonPressed = "guapo_button_pressed_cropped"
    static let playerMenuButtonNotPressed = "player_menu_button_not_pressed_bitmap_cropped"
    static let playerMenuButtonPressed = "player_menu_button_pressed_bitmap_cropped"
    static let startMenuButtonNotPressed = "main_menu_button_not_pressed_bitmap_cropped"
    static let startMenuButtonPressed = "main_menu_button_pressed_bitmap_cropped"
    static let levelMenuButtonNotPressed = "level_menu_button_not_pressed_bitmap_cropped"
    static let levelMenuButtonPressed = "level_menu_button_pressed_bitmap_cropped"
    static let continueButtonNotPressed = "continue_button_not_pressed_bitmap_cropped_1"
    static let continueButtonPressed = "continue_button_pressed_bitmap_cropped_1"
}

let totalNumberOfCucumbers = 1
let totalNumberOfPaprika = 1
let totalNumberOfBroccoli = 1
let totalNumberOfBegginStrips = 1

let pointsForCheesyBite = 1
let pointsForCucumber = 1
let pointsForPaprika = 1
let pointsForBroccoli = 3
let pointsBegginStrip = 5

let numberOfFramesBird = 8
let numberOfFramesJellyFish = 15
let numberOfFramesSunPopup = 180
let numberOfFramesChange = 5
let numberOfFramesFlagPopup = 180
let numFramesMisty = 60

let numberOfPointsWhenVillainsAppear = 35
let numberOfScreenLengthsForDisplay = 10
let numberOfPointsWhenBegginStripAppears = 50

let verticalBubbleVelocity = 5.0

let pauseButtonNode = SKSpriteNode(imageNamed: "pause_button_bitmap_cropped")
let playButtonNode = SKSpriteNode(imageNamed: "play_button_bitmap_cropped")
let sunPopupNode = SKSpriteNode(imageNamed: "sun_popup_bitmap_cropped")
let scoreLabelNode = SKLabelNode(fontNamed: "Courier-Bold")

let numberOfPixelsOfOverlapBetweenBackgroundImages = 10

let zPosPlayer : CGFloat = CGFloat(Parameters.totalNumberOfVillains) * 5
let zPosSnacks : CGFloat = CGFloat(Parameters.totalNumberOfVillains) * 2
let zPosCharacters : CGFloat = CGFloat(Parameters.totalNumberOfVillains) * 1
let zPosPauseButton : CGFloat = CGFloat(Parameters.totalNumberOfVillains) * 5 + 1
let zPosContinueButton : CGFloat = CGFloat(Parameters.totalNumberOfVillains) * 5 + 2
let zPosStartButton : CGFloat = CGFloat(Parameters.totalNumberOfVillains) * 5 + 2
let zPosLives : CGFloat = CGFloat(Parameters.totalNumberOfVillains) * 5 + 2
let zPosFlagPopup : CGFloat = CGFloat(Parameters.totalNumberOfVillains) * 5 - 1
let zPosSunPopup : CGFloat = CGFloat(Parameters.totalNumberOfVillains) * 5 - 1
let zPosBlackCoverImages : CGFloat = CGFloat(Parameters.totalNumberOfVillains) * 10

let minZPosJellyFish = CGFloat(Parameters.totalNumberOfVillains) * 3
let minZPosFishes = CGFloat(Parameters.totalNumberOfVillains) * 1
let minZPosVillains = minZPosJellyFish

let bulletSound = SKAction.playSoundFileNamed("sound_effect.wav", waitForCompletion: true)
let endSound = SKAction.playSoundFileNamed("tutti_0.wav", waitForCompletion: true)
let tuttiEatingKnaagstokSound = SKAction.playSoundFileNamed("tutti_eating_knaagstok.wav", waitForCompletion: true)
let tuttiEatingTostiSound = SKAction.playSoundFileNamed("tutti_eating_tosti.wav", waitForCompletion: true)
let tuttiEatingPatheSound = SKAction.playSoundFileNamed("tutti_eating_pathe.wav", waitForCompletion: true)
let fritoSound = SKAction.playSoundFileNamed("tutti_3.wav", waitForCompletion: true)
let brownieSound = SKAction.playSoundFileNamed("tutti_6.wav", waitForCompletion: true)
let mistySound = SKAction.playSoundFileNamed("tutti_1.wav", waitForCompletion: true)
let fritoAppearingSound = SKAction.playSoundFileNamed("cat_sound1.wav", waitForCompletion: true)
let brownieAppearingSound = SKAction.playSoundFileNamed("tutti_5.wav", waitForCompletion: true)
let mistyAppearingSound = SKAction.playSoundFileNamed("misty_sounds.wav", waitForCompletion: true)
let sunPopupSound = SKAction.playSoundFileNamed("sun_popup_sound.wav", waitForCompletion: true)
let bubblesSound = SKAction.playSoundFileNamed("bubble_sounds.wav", waitForCompletion: false)
let blowFishSound = SKAction.playSoundFileNamed("tutti_4.wav", waitForCompletion: false)

let fritoImage = "frito_bitmap_cropped"
let fritoHitImage = "frito_bitmap_rotated_cropped"
let fritoSnorkelImage = "frito_snorkel_bitmap_cropped"
let fritoSNorkelHitImage = "frito_snorkel_hit_bitmap_rotated_cropped"

let brownieImage = "brownie1_bitmap_cropped"
let brownieHitImage = "brownie2_bitmap_cropped"
let brownieSnorkelImage = "brownie_snorkel_bitmap_cropped"
let brownieSnorkerHitImage = "brownie_snorkel_bitmap_hit_cropped"

let mistyImage = "misty_bitmap_cropped"
let mistyHitImage = "misty_hit_bitmap_cropped"
let mistyRotatedImage = "misty_bitmap_cropped_rotated"
let mistyRotatedHitImage = "misty_hit_bitmap_cropped_rotated"
let mistySnorkelImage = "misty_withsnorkel_bitmap_cropped"
let mistySnorkelHitImage = "misty_withsnorkel_hit_bitmap_cropped"
let mistySnorkelRotatedImage = "misty_withsnorkel_bitmap_cropped_rotated"
let mistySnorkelRotatedHitImage = "misty_withsnorkel_hit_bitmap_cropped_rotated"

let guapoImage1 = "guapo_main_image_bitmap_cropped"
let guapoImage2 = "guapo_main_image_bitmap_cropped"
let guapoHitImage = "guapo_main_image_hit_bitmap_cropped"
let guapoSnorkelImage = "guapo_snorkel_bitmap_cropped"
let guapoSnorkelHitImage = "guapo_snorkel_hit_bitmap_cropped"

let tuttiImage1 = "tutti_bitmap_no_cape_cropped"
let tuttiImage2 = "tutti_bitmap_no_cape_cropped"
let tuttiHitImage = "tutti_bitmap_hit_no_cape_cropped"
let tuttiSnorkelImage = "tutti_snorkel1_cropped"
let tuttiSnorkelHitImage = "tutti_snorkel1_hit_cropped"

let capeImage1 = "cape1_bitmap_cropped1"
let capeImage2 = "cape2_bitmap_cropped1"

let waraWaraImage1 = "warawara1_bitmap_custom_mod_cropped"
let waraWaraImage2 = "warawara2_bitmap_custom_mod_cropped"
let waraWaraImage3 = "warawara3_bitmap_custom_mod_cropped"

let seagullImage1 = "seagull1_bitmap_cropped_new"
let seagullImage2 = "seagull2_bitmap_cropped_new"
let seagullImage3 = "seagull3_bitmap_cropped_new"

let jellyFishImage1 = "jelly_fish_bitmap_cropped1"
let jellyFishImage2 = "jelly_fish_bitmap_cropped2"
let jellyFishImage3 = "jelly_fish_bitmap_cropped3"

let fishImage1a = "fish5_bitmap_cropped"
let fishImage1b = "fish6_bitmap_cropped"

let fishImage2a = "fish3_bitmap_cropped"
let fishImage2b = "fish4_bitmap_cropped"

let fishImage3a = "fish8_bitmap_cropped"
let fishImage3b = "fish9_bitmap_cropped"

let fishImage4a = "fish14b_bitmap_cropped_resized_purple"
let fishImage4b = "fish14bb_bitmap_cropped_resized_purple"

let fishImage5a = "fish12_bitmap_cropped"
let fishImage5b = "fish12b_bitmap_cropped"

let fishImage6a = "yellowfish_facingright_raw"
let fishImage6b = "yellowfish_facingright_raw2"

let blowFishImage1 = "fish10_bitmap_cropped"
let blowFishImage2 = "fish10b_bitmap_cropped"
let blowFishImage3 = "fish11_bitmap_cropped"
let blowFishImage4 = "fish11b_bitmap_cropped"

let cheesyBiteImage = "cheesy_bite_resized"
let paprikaImage = "paprika_bitmap_cropped"
let broccoliImage = "broccoli_bitmap_cropped"
let cucumberImage = "cucumber_bitmap_cropped"
let begginStripImage = "beggin_strip_cropped"

let backgroundArubaLevelPrefix = "background_guapo_game_nr"
let backgroundBeachLevelPrefix = "beach_background_slide"
let backgroundTripLevelPrefix = "background_guapo_game_level3_"
let backgroundOceanLevelPrefix = "background_guapogame_underwaterlevel_"
let backgroundUtrechtLevelPrefix = "background_tuttigame_nr"
let coverBackgroundPrefix = "black_background"

let numberOfBackgroundImagesArubaLevel = 10
let numberOfBackgroundImagesBeachLevel = 14
let numberOfBackgroundImagesTripLevel = 11
let numberOfBackgroundImagesOceanLevel = 5
let numberOfBackgroundImagesUtrechtLevel = 18

let bubbleImage = "bubble_bitmap_cropped"

let highScoreId1 = "HighScoreLevel1Saved"
let highScoreId2 = "HighScoreLevel2Saved"
let highScoreId3 = "HighScoreLevel3Saved"
let highScoreId4 = "HighScoreLevel4Saved"
let highScoreId5 = "HighScoreLevel5Saved"

let levelId1 = 1
let levelId2 = 2
let levelId3 = 3
let levelId4 = 4
let levelId5 = 5

let gameIsMuted = "gameMuted"
let gameIsPlaying = "playing"
let usedFont = "AvenirNext-Bold"
let labelFont = "Helvetica"

let backgroundStartScreenImage = "background_guapo_game_startscreen2"

let levelsStr = "Levels"
let highScoreStr = "High Score"
let soundOnStr = "volume_on"
let soundOffStr = "volume_off"

let arubaLevelButtonNotPressed = "aruba_level_button_not_pressed_bitmap_cropped_1"
let arubaLevelButtonPressed = "aruba_level_button_pressed_bitmap_cropped_1"
let beachLevelButtonNotPressed = "beach_level_button_not_pressed_bitmap_cropped_1"
let beachLevelButtonPressed = "beach_level_button_pressed_bitmap_cropped_1"
let tripLevelButtonNotPressed = "trip_level_button_not_pressed_bitmap_cropped_1"
let tripLevelButtonPressed = "trip_level_button_pressed_bitmap_cropped_1"
let oceanLevelButtonNotPressed = "ocean_level_button_not_pressed_bitmap_cropped_1"
let oceanLevelButtonPressed = "ocean_level_button_pressed_bitmap_cropped_1"
let utrechtLevelButtonNotPressed = "utreg_level_button_not_pressed_bitmap_cropped_1"
let utrechtLevelButtonPressed = "utreg_level_button_pressed_bitmap_cropped_1"

let guapoPlayerImage = "guapo_head_bitmap_cropped 1"
let tuttiPlayerImage = "tutti_main_image_cropped_resized"

let beachLevelButtonGrayed = "beach_level_button_grey_1"
let tripLevelButtonGrayed = "trip_level_button_grey_1"
let oceanLevelButtonGrayed = "ocean_level_button_grey_1"
let utrechtLevelButtonGrayed = "utreg_level_button_grey_1"

let numberOfPointsRequiredToUnlockLevel = 100
let numberOfPointsBetweenCheckpoints = 100

let backgroundsKey = "backgrounds"
let playerKey = "LEVEL_1_player"
let brownieKey = "LEVEL_1_brownie"
let fritoKey = "LEVEL_1_frito"
let mistyKey = "LEVEL_1_misty"
let cheesyBiteKey = "LEVEL_1_CHEESY"
let paprikaKey = "LEVEL_1_PAPRIKA"
let cucumberKey = "LEVEL_1_CUCUMBERS"
let begginStripKey = "LEVEL_1_BEGGIN"
let broccoliKey = "LEVEL_1_BROCCOLIS"

let fishKey1 = "FISH_1"
let fishKey2 = "FISH_2"
let fishKey3 = "FISH_3"
let fishKey4 = "FISH_4"
let fishKey5 = "FISH_5"
let fishKey6 = "FISH_6"
let blowFishKey = "BLOWFISH"
let heartKey = "heart1_bitmap_cropped"
let scoreKey = "SCORE_ID"
let mistyGuardKey = "MISTY_GUARD"
let flagNumKey = "FLAG_NUM"
let numberOfLivesKey = "NUM_LIVES"
let numberOfLives = 3

let arubanFlag = "flag_aruba_bitmap_cropped"
let dutchFlag = "flag_netherlands_bitmap_cropped"

let continueButtonNotPressed = "continue_button_not_pressed_bitmap_cropped"
let continueButtonPressed = "continue_button_pressed_bitmap_cropped"
let restartButtonNotPressed = "restart_button_not_pressed_bitmap_cropped"
let restartButtonPressed = "restart_button_pressed_bitmap_cropped"

