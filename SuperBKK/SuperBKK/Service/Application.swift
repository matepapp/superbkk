//
//  Application.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import UIKit

class Application {
    private let window: UIWindow
    lazy var navigation: Navigation = Navigation(
        window: self.window,
        navigationController: UINavigationController(),
        application: self
    )
    lazy var network = Network()
    
    init(window: UIWindow) {
        self.window = window
    }
}
