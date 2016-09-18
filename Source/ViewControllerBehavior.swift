//
//  ViewControllerBehavior.swift
//  ViewControllerBehaviors
//
//  Created by Adam Szeptycki on 18/09/16.
//  Copyright © 2016 Adam Szeptycki. All rights reserved.
//

import Foundation

protocol ViewControllerBehavior {
    func afterLoading(viewController: UIViewController)

    func beforeAppearing(viewController: UIViewController)

    func afterAppearing(viewController: UIViewController)

    func beforeDisappearing(viewController: UIViewController)

    func afterDisappearing(viewController: UIViewController)

    func beforeLayingOutSubviews(viewController: UIViewController)

    func afterLayingOutSubviews(viewController: UIViewController)
}

// Make every behavior optional
extension ViewControllerBehavior {
    func afterLoading(viewController: UIViewController) {}

    func beforeAppearing(viewController: UIViewController) {}

    func afterAppearing(viewController: UIViewController) {}

    func beforeDisappearing(viewController: UIViewController) {}

    func afterDisappearing(viewController: UIViewController) {}

    func beforeLayingOutSubviews(viewController: UIViewController) {}

    func afterLayingOutSubviews(viewController: UIViewController) {}
}
