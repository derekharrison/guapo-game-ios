//
//  MistyImages.swift
//  SoloMission
//
//  Created by Derek Harrison on 24/08/2026.
//

class MistyImages {
    static func getMistyImages(levelId : LevelId) -> [String] {
        if(levelId != LevelId.OCEAN) {
            var imagesMisty = [String]()
            imagesMisty.append(mistyImage)
            imagesMisty.append(mistyHitImage)
            imagesMisty.append(mistyRotatedImage)
            imagesMisty.append(mistyRotatedHitImage)
            return imagesMisty
        }
        else {
            var imagesMisty = [String]()
            imagesMisty.append(mistySnorkelImage)
            imagesMisty.append(mistySnorkelHitImage)
            imagesMisty.append(mistySnorkelRotatedImage)
            imagesMisty.append(mistySnorkelRotatedHitImage)
            return imagesMisty
        }
    }
}
