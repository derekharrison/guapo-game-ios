//
//  VillainImages.swift
//  SoloMission
//
//  Created by Derek Harrison on 24/08/2026.
//

class VillainImages {
    
    static func getVillainImages(levelId : LevelId) -> [String] {
        if(levelId != LevelId.OCEAN) {
            var birdImages = [String]()
            birdImages.append(waraWaraImage1)
            birdImages.append(waraWaraImage2)
            birdImages.append(waraWaraImage3)
            return birdImages
        }
        else {
            var jellyImages = [String]()
            jellyImages.append(jellyFishImage1)
            jellyImages.append(jellyFishImage2)
            jellyImages.append(jellyFishImage3)
            return jellyImages
        }
    }
}
