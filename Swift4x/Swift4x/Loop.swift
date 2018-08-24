//
//  Loop.swift
//  Swift4x
//
//  Created by admindyn on 2018/8/23.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

class Loop: NSObject {
   
    override init() {
        //开区间遍历
        for i in 0..<5 {
            print(i)
        }
        //闭区间遍历
        for i in 0...5 {
            print(i)
        }
        //字符遍历
        for i in "hello" {
            print(i)
        }
        //遍历数组
        let names = ["Anna", "Alex", "Brian", "Jack"]
        for name in names {
            print("Hello, \(name)!")
        }
        //遍历字典
        let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        for (animalName, legCount) in numberOfLegs {
            print("\(animalName)s have \(legCount) legs")
        }
        //
        let minutes = 60
        let minuteInterval = 5
        for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
            // 每5分钟渲染一个刻度线 (0, 5, 10, 15 ... 45, 50, 55)
            print("刻度线:\(tickMark)")
        }
        
    }
    
}
