//
//  Task.swift
//  TaskMaster
//
//  Created by Arrick Russell Adinoto on 03/04/24.
//

import Foundation

struct Task:Identifiable,Codable{
    var id:Int
    var title:String
    var desc:String
    var deadline:Date
    var status:Bool = false
}
