import SwiftUI

struct CreatureListView: View {
    @State var modelData = ModelData()
    var creatures:[Creature]{ModelData().creatures}
    @State var eggIndex:Int = 0
    var maxIndex:Int {ModelData().creatures.count-1}
    
    
 
    @State private var mainViewHasAppeared = false
    
    @Environment(ViewModel.self) private var model

    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow



    var body: some View {
        @Bindable var model = model
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
                            Image(systemName: "chevron.left")
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
                            Image(systemName: "chevron.right")
                        }
                    }
                    
                    MonsterToggle()
                }
            }
            .animation(.default, value: model.isShowingUs)
        
        // Close any open detail view when returning to the table of contents.
        .onChange(of: model.navigationPath) { _, path in
            if path.isEmpty {
                if model.isShowingView {
                    dismissWindow(id: "views")
                }
            }
        }
        
    }
}

//#Preview {
//    CreatureListView()
//}
