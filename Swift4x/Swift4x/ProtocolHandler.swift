//
//  ProtocolHandler.swift
//  Swift4x
//
//  Created by admindyn on 2018/8/23.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

/*
 RawRepresentable遵循这个协议的类型可以表示另一个类型，并且可以通过 rawValue 这个属性得到它表示的值
 既通过 rawValue 存储了 key，
 同时通过范型在类型中注入了 value 的类型信息。
 */
struct PreferenceName<Type>:RawRepresentable{
    
     //协议必须实现
    typealias RawValue = String
    //协议必须实现
    var rawValue: String


    init?(rawValue:PreferenceName.RawValue) {
        self.rawValue = rawValue
    }
    
    
}

/*
 注意
 如果你通过扩展为一个已有类型添加新功能，那么新功能对该类型的所有已有实例都是可用的，即使它们是在这个扩展定义之前创建的
 */

extension UserDefaults {
    
    //MARK: 扩展 下标运算方法 newValue参数
    
    subscript(key:PreferenceName<Bool>)->Bool
    {
        
        
        /*这里下标操作符 会默认提供newValue参数。
         
         newValue的类型和下标的返回类型相同。如同计算型属性，可以不指定 setter 的参数（newValue）。如果不指定参数，setter 会提供一个名为newValue的默认参数。
         */
        set{
            set(newValue, forKey: key.rawValue)
        }
        get{
            return bool(forKey: key.rawValue)
        }
    }
    
    subscript(key:PreferenceName<Int>)->Int
    {
        set{
            set(newValue, forKey: key.rawValue)
        }
        get{
            return integer(forKey: key.rawValue)
        }
    }
    
    subscript(key:PreferenceName<Any>)->Any
    {
        set{
            set(newValue, forKey: key.rawValue)
        }
        get{
            return value(forKey: key.rawValue)!
        }
    }
    
}

struct PrefrenceNames {
    static let maxCacheSize = PreferenceName<Int>(rawValue: "MaxCacheSize")
    static let badgeType = PreferenceName<Int>(rawValue: "BadgeType")
    
    static let backgroundImageURL = PreferenceName<URL>(rawValue: "BackgroundImageURL")
    
  
}


class ProtocolHandler: NSObject {
    override init() {
        
        super.init()
        
        testProtocol()
       
    }
    
    //MARK:RawRepresentable系统协议的使用
    
    func testProtocol()  {
 
        UserDefaults.standard[PrefrenceNames.maxCacheSize!] = 30
        
        if let key = PrefrenceNames.maxCacheSize {
            
            let v =  UserDefaults.standard[key]
            
            print("UserDefaultValue:\(v) ForKey:\(key.rawValue)")
        }
        
       
    }
}
