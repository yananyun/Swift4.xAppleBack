//
//  ErrorHandler.swift
//  Swift4x
//
//  Created by admindyn on 2018/8/24.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

//MARK: 异常类编写规范

/*
 自定义错误处理的编写规范
 在 Swift 中，错误用符合Error协议的类型的值来表示。这个空协议表明该类型可以用于错误处理
 因此这里使用一个枚举 并且指明case的值类型为Error
 */


enum MyError:Error {
    case nameisnil(String)
    case ageillegal(String)
}

class ErrorHandler: NSObject {
    override init() {
        super.init()
        self.testError()
    }
    /*
     为了表示一个函数、方法或构造器可以抛出错误，在函数声明的参数列表之后加上throws关键字。一个标有throws关键字的函数被称作throwing 函数。如果这个函数指明了返回值类型，throws关键词需要写在箭头（->）的前面
     */
    func canThrowErrors(th:Bool) throws -> String {
        print("errorhandler throw error")
        if th {
            
            throw MyError.nameisnil("名字为空出错")
         
        }
        return "正常"
    }
    
    func testError()  {
        
        //MARK:do-catch异常捕获
        
        do {
            let vv = try self.canThrowErrors(th: true)
            
            print(vv)
            /*
             在catch后面写一个匹配模式来表明这个子句能处理什么样的错误。如果一条catch子句没有指定匹配模式，那么这条子句可以匹配任何错误，并且把错误绑定到一个名字为error的局部常量
             */
        } catch let err as Error  {
        /*
        使用类型转换中描述的 is 和 as 操作符来检查协议一致性
             */
            print("异常:\(err)")
            
            print("异常:\(err.localizedDescription)")
        }
        /*
         可以使用try?通过将错误转换成一个可选值来处理错误。如果在评估try?表达式时一个错误被抛出，那么表达式的值就是nil
         */
        
        //MARK:guard 跳过异常 不处理
        
        guard let vv = try?
            self.canThrowErrors(th:false) else {
                
                return
        }
        
        print(vv)
        
    }
}
