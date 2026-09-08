//
//  GuapoImages.swift
//  SoloMission
//
//  Created by Derek Harrison on 08/09/2026.
//

class GuapoImages {
    static func getImages(levelId : LevelId) -> [String] {
        if(levelId != LevelId.OCEAN) {
            var images = [String]()
            images.append(guapoImage1)
            images.append(guapoHitImage)
            return images
        }
        else {
            var images = [String]()
            images.append(guapoSnorkelImage)
            images.append(guapoSnorkelHitImage)
            return images
        }
    }
}
