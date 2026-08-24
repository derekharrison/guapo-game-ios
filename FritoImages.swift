//
//  FritoImages.swift
//  SoloMission
//
//  Created by Derek Harrison on 24/08/2026.
//

class FritoImages {
    static func getImages(levelId : LevelId) -> [String] {
        if(levelId != LevelId.OCEAN) {
            var imagesFrito = [String]()
            imagesFrito.append(fritoImage)
            imagesFrito.append(fritoHitImage)
            return imagesFrito
        }
        else {
            var images = [String]()
            images.append(fritoSnorkelImage)
            images.append(fritoSNorkelHitImage)
            return images
        }
    }
}
