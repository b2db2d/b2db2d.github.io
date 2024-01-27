import SwiftUI

struct CreatureListView: View {
    @State var modelData = ModelData()
    var creatures:[Creature]{ModelData().creatures}
    @State var eggIndex:Int = 0
    var maxIndex:Int {ModelData().creatures.count-1}
    @State var showMainView = false
    @State private var mainViewHasAppeared = false


    var body: some View {
        if showMainView {
            MainView()
        } else {
            ZStack{
                if !mainViewHasAppeared {
                    AnimatedBackground(shouldDisable: $mainViewHasAppeared)
                        .blur(radius: 50)
                }
                VStack {
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
                    Button(action: {
                        
                        showMainView = true
                        mainViewHasAppeared = true
                    }) {
                        Text("Select")
                    }
                }
            }
        }
    }
}

#Preview {
    CreatureListView()
}
