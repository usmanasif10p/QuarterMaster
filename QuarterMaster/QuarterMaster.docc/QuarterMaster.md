# ``QuarterMaster``

<!--@START_MENU_TOKEN@-->Summary<!--@END_MENU_TOKEN@-->

## Overview

<!--@START_MENU_TOKEN@-->Text<!--@END_MENU_TOKEN@-->

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->

### View
for example:
```swift
import UIKit

class HomeView: BaseController, BaseView {
    typealias vm = HomeVM
    lazy var viewModel = {
        return HomeVM().initWithView(self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ...
    }
    
}
```
### ViewModel
for example:
```swift
import Foundation

class HomeVM: BaseViewModel {    
    typealias v = HomeView
    weak var weakView: HomeView?
    
    func initWithView(_ view: HomeView) -> Self {
        self.weakView = view
        return self
    }

}
```
