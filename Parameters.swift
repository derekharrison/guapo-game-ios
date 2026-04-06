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

let MIN_Z_POS_JELLY_FISH = CGFloat(Parameters.totalNumberOfVillains) * 3
let MIN_Z_POS_FISHES = CGFloat(Parameters.totalNumberOfVillains) * 1
let MIN_Z_POS_BIRDS = MIN_Z_POS_JELLY_FISH

let BULLET_SOUND = SKAction.playSoundFileNamed("sound_effect.wav", waitForCompletion: true)
let END_SOUND = SKAction.playSoundFileNamed("tutti_0.wav", waitForCompletion: true)
let EAT_SOUND1 = SKAction.playSoundFileNamed("tutti_eating_knaagstok.wav", waitForCompletion: true)
let EAT_SOUND2 = SKAction.playSoundFileNamed("tutti_eating_tosti.wav", waitForCompletion: true)
let EAT_SOUND3 = SKAction.playSoundFileNamed("tutti_eating_pathe.wav", waitForCompletion: true)
let FRITO_SOUND = SKAction.playSoundFileNamed("tutti_3.wav", waitForCompletion: true)
let BROWNIE_SOUND = SKAction.playSoundFileNamed("tutti_6.wav", waitForCompletion: true)
let MISTY_SOUND = SKAction.playSoundFileNamed("tutti_1.wav", waitForCompletion: true)
let FRITO_SOUND_APPEARING = SKAction.playSoundFileNamed("cat_sound1.wav", waitForCompletion: true)
let BROWNIE_SOUND_APPEARING = SKAction.playSoundFileNamed("tutti_5.wav", waitForCompletion: true)
let MISTY_SOUND_APPEARING = SKAction.playSoundFileNamed("misty_sounds.wav", waitForCompletion: true)
let SUN_POPUP_SOUND = SKAction.playSoundFileNamed("sun_popup_sound.wav", waitForCompletion: true)
let BUBBLES_SOUNDS = SKAction.playSoundFileNamed("bubble_sounds.wav", waitForCompletion: false)
let BLOWFISH_SOUND = SKAction.playSoundFileNamed("tutti_4.wav", waitForCompletion: false)

let FRITO_IMAGE_1 = "frito_bitmap_cropped"
let FRITO_IMAGE_2 = "frito_bitmap_rotated_cropped"
let FRITO_OCEAN_1 = "frito_snorkel_bitmap_cropped"
let FRITO_OCEAN_2 = "frito_snorkel_hit_bitmap_rotated_cropped"

let BROWNIE_IMAGE_1 = "brownie1_bitmap_cropped"
let BROWNIE_IMAGE_2 = "brownie2_bitmap_cropped"
let BROWNIE_OCEAN_1 = "brownie_snorkel_bitmap_cropped"
let BROWNIE_OCEAN_2 = "brownie_snorkel_bitmap_hit_cropped"

let MISTY_IMAGE_1 = "misty_bitmap_cropped"
let MISTY_IMAGE_2 = "misty_hit_bitmap_cropped"
let MISTY_IMAGE_3 = "misty_bitmap_cropped_rotated"
let MISTY_IMAGE_4 = "misty_hit_bitmap_cropped_rotated"
let MISTY_OCEAN_1 = "misty_withsnorkel_bitmap_cropped"
let MISTY_OCEAN_2 = "misty_withsnorkel_hit_bitmap_cropped"
let MISTY_OCEAN_3 = "misty_withsnorkel_bitmap_cropped_rotated"
let MISTY_OCEAN_4 = "misty_withsnorkel_hit_bitmap_cropped_rotated"

let PLAYER_IMAGE_1 = "guapo_main_image_bitmap_cropped"
let PLAYER_IMAGE_2 = "guapo_main_image_bitmap_cropped"
let PLAYER_IMAGE_HIT = "guapo_main_image_hit_bitmap_cropped"
let PLAYER_SNORKEL = "guapo_snorkel_bitmap_cropped"
let PLAYER_SNORKEL_HIT = "guapo_snorkel_hit_bitmap_cropped"

let PLAYER_TUTTI_IMAGE_1 = "tutti_bitmap_no_cape_cropped"
let PLAYER_TUTTI_IMAGE_2 = "tutti_bitmap_no_cape_cropped"
let PLAYER_TUTTI_IMAGE_HIT = "tutti_bitmap_hit_no_cape_cropped"
let PLAYER_TUTTI_SNORKEL = "tutti_snorkel1_cropped"
let PLAYER_TUTTI_SNORKEL_HIT = "tutti_snorkel1_hit_cropped"

let CAPE_IMAGE1 = "cape1_bitmap_cropped1"
let CAPE_IMAGE2 = "cape2_bitmap_cropped1"

