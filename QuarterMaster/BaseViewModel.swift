import Foundation

public protocol BaseViewModel: AnyObject {
    associatedtype v: BaseView
    var weakView: v? { get set }

    func initWithView(_ view: v) -> Self
}
extension BaseViewModel {}
