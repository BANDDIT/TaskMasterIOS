//
//  Tester.swift
//  TaskMaster
//
//  Created by Arrick Russell Adinoto on 04/04/24.
//

import SwiftUI

struct Tester: View {
    
    @State var angka:Int
    
    init(){
        if let savedAngka = UserDefaults.standard.value(forKey:"angka"){
            angka=savedAngka as! Int
        }
        else{
            angka=0
        }
    }
    
    var body: some View {
        /*
        VStack{
            Text(String(angka))
            Button("Button"){
                angka=angka+1
                UserDefaults.standard.set(angka,forKey:"angka")
            }
        }
        */
        ZStack{
            VStack{
                
            }.frame(width:100, height:100)
                .background(.red)
            
            VStack{
                
            }.frame(width:50, height:50)
                .background(.green)
        }
    }
}

#Preview {
    Tester()
}
