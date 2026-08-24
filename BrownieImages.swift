//
//  BrownieImages.swift
//  SoloMission
//
//  Created by Derek Harrison on 24/08/2026.
//

class BrownieImages {
    static func getBrownieImages(levelId : LevelId) -> [String] {
        if(levelId != LevelId.OCEAN) {
            var imagesBrownie = [String]()
            imagesBrownie.append(brownieImage)
            imagesBrownie.append(brownieHitImage)
            return imagesBrownie
        }
        else {
            var imagesBrownie = [String]()
            imagesBrownie.append(brownieSnorkelImage)
            imagesBrownie.append(brownieSnorkerHitImage)
            return imagesBrownie
        }
    }
}
