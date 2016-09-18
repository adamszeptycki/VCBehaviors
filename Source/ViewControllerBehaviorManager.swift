//
//  ViewControllerBehaviorManager.swift
//  ViewControllerBehaviors
//
//  Created by Adam Szeptycki on 18/09/16.
//  Copyright © 2016 Adam Szeptycki. All rights reserved.
//

import UIKit

extension UIViewController {


    /*
     Add behaviors to be hooked into this view controller’s lifecycle.
     Side efect: loads UIViewController view if not loaded.
     - parameter behaviors: Behaviors to be added.
     */

    func addBehaviors(behaviors: [ViewControllerBehavior]) {
        let behaviorViewController = LifecycleBehaviorViewController(behaviors: behaviors)

        addChildViewController(behaviorViewController)
        view.addSubview(behaviorViewController.view)
        behaviorViewController.didMoveToParentViewController(self)
    }

    private final class LifecycleBehaviorViewController: UIViewController {
        private let behaviors: [ViewControllerBehavior]

        // MARK: - Initialization

        init(behaviors: [ViewControllerBehavior] = []) {
            self.behaviors = behaviors

            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: - UIViewController

        override func viewDidLoad() {
            super.viewDidLoad()

            view.hidden = true

            applyBehaviors { behavior, viewController in
                behavior.afterLoading(viewController)
            }
        }

        override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)

            applyBehaviors { behavior, viewController in
                behavior.beforeAppearing(viewController)
            }
        }

        override func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)

            applyBehaviors { behavior, viewController in
                behavior.afterAppearing(viewController)
            }
        }

        override func viewWillDisappear(animated: Bool) {
            super.viewWillDisappear(animated)

            applyBehaviors { behavior, viewController in
                behavior.beforeDisappearing(viewController)
            }
        }

        override func viewDidDisappear(animated: Bool) {
            super.viewDidDisappear(animated)

            applyBehaviors { behavior, viewController in
                behavior.afterDisappearing(viewController)
            }
        }

        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()

            applyBehaviors { behavior, viewController in
                behavior.beforeLayingOutSubviews(viewController)
            }
        }

        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()

            applyBehaviors { behavior, viewController in
                behavior.afterLayingOutSubviews(viewController)
            }
        }

        // MARK: - Private

        private func applyBehaviors( body: ((behavior: ViewControllerBehavior, viewController: UIViewController) -> Void) ) {
            guard let parentViewController = parentViewController else { return }
            
            for behavior in behaviors {
                body(behavior: behavior, viewController: parentViewController)
            }
        }
    }
}
