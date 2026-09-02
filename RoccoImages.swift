//
//  RoccoImages.swift
//  SoloMission
//
//  Created by Derek Harrison on 02/09/2026.
//

class RoccoImages {
    static func getImages(levelId : LevelId) -> [String] {
        if(levelId != LevelId.OCEAN) {
            var images = [String]()
            images.append(roccoImage)
            images.append(roccoHitImage)
            return images
        }
        else {
            var images = [String]()
            images.append(roccoSnorkelImage)
            images.append(roccoSnorkelHitImage)
            return images
        }
    }
}
