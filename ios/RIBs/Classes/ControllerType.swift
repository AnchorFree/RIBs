//
//  ControllerType.swift
//  RIBs
//
//  Created by Vasyl Myronchuk on 8/6/19.
//  Copyright © 2019 Uber Technologies. All rights reserved.
//

#if os(iOS)
    import UIKit
#else
    import AppKit
#endif

#if os(iOS)
    public typealias ControllerType = UIViewController
#else
    public typealias ControllerType = NSViewController
#endif
