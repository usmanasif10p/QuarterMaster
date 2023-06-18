import UIKit
import QuarterMaster

class HomeView: BaseController, BaseView {
    typealias vm = HomeVM
    lazy var viewModel: HomeVM = {
        return HomeVM().initWithView(self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
