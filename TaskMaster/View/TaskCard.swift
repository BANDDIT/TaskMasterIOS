//
//  TaskCard.swift
//  TaskMaster
//
//  Created by Arrick Russell Adinoto on 03/04/24.
//

import SwiftUI

struct TaskCard: View {
    
    @State var isDone = false
    @State var readMore:String = "Read more..."
    @State var cardHeight:CGFloat = 150
    @State var radiusShadow:CGFloat = 5
    
    @Binding var dataTasks:[Task] 
    @Binding var bgColor:Color
    
    var task:Task
    var body: some View {
        VStack(alignment:.leading){
            Spacer()
            HStack{
                VStack(alignment:.leading){
                    Text(task.title)
                        //.font(.title)
                        .font(.custom("New York",size: 25))
                        .fontWeight(.black)
                    Text("Deadline : \(dateToString(dates:task.deadline))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .font(.custom("New York",size: 15))
                }
                Spacer()
                Button(action:{
                    withAnimation(.linear(duration:0.3)){
                        var indexDelete:Int = -1
                        for dataTask in dataTasks {
                            indexDelete+=1
                            if(task.id == dataTask.id){
                                dataTasks.remove(at:indexDelete)
                                break
                            }
                        }
                    }
                    //isDone=true
                    /*
                    DataGetter.deleteData(task:task)
                    */
                    /*
                    ContentView.home.resetData()*/
                }){
                    Image(systemName:"checkmark.circle.fill").resizable().frame(width:40, height:40)
                        .foregroundColor(bgColor)
                     
                }
                .padding(.trailing,20)
            }
            .padding(.leading,15)

            Spacer()

            Text(task.desc)
                .padding(.leading,15)
                .padding(.trailing,15)
                .font(.custom("SF Pro",size: 17))
    
            
            if(task.desc.count > 72){
                Button(action:{
                    withAnimation(.linear(duration:0.2)){
                        if(readMore == "Read more..."){
                            readMore = "Read less..."
                            cardHeight = 200
                            radiusShadow = 15
                        }
                        else{
                            readMore = "Read more..."
                            cardHeight = 150
                            radiusShadow = 5
                        }
                    }

                }){
                    Text("\(readMore)")
                }
                .padding(.leading, 15)
            }
            //.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)

            
            Spacer()
        }
        .frame(width:350, height:self.cardHeight)
        .background(.white)
        .cornerRadius(15)
        .shadow(color:bgColor, radius: self.radiusShadow)
        .transition(.slide)
        
    }
    
    
    func dateToString(dates:Date) -> String{
        let dateFormater=DateFormatter()
        dateFormater.dateFormat = "dd/MMMM/yyyy HH:mm"
        let dateString = dateFormater.string(from:dates)
        return dateString
    }
}

#Preview {
//    TaskCard(task:Task(id: 1, title: "Kerjain PR Math", desc: "llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll", deadline: Date(), status: true))
        //252 karakter
    
    
    TaskCard(dataTasks: ContentView().$listTasks,bgColor:ContentView().$bgColor,task:Task(id: 1, title: "Bikin listing buat besok", desc: "lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll", deadline: Date()))
}
