//
//  ContentView.swift
//  Shared
//
//  Created by Vaibhav Srivastava on 08/03/22.
//

import SwiftUI

struct ContentView : View{
    @State var emojis = ["🤣","🤤","😀","😎","🐹","🦊","🤨","😜","😇"]
    @State var emojiCount = 3
    var body: some View{
        VStack {
            HStack{
                ForEach(emojis[0..<emojiCount], id: \.self){emoji in
                    CardView(content: emoji )
                }
                Spacer()
                Group {
                    VStack{
                        add
                        Spacer()
                        remove
                    }
                } .padding(.vertical)
                
            }
            .padding(.horizontal)
            .foregroundColor(.red)
        }
    }
    var add : some View {
        Button(action: {emojiCount += 1 }, label: {
            HStack{
   //             Text("Add Card")
                Image(systemName: "plus.circle")
                
            }
        })
    }
    var remove : some View{
        Button(action: {emojiCount -= 1}, label: {
            HStack{
              //  Text("Remove Card")
                Image(systemName: "minus.circle")

            }
        })
    }
}




struct CardView : View {
    var content : String
    @State var isfaceup = true
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isfaceup == false {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 4)
                Text(content).font(.largeTitle)
            } else{
                shape.fill()
            }
        }
        .onTapGesture{
            isfaceup = !isfaceup
        }
        
    }
    
}

