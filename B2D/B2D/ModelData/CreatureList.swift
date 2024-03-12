//
//  SwiftUIView.swift
//  B2D
//
//  Created by  b2d on 1/15/24.
//

import SwiftUI

struct CreatureList: View{
    @Environment(ModelData.self) var modelData
    var creature:MonsterData
    
    var body: some View {
        creature.image.resizable().frame(width:60, height: 80)
    }
}

#Preview {
        CreatureList(creature:ModelData().monsters[0])
}
