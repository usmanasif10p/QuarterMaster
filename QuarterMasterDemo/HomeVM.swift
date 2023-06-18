import Foundation
import QuarterMaster

class HomeVM: BaseViewModel {
    typealias v = HomeView
    var weakView: HomeView?
    
    func initWithView(_ view: HomeView) -> Self {
        self.weakView = view
        return self
    }
}
