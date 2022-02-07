//
//  XObutton.swift
//  TickTacToe by Navy
//
//  Created by Navy on 07/02/22.
//

import SwiftUI

struct XObutton: View {
    @Binding var letter: String  //is X or O
    @State private var degrees = 0.0
    
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 120, height: 120)
                .foregroundColor(.orange)
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.teal)
            Text(letter)
                .font(.system(size: 60))
                .foregroundColor(.white)
                .bold()
        }
        .rotation3DEffect(.degrees(degrees), axis: (x: 1, y: 0, z: 0))
        .simultaneousGesture(
            TapGesture ()
                .onEnded({ _ in
                    withAnimation(.easeIn(duration: 0.35)){
                        self.degrees -= 180
                    }
                    
                }))
    }
}

struct XObutton_Previews: PreviewProvider {
    static var previews: some View {
        XObutton(letter: .constant("X"))
    }
}
