//
//  Optional.swift
//  Swift4x
//
//  Created by admindyn on 2018/8/23.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation



class Optional: NSObject {
  
    override init() {
        var age:Int?
        
        var xiaoming = "steven"
        
        age = 12
        
        age = Int("abc")
        
        age = 25
        
        if age != nil {
            print("\(age)")
            //Optional 可选型 输出的是一个整数类型的可选型s值
            //加！确定不为空后可选型解包 输出的是常用整型值
            print("\(age!)")
        }else
        {
            
            print("nil")
            
        }
    }

}

