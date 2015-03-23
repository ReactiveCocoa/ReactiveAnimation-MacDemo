//
//  MainWindowController.swift
//  MacDemo
//
//  Created by Justin Spahr-Summers on 2015-03-22.
//  Copyright (c) 2015 ReactiveCocoa. All rights reserved.
//

import AppKit
import ReactiveAnimation
import ReactiveCocoa

func randomFloat(max: CGFloat) -> CGFloat {
	return CGFloat(arc4random_uniform(UInt32(max)))
}

final class MainWindowController: NSWindowController {
	@IBOutlet weak var label: NSTextField!

	override func windowDidLoad() {
		super.windowDidLoad()

		let contentSize = window!.contentView.bounds.size
		let labelSize = label.bounds.size

		let producer: SignalProducer<CGRect, NoError> = timer(1, onScheduler: QueueScheduler.mainQueueScheduler)
			|> map { _ -> CGRect in
				let origin = NSPoint(x: randomFloat(contentSize.width), y: randomFloat(contentSize.height))
				return CGRect(origin: origin, size: labelSize)
			}
			|> animateEach(duration: 0.2)
			|> join(.Concat)

		RAN(label).frame <~ producer
	}
}
