//
//  ViewController.swift
//  FirstTestPod
//
//  Created by kevin on 01/08/2018.
//  Copyright (c) 2018 kevin. All rights reserved.
//

import UIKit
import FirstTestPod

class ViewController: UIViewController, MyKitProtocol {
    
    let datas : MyKit = {
        let data = MyKit.shared
        return data
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        datas.open("1234", withNotifier: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        let time = datas.getCurrentDate()
        NSLog("time is : \(time)")
        
        self.view.backgroundColor = datas.getAColor()
        datas.doSomething("Hey dude !")
    }
    
    
    //MARK: - Protocol
    func didAskToDoSomething() {
        NSLog("Hey, the KIT IS CALLING ME BACK, crazy")
    }
    
    func configurationMCKit() -> MyKitConfig {
        return MyKitConfig(alpha: 1.0, key: "1234")
    }
}
