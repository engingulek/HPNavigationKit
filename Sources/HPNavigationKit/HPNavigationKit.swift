// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import DependencyKit
import HPModularProtocolsKit

//MARK: Page
/// Pages on the application
///  An enum representing pages in the application.
public enum Page : Hashable {
    case home
    case detail(Int)
}

//MARK: Navigation
///  Navigation class for managing the navigation stack.
public class Navigation : ObservableObject {
    public init() { }
    @Published public var  path = NavigationPath()
    
    /// Push a new page into the navigation stack.
    public  func push(_ page:Page){
        path.append(page)
       
    }
    /// Pop the last page from the navigation stack.
    public  func pop() {
        path.removeLast()
    }
    /// Pop all the pages, going back to the root page.
    public  func popToRoot(){
        path.removeLast(path.count)
    }
    
    /// Build the appropriate view for a given page.
    @ViewBuilder
    public  func build(page:Page) -> some View {
        switch page {
        case .home:
            /// Dependency resolution and view creation for the home page
            let homeModule:HomeModuleProrocol = DependencyRegister.shared.resolve(HomeModuleProrocol.self)
            homeModule.createHomeModuleView()
        case .detail(let index):
            /// Dependency resolution and view creation for detail page
            let detailModule:DetailModuleProrocol = DependencyRegister.shared.resolve(DetailModuleProrocol.self)
            detailModule.createDetailModuleView(index: index)
        }
    }
}
