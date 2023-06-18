import UIKit

public var AppNavigation: UINavigationController?


// MARK: --- https://medium.com/swlh/an-easy-to-use-routing-system-in-swift-37e7e2d5259
//  An easy-to-use routing system in Swift

//#warning("My Message")
//#error("My Error Message")


/// Instances can asynchronously provide a view controller.
/// This is used in routing to get concrete view controllers for conceptual destinations.
public protocol ViewControllerProvider {
    typealias ResultHandler = (Result<BaseController, Error>) -> Void
    func provideViewController(resultHandler: @escaping ResultHandler)
}

/// An interface for classes that can navigate to given view controllers.
public protocol ViewControllerNavigator: AnyObject {
    func navigateTo(_ viewController: BaseController)
}


/// Conforming types represent destinations that we can routed to.
/// (Conforming types can be enums, structs, etc)
public protocol RoutingDestinationProtocol {}

/// Conforming instances can be used to route to destinations of a particular RoutingDestinationProtocol-conforming type.
public protocol RouterProtocol {
    associatedtype RoutingDestination: RoutingDestinationProtocol
    func route(to destination: RoutingDestination)
}

extension RouterProtocol where Self: ViewControllerNavigator, RoutingDestination: ViewControllerProvider {
    public func route(to destination: RoutingDestination) {
        destination.provideViewController { [weak self] result in
            if case .success(let viewController) = result {
                self?.navigateTo(viewController)
            }
        }
    }
}


