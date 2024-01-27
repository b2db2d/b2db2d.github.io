
import SwiftUI
import RealityKit
import RealityKitContent

class ViewRouter: ObservableObject {
    @Published var currentPage: String
    init() {
        self.currentPage = "CreatureListView"
    }
}

struct PublishedView: View {
    @EnvironmentObject var router: ViewRouter
    var body: some View {
        PublishedView().environmentObject(router)
        VStack {
            if router.currentPage == "CreatureListView" {
                CreatureListView().environmentObject(router)
            } else if router.currentPage == "Mainview" {
                MainView().environmentObject(router)
            }
        }
    }
}
