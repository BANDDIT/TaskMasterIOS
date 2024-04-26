//
//  DataGetter.swift
//  TaskMaster
//
//  Created by Arrick Russell Adinoto on 03/04/24.
//

import Foundation
import SwiftUI

struct DataGetter{
    /*
    static var listTasks:[Task] = [
        Task(id: 1, title: "Satu", desc: "Sing penting satu wis satu", deadline: Date()),
        Task(id: 2, title: "Dua", desc: "Sing penting dua wis dua", deadline: Date())
    ]
    
    static var listTasks2:[Task] = [
        Task(id: 1, title: "Satu", desc: "Sing penting satu wis satu", deadline: Date())
    ]
    
    static var angkaTest:Int = 1
    */
    
    @Binding var listTasks:[Task]
    
    func deleteData(task:Task){
        var indexDelete:Int = -1
        for listTask in listTasks {
            indexDelete+=1
            if(task.id == listTask.id){
                listTasks.remove(at:indexDelete)
                break
            }
        }
    }
    /*
    static func getData() -> [Task]{
        return self.listTasks
    }*/
    /*
    var body: some View{
        Text("Hello")
    }*/
}
