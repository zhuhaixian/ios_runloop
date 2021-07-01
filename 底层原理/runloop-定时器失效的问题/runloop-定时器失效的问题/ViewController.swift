//
//  ViewController.swift
//  runloop-定时器失效的问题
//
//  Created by weconex on 2021/6/30.
//

import UIKit

class ViewController: UIViewController {

  final  var  stoped : Bool?
    var thead : ISThread?
    override func viewDidLoad() {
        super.viewDidLoad()
//        let mytimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//            print("----")
//        }
//        let mytimer = Timer(timeInterval: 1.0, repeats: true) { timer in
//            print("-----")
//        }
////        RunLoop.main.add(mytimer, forMode: .tracking)
//        //common 不是一个真的模式，只是一个标记
//        // MARK:-- 在设置里common标记的模式下都能运行
//        RunLoop.main.add(mytimer, forMode: .common)
        let textView = UITextView(frame: CGRect(x: 10, y: 100, width: 200, height: 200))
        textView.text = "124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-1243254365124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-1243254365124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-124325436586797809-"
        view.addSubview(textView)
        
        
        /**
         线程保活
         */
        
    thead =  ISThread.init(target: self, selector: #selector(self.run), object: nil)
        thead?.start()
        
    }

    @objc  func run() {
        print("做事情")
        RunLoop.current.add(Port(), forMode: .default)
        RunLoop.current.run()
        
        print("end")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.performSelector(onMainThread: #selector(self.test), with: nil, waitUntilDone: false)
        print("123")
    }
    
    @objc  func test() {
        print("test")
        
    }
}

