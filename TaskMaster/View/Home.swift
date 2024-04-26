//
//  Home.swift
//  TaskMaster
//
//  Created by Arrick Russell Adinoto on 03/04/24.
//

import SwiftUI

struct Home: View {
    @Binding var dataTasks:[Task] //= DataGetter.listTasks
    @Binding var bgColor:Color
    @State var title:String = "My Task"
    
    var task2 = Task(id: 1, title: "Kerjain PR Math", desc: "lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll", deadline: Date())
    
    
    var body : some View{
        NavigationView{
            VStack{
                Text(title)               .fontWeight(.bold)
                    .font(.system(size: 35))
                    //.background(.green)
                    .padding(.top,1)

                ScrollView{
                    ForEach(dataTasks, id:\.id){dataTask in
                        /*
                        TaskCard(dataTasks:$dataTasks,task:task2).padding(.bottom,5)
                        */
                        TaskCard(dataTasks:$dataTasks, bgColor:$bgColor, task: dataTask).padding(.bottom,5)
                            //.transition(.scale)
                            
                    }
                    .frame(width:380)
                    .padding(.top,10)
                }
                
                NavigationLink(destination: AddTask(dataTasks:$dataTasks, bgColor:$bgColor)){
                    Text("Add New Task")    .frame(width:200, height:40, alignment:.center)
                        .background(bgColor)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .padding(.bottom,15)

            }
        }

        
    }
}

#Preview {
    /*
    @State var listTasks:[Task] = [
        Task(id: 1, title: "Satu", desc: "Sing penting satu wis satu", deadline: Date()),
        Task(id: 2, title: "Dua", desc: "Sing penting dua wis dua", deadline: Date())
    ]
    */
    
    
    Home(dataTasks : ContentView().$listTasks, bgColor:ContentView().$bgColor)
}
