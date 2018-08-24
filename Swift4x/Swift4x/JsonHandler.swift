//
//  JsonHandler.swift
//  Swift4x
//
//  Created by admindyn on 2018/8/23.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation
/*
 自定义错误处理的编写规范
 在 Swift 中，错误用符合Error协议的类型的值来表示。这个空协议表明该类型可以用于错误处理
 因此这里使用一个枚举 并且指明case的值类型为Error
 */

 enum ErrorThrow:Error {
    case error1NameisNil
    case error2NameLengthis0
    
 }


class JsonHandler: NSObject {

    
    
    /*
     结构体遵守Codable json协议
     */
    struct Product:Codable {
        var name:String
        var points:Int
        var description:String
    }
    override init() {
        
       super.init()
        
        testJSON()
    }
    func testJSON()  {
        
        let pear = Product(name: "pear", points: 250, description: "a ripe pear")
        
        let encoder = JSONEncoder()
        
        encoder.outputFormatting = .prettyPrinted
        //MARK: 数据类型 转换为 JSON字符串
        let data = try? encoder.encode(pear)
        if data != nil  {
            print("数据结构到JSON字符串\(String(data: data!, encoding: .utf8)!)")
        }else{
            print("nil")
        }
        
        jsonToStructure()
        
        jsonserial()
        
        
        
    }
    
    func jsonToStructure()  {
        let json = """
        {
        "name": "Durian",
        "points": 600,
        "description": "A fruit with a distinctive scent."
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        //MARK: JSON字符串 转换为 数据类型
        let prod = try? decoder.decode(Product.self, from: json)
        
        print("JSON字符串到数据结构:\(String(describing: prod?.name))")
    }
    
    func jsonserial()  {
        let jD = """
        [
            {
                "name": "Home Town Market",
                "aisles": [
                {
                "name": "Produce",
                "shelves": [
                        {
                            "name": "Discount Produce",
                            "product": {
                                "name": "Banana",
                                "points": 200,
                                "description": "A banana that's perfectly ripe."
                                }
                            }
                        ]
                    }
                ]
            }
        ]
        """.data(using: .utf8)
        
        if jD != nil {
            
            
            //MARK: JSON字符串 序列化
            
            do {
                let obj = try  JSONSerialization.jsonObject(with: jD!, options:.mutableContainers)
                
                print("数据结构\(obj)")
            } catch let error as NSError {
                print(error)
            }
            
            
            guard  let obj = try? JSONSerialization.jsonObject(with: jD!, options:.mutableContainers) else{
                
                return
            }
            
            
            
            if JSONSerialization.isValidJSONObject(obj) {
               
                print(type(of: obj))
                let ar = obj as! NSArray
                print(type(of: ar[0]))
                let dic = ar[0] as! NSDictionary
            
                print("JSON序列化:\(dic.value(forKey: "name"))")
            }
            
           
            
            
            
            
            
            
            
        }else
        {
            print("nil")
            
        }
    }
}
