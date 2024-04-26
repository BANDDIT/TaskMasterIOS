//
//  ContentView.swift
//  TaskMaster
//
//  Created by Arrick Russell Adinoto on 03/04/24.
//

import SwiftUI

struct ContentView: View {
 
    @State var bgColor:Color=Color.green
    
    @State var listTasks:[Task]=[]
    
    /*
    @State var listTasks:[Task] = [
        Task(id: 1, title: "Do Monthly Report", desc: "Check the templates from your lecturer", deadline: Date()),
        Task(id: 2, title: "Making Prototype", desc: "Check Apple Design Resources", deadline: Date())
    ]
    */
    
    init(){
        if let savedBgColor = UserDefaults.standard.value(forKey:"bgColor"){
            bgColor=savedBgColor as! Color
        }
        else{
            bgColor=Color.green
        }
        
        do{
            /*
            let savedListTasks = UserDefaults.standard.value(forKey:"listTasks")
                listTasks=savedListTasks as! [Task]
             */
            
        }catch{
            print("Error")
        }
        
        /*
        if let savedListTasks = UserDefaults.standard.value(forKey:"listTasks"){
            listTasks=savedListTasks as! [Task]
        }
         */
    }
     
    
    var body: some View {
        TabView {
            Home(dataTasks:$listTasks,bgColor:$bgColor).tabItem(){
                Label("My Task",systemImage:"list.clipboard")
            }
            Setting(bgColor:$bgColor).tabItem(){
                Label("Setting",systemImage:"gearshape")
            }
        }
        //.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
