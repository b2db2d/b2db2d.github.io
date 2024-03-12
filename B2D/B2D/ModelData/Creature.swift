//
//  Creature.swift
//  B2D
//
//  Created by  b2d on 1/15/24.
//

import Foundation
import SwiftUI

struct MonsterData: Hashable, Codable, Identifiable {
    var id:Int
    var name:String
    
    var image_name: String
    var image: Image {
        Image(image_name)
    }
    
    var usdz_list : [String]

}
