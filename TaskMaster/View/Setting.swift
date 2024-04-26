//
//  Setting.swift
//  TaskMaster
//
//  Created by Arrick Russell Adinoto on 04/04/24.
//

import SwiftUI

struct Setting: View {
    
    @State static var title:String = "Setting"
    @Binding var bgColor:Color
    @State private var selection: String?
    //@State var notificationTime:Int=0
    @State var chosenTime:String="15 Minute Before"

    let notifyTime=["15 Minute Before", "30 Minute Before","1 Hour Before","3 Hour Before","6 Hour Before","1 Day Before","3 Days Before"]
    
    var body: some View {
        VStack{
            Text(Setting.title)
            Form{
                ColorPicker("Set Color : ",selection:$bgColor)
                Section(header:Text("Prefered Notification Time")){
                    List(notifyTime, id:\.self,selection:$selection){notify in
                        CheckboxWithText(notify:notify, chosenTime:$chosenTime)
                        /*
                        CheckboxWithText(notify: notify,  chosenIndex: $chosenIndex)*/
                    }
                }
            }
        }
    }
}

struct CheckboxWithText : View {
    
    var notify: String
    
    @Binding var chosenTime:String
    //@Binding var chosenIndex:Int
    
    var body: some View {
        Button(action: {
            chosenTime=notify
        }) {
            HStack {
                Text(notify)
                    .foregroundColor(.black)
                Spacer()
                if notify == chosenTime {
                    Image(systemName: "checkmark")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                
            }
        }
    }
}

#Preview {
    Setting(bgColor:ContentView().$bgColor)
}
