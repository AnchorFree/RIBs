//
//  Copyright (c) 2017. Uber Technologies
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation


#if os(macOS)
import Cocoa

/// The root `Router` of an application. MacOS apps don't necessarily launch to any UI so it is not declared
/// as a ViewableRouting. Subclasses declared for simple applications (i.e. a single window app) may implement
/// ViewableRouting in a manner similar to the iOS version and launch the app's UI in its didLoad() method.
public protocol LaunchRouting: Routing {

    /// Launches the router tree. Mac apps are not obligated to display UI on launch so what to do is left as an
    /// exercise to subclass implementers.
    func launch()
}

/// The application root router base class, that acts as the root of the router tree.
open class LaunchRouter<InteractorType>: Router<InteractorType>, LaunchRouting {

    /// Initializer.
    ///
    /// - parameter interactor: The corresponding `Interactor` of this `Router`.
    public override init(interactor: InteractorType) {
        super.init(interactor: interactor)
    }

    /// Launches the router tree.
    public final func launch() {
        interactable.activate()
        load()
    }
}
#endif

#if os(iOS)
import UIKit

/// The root `Router` of an application.
public protocol LaunchRouting: ViewableRouting {

    /// Launches the router tree.
    ///
    /// - parameter window: The application window to launch from.
    func launch(from window: UIWindow)
}

/// The application root router base class, that acts as the root of the router tree.
open class LaunchRouter<InteractorType, ViewControllerType>: ViewableRouter<InteractorType, ViewControllerType>, LaunchRouting {

    /// Initializer.
    ///
    /// - parameter interactor: The corresponding `Interactor` of this `Router`.
    /// - parameter viewController: The corresponding `ViewController` of this `Router`.
    public override init(interactor: InteractorType, viewController: ViewControllerType) {
        super.init(interactor: interactor, viewController: viewController)
    }

    /// Launches the router tree.
    ///
    /// - parameter window: The window to launch the router tree in.
    public final func launch(from window: UIWindow) {
        window.rootViewController = viewControllable.viewController
        window.makeKeyAndVisible()

        interactable.activate()
        load()
    }
}
#endif
