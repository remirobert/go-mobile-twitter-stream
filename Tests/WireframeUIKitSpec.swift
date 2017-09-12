//
//  WireframeUIKitSpec.swift
//  TwitterStream
//
//  Created by Remi Robert on 12/09/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import Quick
import Nimble

@testable import TwitterStream

class WireframeUIKitSpec: QuickSpec {
    private var window: UIWindow!

    override func spec() {
        super.spec()

        describe("Wireframe UIKit extension tests") {
            beforeEach {
                self.window = StubWindow(frame: UIScreen.main.bounds)
                self.window.makeKeyAndVisible()
            }
            describe("View tests") {
                describe("with a valid implemantation of View") {
                    it("viewController should return a valid instance") {
                        let controller = StubViewController()

                        expect(controller.viewController).toNot(beNil())
                    }
                    it("present should present the ViewController") {
                        let controller1 = StubViewController()
                        let controller2 = StubViewController()
                        self.window.rootViewController = controller1
                        controller1.present(view: controller2)

                        expect(controller1.presentedViewController) === controller2
                        expect(controller2.presentingViewController) === controller1
                    }
                    it("dismiss should dismiss the ViewController") {
                        let controller1 = StubViewController()
                        let controller2 = StubViewController()
                        self.window.rootViewController = controller1
                        controller1.present(controller2, animated: false, completion: nil)
                        controller1.dismiss()

                        expect(controller1.dismissed) == true
                    }
                }
                describe("with an invalid implemantation of View") {
                    it("viewController should return nil") {
                        let controller = StubNotViewController()

                        expect(controller.viewController).to(beNil())
                    }
                    it("present shouldn't do anything") {
                        let controller1 = StubNotViewController()
                        let controller2 = StubViewController()
                        controller1.present(view: controller2)

                        expect(controller2.presentingViewController).to(beNil())
                    }
                    it("present shouldn't do anything") {
                        let controller1 = StubViewController()
                        let controller2 = StubNotViewController()
                        controller1.present(view: controller2)

                        expect(controller1.presenting) == false
                    }
                }
            }
            describe("Window tests") {
                describe("with a valid implemantation of View") {
                    it("rootViewController should be equal to the view") {
                        let controller = StubViewController()
                        self.window.rootView = controller

                        expect(self.window.rootView) === controller
                        expect(self.window.rootViewController) === controller
                    }
                }
                describe("with an invalid implemantation of View") {
                    it("rootViewController should be bil") {
                        let controller = StubNotViewController()
                        self.window.rootView = controller

                        expect(self.window.rootView).to(beNil())
                        expect(self.window.rootViewController).to(beNil())
                    }
                }
            }
        }
    }
}

class StubWindow: UIWindow, View {}

class StubNotViewController: NSObject, View {}

class StubViewController: UIViewController, View {
    private(set) var dismissed = false
    private(set) var presenting = false

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presenting = true
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        dismissed = true
    }
}
