//
//
//  SimpleFlutterSDK.swift
//  SimpleFlutterSDK
//
//  Created by David Castaño on 1/12/25.
//


import Foundation
import Flutter

public final class SimpleFlutterSDk {
    @MainActor public static let shared = SimpleFlutterSDk()

    private let engine: FlutterEngine
    private let channel: FlutterMethodChannel

    //    private init() {
    //        // This name can be anything, just an identifier
    //        engine = FlutterEngine(name: "simple_flutter_sdk_engine")
    //        channel = FlutterMethodChannel(
    //            name: "simple_flutter_sdk",          // must match Dart side
    //            binaryMessenger: engine.binaryMessenger
    //        )
    //    }

    private init() {
        // 1. Use precompiled Dart bundle from App.framework
        let project = FlutterDartProject(precompiledDartBundle: Bundle.main)

        // 2. Create engine with that project
        engine = FlutterEngine(name: "simple_flutter_sdk_engine", project: project)

        // 3. Optionally run here, or lazily in start()
        engine.run()

        // 4. Channel on top of this engine
        channel = FlutterMethodChannel(
            name: "simple_flutter_sdk",
            binaryMessenger: engine.binaryMessenger
        )
    }

    /// Start the Flutter engine (idempotent-ish for simple use)
    @discardableResult
    public func start() -> Bool {
        if engine.run() {
            return true
        } else {
            // Already running or failed; in real code you’d handle better
            return false
        }
    }

    /// Example SDK API that calls Dart and returns a String
    public func hello(completion: @escaping (String?) -> Void) {
        // Ensure engine is running
        _ = start()

        channel.invokeMethod("hello", arguments: nil) { _ in
            // let text = result as? String
            completion("hello from swift")
        }
    }
}
