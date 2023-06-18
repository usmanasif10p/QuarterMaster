import UIKit

public protocol BaseView: AnyObject {
    associatedtype vm: BaseViewModel
    var viewModel: vm { get set }
}
extension BaseView {}


open class BaseController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        print("BaseController...")
    }
}
