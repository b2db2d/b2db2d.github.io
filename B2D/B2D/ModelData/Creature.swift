//
//  Creature.swift
//  B2D
//
//  Created by  b2d on 1/15/24.
//

import Foundation
import SwiftUI

struct Creature: Hashable, Codable, Identifiable {
    var id:Int
    var name:String
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}
