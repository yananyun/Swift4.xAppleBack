//
//  Generic.swift
//  Swift4x
//
//  Created by admindyn on 2018/8/24.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

//MARK:关键字 associatetype 与 Self 作用 self

/*
 使用关键字 associatedtype 来声明协议关联类型。关联类型为作为协议声明的一部分，为某种类型提供了一个别名。关联类型和泛型参数子句中的类型参数很相似，但是它们和 Self 一样，用于协议中。Self 指代采纳协议的类型
 */

protocol ModelManager {
    
    associatedtype Model
    
    associatedtype Collection:Swift.Collection where Collection.Element == Model
    
    associatedtype Query
    
    func models(matching query:Query) -> Collection ;
    
}

struct User {
    var name:String
    var age:Int
    
}

class UserManager: ModelManager {
 /*类型别名声明
    typealias 类型别名 = 现存类型
     */
   
    typealias Model = User
    
    enum Query {
        case name(String)
        case ageRnage(Range<Int>)
    }
    
    func models(matching query: UserManager.Query) -> [User] {
        //
        let user1 = User(name: "sunny", age: 25)
        let user2 = User(name: "lily", age: 18)
        let user3 = User(name: "michael", age: 30)
        let users = [user1,user2,user3]
        
        switch query {
        case .name(let name):
            return users.filter({ (u) -> Bool in
                return u.name == name
            })
        case .ageRnage(let range):
            
            return users.filter({ (u) -> Bool in
                
                return range ~= u.age
            })
            
        }
    }
    
    
}


/*枚举 添加hashvalue 协议*/
enum Genre:String,Hashable {
    case cartoon = "cartoon"
    case action = "action"
    case comedy = "Comedy"
    
    var hashValue:Int {
        return self.rawValue.hashValue
    }
    //参数 左值 右值 操作符c重载
    static func ==(lhs:Genre,rhs:Genre)->Bool
    {
        
        return lhs.rawValue == rhs.rawValue
        
    }
    
    
}

struct Movie:Hashable {
    var name:String
    var director:String
    var genre:Genre
    
    var hashValue:Int {
        
        return Int("\(name.hashValue)"+"\(director.hashValue)")!
    }
    
   static func == (lhs:Movie,rhs:Movie) -> Bool {
        return lhs.name == rhs.name && lhs.director == rhs.director && lhs.genre == rhs.genre
    }
    
}


class MovieManager: ModelManager {
    /*
     将元组 类型 别名叫 Model
     */
    typealias Model = (key:Genre,value:Movie)
    
    enum Query {
        case name(String)
        case director(String)
    }
    
    func models(matching query: MovieManager.Query) -> [Genre:Movie] {
        
        
        return [:]
    }
    

    
}

/*
 泛型约束最大的优势是使用扩展
 */
extension Array where Element:Numeric {
    func sum() -> Element {
        return reduce(1, { (res, v) -> Element in
            return res*v
        })
    }
    
}


extension Collection where Element == String {
    func countWords() -> Int {
        return reduce(0, { (res, item) -> Int   in
            print(item)
            let  components = item.components(separatedBy: .whitespacesAndNewlines)
            
            print(components)
            print(components.count)
            
            return res + components.count
            
        })
    }
    
    
}


class Generic: NSObject {
    
    
    
    
    override init() {
        super.init()
     let v = self.sum([1,2,3,4])
        print("sum:\(v)")
     let ar = [1,2,3,3]
     let v2 =   ar.sum()
        print("sum:\(v2)")
    let array2 = ["sunny","cloudy","apple orange"]
        
     let v3 = array2.countWords()
        print("words:\(v3)")
        
    }
    
    //完成数字求和
    func sum(_ numbers:[Int]) -> Int {
        return numbers.reduce(1, { (res, v) -> Int in
           return res * v
        })
    }
    
    
    
}


