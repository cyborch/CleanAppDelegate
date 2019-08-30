//
//  AppDelegate.swift
//  AppServicesSwift
//
//  Created by Steven Curtis on 25/07/2019.
//  Copyright © 2019 Steven Curtis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    @objc public var window: UIWindow?
    
    @objc public let services: [UIApplicationDelegate] = [
        PersistenceService(),
        AnalyticsService(),
        CrashReporterService()
    ]

}