let BIRD_IMAGE_WARA_1 = "warawara1_bitmap_custom_mod_cropped"
let BIRD_IMAGE_WARA_2 = "warawara2_bitmap_custom_mod_cropped"
let BIRD_IMAGE_WARA_3 = "warawara3_bitmap_custom_mod_cropped"

let BIRD_IMAGE_SEAGULL_1 = "seagull1_bitmap_cropped_new"
let BIRD_IMAGE_SEAGULL_2 = "seagull2_bitmap_cropped_new"
let BIRD_IMAGE_SEAGULL_3 = "seagull3_bitmap_cropped_new"

let JELLY_IMAGE_1 = "jelly_fish_bitmap_cropped1"
let JELLY_IMAGE_2 = "jelly_fish_bitmap_cropped2"
let JELLY_IMAGE_3 = "jelly_fish_bitmap_cropped3"

let FISH_IMAGE_1 = "fish5_bitmap_cropped"
let FISH_IMAGE_2 = "fish6_bitmap_cropped"

let FISH_IMAGE_2A = "fish3_bitmap_cropped"
let FISH_IMAGE_2B = "fish4_bitmap_cropped"

let FISH_IMAGE_3A = "fish8_bitmap_cropped"
let FISH_IMAGE_3B = "fish9_bitmap_cropped"

let FISH_IMAGE_4A = "fish14b_bitmap_cropped_resized_purple"
let FISH_IMAGE_4B = "fish14bb_bitmap_cropped_resized_purple"

let FISH_IMAGE_5A = "fish12_bitmap_cropped"
let FISH_IMAGE_5B = "fish12b_bitmap_cropped"

let FISH_IMAGE_6A = "yellowfish_facingright_raw"
let FISH_IMAGE_6B = "yellowfish_facingright_raw2"

let BLOW_FISH_IMAGE_1 = "fish10_bitmap_cropped"
let BLOW_FISH_IMAGE_2 = "fish10b_bitmap_cropped"
let BLOW_FISH_IMAGE_3 = "fish11_bitmap_cropped"
let BLOW_FISH_IMAGE_4 = "fish11b_bitmap_cropped"

let CHEESY_BITE_IMAGE = "cheesy_bite_resized"
let PAPRIKA_IMAGE = "paprika_bitmap_cropped"
let BROCCOLI_IMAGE = "broccoli_bitmap_cropped"
let CUCUMBER_IMAGE = "cucumber_bitmap_cropped"
let BEGGIN_IMAGE = "beggin_strip_cropped"

let BACKGROUND_STR_LEVEL_1 = "background_guapo_game_nr"
let BACKGROUND_STR_LEVEL_2 = "beach_background_slide"
let BACKGROUND_STR_LEVEL_3 = "background_guapo_game_level3_"
let BACKGROUND_STR_LEVEL_4 = "background_guapogame_underwaterlevel_"
let BACKGROUND_STR_LEVEL_5 = "background_tuttigame_nr"
let BACKGROUND_OPAQUE_STR = "black_background"

let NUM_BACKGROUNDS_LEVEL_1 = 10
let NUM_BACKGROUNDS_LEVEL_2 = 14
let NUM_BACKGROUNDS_LEVEL_3 = 11
let NUM_BACKGROUNDS_LEVEL_4 = 5
let NUM_BACKGROUNDS_LEVEL_5 = 18

let BUBBLE_IMAGE_STR = "bubble_bitmap_cropped"

let HIGH_SCORE_ID_1 = "HighScoreLevel1Saved"
let HIGH_SCORE_ID_2 = "HighScoreLevel2Saved"
let HIGH_SCORE_ID_3 = "HighScoreLevel3Saved"
let HIGH_SCORE_ID_4 = "HighScoreLevel4Saved"
let HIGH_SCORE_ID_5 = "HighScoreLevel5Saved"

let LEVEL_ID_1 = 1
let LEVEL_ID_2 = 2
let LEVEL_ID_3 = 3
let LEVEL_ID_4 = 4
let LEVEL_ID_5 = 5

let GAME_MUTED = "gameMuted"
let PLAYING = "playing"
let GAME_FONT = "AvenirNext-Bold"
let LABEL_FONT = "Helvetica"

let BACKGROUND_START_SCREEN = "background_guapo_game_startscreen2"

let LEVELS_STR = "Levels"
let HIGHSCORE_STR = "High Score"
let SOUND_ON_IMAGE_STR = "volume_on"
let SOUND_OFF_IMAGE_STR = "volume_off"

