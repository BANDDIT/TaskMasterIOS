//
//  AddTask.swift
//  TaskMaster
//
//  Created by Arrick Russell Adinoto on 12/04/24.
//

import SwiftUI

struct AddTask: View {
    
    @State var title:String=""
    @State var desc:String=""
    @State var deadline:Date=Date()
    
    @State var str:String="Add Task"
    @State var showAlert:Bool=false
    
    //var isCharTooMuch:Bool=false
    //var isAllFill:Bool=false
    @State var isTitleEmpty:Bool = false
    @State var isDescEmpty:Bool = false
    @State var isDeadlineIllegal:Bool = false
    
    @Binding var dataTasks:[Task]
    @Binding var bgColor:Color

    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header:Text("Task Detail").fontWeight(.bold)){
                        TextField("Task Title",text:$title)
                        TextField("Task Description",text:$desc)
                        DatePicker("Deadline", selection: $deadline, displayedComponents: [.date, .hourAndMinute]).foregroundColor(.gray)
                    }
         
                    Button(action:{
                        //str="Add Task 3"
                        showAlert.toggle()
                        
                        isTitleEmpty=false
                        isDescEmpty=false
                        isDeadlineIllegal=false
                        
                        let titleTrim=title.trimmingCharacters(in: .whitespaces)
                        let descTrim=desc.trimmingCharacters(in: .whitespaces)
                        
                        
                        let formatter=DateFormatter()
                        formatter.dateStyle = .medium
                        formatter.timeStyle = .short
                        let dateFormatted = formatter.string(from:deadline)
                        let currentDate=formatter.string(from:Date())
                        
                        if(titleTrim.count==0){
                            isTitleEmpty=true
                        }
                        else if(descTrim.count==0){
                            isDescEmpty=true
                        }
                        else if(dateFormatted<=currentDate){
                            isDeadlineIllegal=true
                        }
                        //print(deadline)
                        //print(dateFormatted)
                    
                        
                    }){
                        Text("Submit")
                            .fontWeight(.bold)
                            .frame(width:300, height:40, alignment:.center)
                            .background(bgColor)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    .alert(isPresented: $showAlert, content: {
                        if(isTitleEmpty){
                            Alert(title: Text("Unable to Add Task"),message:Text("Task title must be filled."))
                            
                        }
                        else if(isDescEmpty){
                            Alert(title: Text("Unable to Add Task"),message:Text("Task description must be filled."))
                        }
                        else if(isDeadlineIllegal){
                            Alert(title: Text("Unable to Add Task"),message:Text("Cannot adding a deadline which is earlier or same to the current date."))
                        }
                        else{
                            Alert(title: Text("Success"),message:Text("Your list data has been updated!"),dismissButton:.default(Text("OK")){
                                    var taskId:Int=1
                                
                                    if dataTasks.count>0{
                                        taskId=dataTasks[dataTasks.count-1].id+1
                                    }
                                
                                    let task:Task=Task(id:taskId,title:self.title, desc:self.desc,deadline:deadline)
                            
                                    dataTasks.append(task)
                                
                                    title=""
                                    desc=""
                                    deadline=Date()
                                
                                do{
                                    let encoder = JSONEncoder()
                                    let tasksData = try encoder.encode(dataTasks)
                                    UserDefaults.standard.set(tasksData, forKey: "listTasks")
                                }catch{
                                    print("Error Data")
                                }
                            //UserDefaults.standard.set(dataTasks,forKey:"listTasks")
                           //UserDefaults.standard.set(dataTasks,forKey:"listTasks")
                                    //Add Task to Database
                                }
                            )
                        }
                    })
                    .frame(width:340, alignment:.center)
                }

            }
        }
        .navigationBarTitle(str)
        
    }
}

#Preview {
    AddTask(dataTasks: ContentView().$listTasks, bgColor:ContentView().$bgColor)
}
