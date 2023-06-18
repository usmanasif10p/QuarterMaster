import UIKit
import QuarterMaster

class ViewController: BaseController, BaseView {
    typealias vm = ViewModel
    lazy var viewModel: ViewModel = {
        return ViewModel().initWithView(self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

class ViewModel: BaseViewModel {
    typealias v = ViewController
    weak var weakView: ViewController?
    
    func initWithView(_ view: ViewController) -> Self {
        self.weakView = view
        return self
    }
    
}
