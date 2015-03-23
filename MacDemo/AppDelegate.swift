//
//  AppDelegate.swift
//  MacDemo
//
//  Created by Justin Spahr-Summers on 2015-03-22.
//  Copyright (c) 2015 ReactiveCocoa. All rights reserved.
//

import Cocoa

@NSApplicationMain class AppDelegate: NSObject, NSApplicationDelegate {
	let windowController = MainWindowController(windowNibName: "MainWindow")

	func applicationDidFinishLaunching(aNotification: NSNotification) {
		windowController.showWindow(nil)
	}
}