let MAIN_MENU_BUTTON_NOTPRESSED_1 = "aruba_level_button_not_pressed_bitmap_cropped_1"
let MAIN_MENU_BUTTON_PRESSED_1 = "aruba_level_button_pressed_bitmap_cropped_1"
let MAIN_MENU_BUTTON_NOTPRESSED_2 = "beach_level_button_not_pressed_bitmap_cropped_1"
let MAIN_MENU_BUTTON_PRESSED_2 = "beach_level_button_pressed_bitmap_cropped_1"
let MAIN_MENU_BUTTON_NOTPRESSED_3 = "trip_level_button_not_pressed_bitmap_cropped_1"
let MAIN_MENU_BUTTON_PRESSED_3 = "trip_level_button_pressed_bitmap_cropped_1"
let MAIN_MENU_BUTTON_NOTPRESSED_4 = "ocean_level_button_not_pressed_bitmap_cropped_1"
let MAIN_MENU_BUTTON_PRESSED_4 = "ocean_level_button_pressed_bitmap_cropped_1"
let MAIN_MENU_BUTTON_NOTPRESSED_5 = "utreg_level_button_not_pressed_bitmap_cropped_1"
let MAIN_MENU_BUTTON_PRESSED_5 = "utreg_level_button_pressed_bitmap_cropped_1"

let PLAYER_MENU_BUTTON_NOTPRESSED = "player_menu_button_not_pressed_bitmap_cropped"
let PLAYER_MENU_BUTTON_PRESSED = "player_menu_button_pressed_bitmap_cropped"
let START_MENU_NOTPRESSED = "main_menu_button_not_pressed_bitmap_cropped"
let START_MENU_PRESSED = "main_menu_button_pressed_bitmap_cropped"
let LEVEL_MENU_NOTPRESSED = "level_menu_button_not_pressed_bitmap_cropped"
let LEVEL_MENU_PRESSED = "level_menu_button_pressed_bitmap_cropped"
let CONTINUE_NOTPRESSED = "continue_button_not_pressed_bitmap_cropped_1"
let CONTINUE_PRESSED = "continue_button_pressed_bitmap_cropped_1"

let TUTTI_BUTTON_NOTPRESSED = "tutti_button_not_pressed_cropped"
let TUTTI_BUTTON_PRESSED = "tutti_button_pressed_cropped"
let GUAPO_BUTTON_NOTPRESSED = "guapo_button_not_pressed_cropped"
let GUAPO_BUTTON_PRESSED = "guapo_button_pressed_cropped"

let GUAPO_IMAGE_PLAYER = "guapo_head_bitmap_cropped 1"
let TUTTI_IMAGE_PLAYER = "tutti_main_image_cropped_resized"

let MAIN_MENU_BUTTON_GRAY_2 = "beach_level_button_grey_1"
let MAIN_MENU_BUTTON_GRAY_3 = "trip_level_button_grey_1"
let MAIN_MENU_BUTTON_GRAY_4 = "ocean_level_button_grey_1"
let MAIN_MENU_BUTTON_GRAY_5 = "utreg_level_button_grey_1"
let LEVEL_UNLOCK_GUARD = 100
let FLAG_FREQUENCY = 100

let BACKGROUNDS_STR = "backgrounds"
let PLAYER_STR = "LEVEL_1_player"
let BROWNIE_STR = "LEVEL_1_brownie"
let FRITO_STR = "LEVEL_1_frito"
let MISTY_STR = "LEVEL_1_misty"
let CHEESY_STR = "LEVEL_1_CHEESY"
let PAPRIKA_STR = "LEVEL_1_PAPRIKA"
let CUCUMBER_STR = "LEVEL_1_CUCUMBERS"
let BEGGIN_STR = "LEVEL_1_BEGGIN"
let BROCCOLI_STR = "LEVEL_1_BROCCOLIS"

let FISH_STR_1 = "FISH_1"
let FISH_STR_2 = "FISH_2"
let FISH_STR_3 = "FISH_3"
let FISH_STR_4 = "FISH_4"
let FISH_STR_5 = "FISH_5"
let FISH_STR_6 = "FISH_6"
let BLOWFISH_STR = "BLOWFISH"
let HEART_IMAGE_STR = "heart1_bitmap_cropped"
let SCORE_ID = "SCORE_ID"
let MISTY_GUARD = "MISTY_GUARD"
let FLAG_NUM = "FLAG_NUM"
let NUM_LIVES_STR = "NUM_LIVES"
let NUM_LIVES = 3

let FLAG_ARUBA_STR = "flag_aruba_bitmap_cropped"
let FLAG_NETHERLANDS_STR = "flag_netherlands_bitmap_cropped"

let CONTINUE_BUTTON_NOT_PRESSED = "continue_button_not_pressed_bitmap_cropped"
let CONTINUE_BUTTON_PRESSED = "continue_button_pressed_bitmap_cropped"
let RESTART_BUTTON_NOT_PRESSED = "restart_button_not_pressed_bitmap_cropped"
let RESTART_BUTTON_PRESSED = "restart_button_pressed_bitmap_cropped"

