//
//  CretureListView.swift
//  B2D
//
//  Created by  b2d on 1/15/24.
//

import SwiftUI

struct CreatureListView: View {
    //var inputHour:Int
    @State private var modelData = ModelData()
    //@Environment(ModelData.self) var modelData
    
    var creatures:[Creature]{ModelData().creatures}
    @State var eggIndex:Int = 0
    var maxIndex:Int {ModelData().creatures.count-1}
    var body: some View {
        Text("Select your Egg").padding()
        
        HStack{
            
            Button{
                eggIndex = eggIndex-1
                if eggIndex < 0{
                    eggIndex = maxIndex
                }
            }label: {
                Text("<")
            }
            
            creatures[eggIndex].image.resizable().frame(width:60, height: 80)
                .shadow(radius: 7)
                .padding()
            
            
            Button{
                eggIndex = eggIndex+1
                if eggIndex > maxIndex {
                    eggIndex = 0
                }
            }label: {
                Text(">")
            }
            
            
        }
        Button{
            // ToDo: next Scene
        }label: {
            Text("select")
        }
    }
}

#Preview {
    CreatureListView()
    //let creatures = ModelData().creatures
    //return CreatureList(creature:creatures[0])
}
