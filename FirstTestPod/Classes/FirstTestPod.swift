//
//  FirstTestPod.swift
//  Pods
//
//  Created by KHI on 08/01/2018.
//
//

import Foundation
import UIKit

public protocol MyKitProtocol: class {
    func didAskToDoSomething()
    func configurationMCKit() -> MyKitConfig
}

public struct MyKitConfig {
    var alpha: Float
    var key: String
    
    public init(alpha: Float, key: String) {
        self.alpha = alpha
        self.key = key
    }
}


public class MyKit: NSObject {
    //MARK: - Members
    // - publics
    open static let shared = MyKit()
    
    // - privates
    fileprivate var config: MyKitConfig
    fileprivate weak var delegate: MyKitProtocol? = nil {
        didSet {
            guard let del = delegate else {return}
            config = del.configurationMCKit()
        }
    }
    fileprivate var key: String?
    fileprivate let magicKey: String = "1234"
    
    //MARK: - Life Cycle
    fileprivate override init() {
        config = MyKitConfig(alpha: 1.0, key: "-999")
        // LOCK the init methode, so you can only use the shared methode
        super.init()
    }
    
    
    //MARK: - API
    public func open(_ key: String, withNotifier notifier: MyKitProtocol) {
        self.key = key // Check key or lock the API
        self.delegate = notifier
    }
    
    
    public func getCurrentDate() -> NSDate {
        return NSDate()
    }
    
    public func getAColor(_ alpha: Float = 1.0) -> UIColor {
        return UIColor(colorLiteralRed: getRandomVal(),
                       green: getRandomVal(),
                       blue: getRandomVal(),
                       alpha: alpha)
    }
    
    public func doSomething(_ str: String) {
        NSLog("print my \(str)")
        self.delegate?.didAskToDoSomething()
    }
    
    //MARK: - Methodes
    fileprivate func getRandomVal() -> Float {
        return( Float(arc4random_uniform(255)) / 255.0)
    }
    
    fileprivate func checkKey() -> Bool {
        return false //TODO
    }
}

