//
//  StructClassM.swift
//  Swift4x
//
//  Created by admindyn on 2018/8/24.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation
/*
 类和结构体实现功能标准
 
 Swift 中类和结构体有很多共同点。共同处在于：
 
 定义属性用于存储值
 定义方法用于提供功能
 定义下标操作使得可以通过下标语法来访问实例所包含的值
 定义构造器用于生成初始化值
 通过扩展以增加默认实现的功能
 实现协议以提供某种标准功能
 
与结构体相比，类还有如下的附加功能：
 
 继承允许一个类继承另一个类的特征
 类型转换允许在运行时检查和解释一个类实例的类型
 析构器允许一个类实例释放任何其所被分配的资源
 引用计数允许对一个类的多次引用
 
 */

class SomeClass {
    //在这里定义类
}


struct SomeStructure {
    //在这里定义结构体
}

/*
 显示器像素分辨率
 如果结构体没有提供自定义的构造器，它们将自动获得一个逐一成员构造器
 */
struct Resolution {
    var width = 0
    var height = 0
    var name:String = "默认逐一成员构造器"
    
}
/*
 视频显示器的特定模式
 如果结构体或类的所有属性都有默认值，同时没有自定义的构造器，那么 Swift 会给这些结构体或类提供一个默认构造器（default initializers）
 */
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
    
    init() {
        
    }
    
    init(name:String) {
        self.name = "没有继承"
    }
    

}

/*
 如果你为某个值类型定义了一个自定义的构造器，你将无法访问到默认构造器（如果是结构体，还将无法访问逐一成员构造器）
 */
struct Temperature {
    var temperature:Double
    
    init() {
        temperature = 32.0
    }
    
}

/*
 1、 那么如果我希望对一个结构体逐一成员构造器以及你自己的自定义构造器都能用来创建实例
 那么 就对结构体使用extension扩展 将自定义部分写在扩展中
 2、注意
 如果你通过扩展为一个已有类型添加新功能，那么新功能对该类型的所有已有实例都是可用的，即使它们是在这个扩展定义之前创建的
 */
extension Resolution {
    
    init(name:String) {
        self.name = "自定义构造器"
        self.width = 100
        self.height = 200
    }
}


class StructClassM:NSObject {
    
    var name:String
    
    var age:Int
    
    var descr:String?
    
    /*
     与 Objective-C 中的构造器不同，Swift 的构造器无需返回值，它们的主要任务是保证新实例在第一次使用前完成正确的初始化。
     */
    override init() {
        /*
         两段式构造过程1
         指定构造器必须保证它所在类引入的所有属性都必须先初始化完成，之后才能将其它构造任务向上代理给父类中的构造器。
         */
        name = "还没有self"
        age = 100
        super.init()
        /*
         阶段2
         构造器此时可以访问self、修改它的属性并调用实例方法等等。
         最终，任意构造器链中的便利构造器可以有机会定制实例和使用self。
         */
        
        print("子类调用过程检查")
    
    }
    
    convenience init(name:String,age:Int) {
        /*
         便利构造器必须先代理调用同一类中的其它构造器
         或先直接调用它的指定构造器。
         然后再为任意属性赋新值
         如果没这么做，便利构造器赋予的新值将被同一类中其它指定构造器所覆盖。
         */
        self.init()
        self.name = name
        self.age = age
        testSCM()
    }
    /*
     通过把方法，属性或下标标记为final来防止它们被重写，只需要在声明关键字前加上final修饰符
     */
    final  func testSCM()  {
        
        let somResolution = Resolution()
        
        let somVideoMode = VideoMode(name: "")
        
        
        print("分辨率:\(somResolution.width)")
        
        print("视频显示模式:\(somVideoMode.resolution) ,\(somVideoMode.name)")
        
        
        let tep = Temperature()
        
        print("当前温度:\(tep.temperature)")
        
        
        let resolution2 = Resolution(width: 8, height: 8, name: "默认逐一成员构造器")
        let resolution3 = Resolution(name: "")
        print("结构体使用extension的原因\(resolution2.name)和\(resolution3.name)可以一起使用")
      
        print("阿哈看看是不是子类:\(self.name)")
        self.testOverride()
        
        
    }
    

    
    func testOverride()  {
    
        print("父类在说话")
        
    }
    
}

//MARK: 继承

class ChildNode: StructClassM {
    var message:String
    
    override init() {
        /*
         两段式构造过程1
         指定构造器必须保证它所在类引入的所有属性都必须先初始化完成，之后才能将其它构造任务向上代理给父类中的构造器。
         这个阶段不能使用self访问 name age 属性
         */
        self.message = "子类"
        message = "是子类2"
       // name = "阿哈是字类"
      //self.childMethod()
        super.init()
        /*
         两段式构造过程2
         构造器此时可以顺利访问完整的self、修改所有继承的属性并调用所有继承的实例方法等等。
         最终，任意构造器链中的便利构造器可以有机会定制实例和使用self。
         */
        self.name = "阿哈修改成功"
        
        self.childMethod()
        
        self.testOverride()
    }
    //MARK: 继承 重写
    /*
     在子类中，你可以重写继承来的实例方法或类方法，提供一个定制或替代的方法实现
     */
    override func testOverride() {
        print("子类在说话")
    }
    
    func childMethod()  {
        print("子类方法")
    }
}

