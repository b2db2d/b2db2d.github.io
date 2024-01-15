//
//  SwiftUIView.swift
//  B2D
//
//  Created by  b2d on 1/15/24.
//

import SwiftUI

struct CreatureList: View{
    @Environment(ModelData.self) var modelData
    var creature:Creature
    //var creatrueList: [Creature]{modelData.creatures}
    //var id:Int=0
    var body: some View {
        creature.image.resizable().frame(width:60, height: 80)
    }
}

#Preview {
    let creatures = ModelData().creatures
    return
        CreatureList(creature:creatures[0])
}
