//
//  ISThread.swift
//  runloop-定时器失效的问题
//
//  Created by weconex on 2021/6/30.
//

import UIKit

class ISThread: Thread {
    deinit {
        print("销毁")
    }
}
