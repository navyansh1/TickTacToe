//
//  ContentView.swift
//  TickTacToe by Navy
//
//  Created by Navy on 07/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["","","","","","","","",""]
    @State private var endgametext = "TickTackToe"
    @State private var gameEnded = false
    private var ranges = [(0..<3),(3..<6),(6..<9)]
     
    
    var body: some View {
       
        
        VStack{
            Text(endgametext)
                .alert(endgametext, isPresented: $gameEnded) {
                    Button("Play again! ", role: .destructive, action: resetGame)
                }
                
                .font(.system(size: 30))
                .frame(width: 360, height: 50)
                .foregroundColor(.white)
                .background(LinearGradient(colors: [Color.orange, Color.red], startPoint: .bottom, endPoint: .top))
                .cornerRadius(30)
                .padding(.bottom)
                .font(.system(size: 30))
        
        
        Spacer()
        
            ForEach(ranges, id:\.self) {range in
                HStack{
                    ForEach(range, id:\.self) { i in
                        XObutton(letter: $moves[i])
                        
                            .simultaneousGesture(
                            TapGesture()
                                .onEnded{ _ in
                                    //here we will put the function that takes the input of the player
                                    playertap(index:i)
                                }
                            )
                    }
                }
                .padding(.trailing)
                .padding(.leading)
                .padding(.bottom)
            }
            
            
            
        Spacer()
        
            Button("Reset", action: resetGame)
                .font(.system(size: 25))
                .frame(width: 300, height: 80)
                .foregroundColor(.white)
                .background(LinearGradient(colors: [Color.green, Color.brown], startPoint: .leading, endPoint: .trailing))
                .clipShape(Circle())
                .cornerRadius(50)
                .padding(.bottom)

                  
        Text("Made with love by Navyansh !")
                .font(.title3)
                .italic()
                .bold()
                .frame(width: 320, height: 50)
                .foregroundColor(.white)
                .background(LinearGradient(colors: [Color.orange, Color.teal], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .padding(.top)
        }
        
}

    
    func playertap(index: Int) { //index is of int datatype
        if moves[index] == "" {
            moves[index] = "X"
            botMove()
        }
        
        for i in ["X","O"]{
            if checkwinner(list: moves, letter: i) {
                if (i == "X") {
                    endgametext = "Congrats you won!"
                }
                if (i=="O"){
                    endgametext = " The Bot won! "

                }
                gameEnded = true
                break
            }
        }
    }
   
    
    func botMove(){
        var availablemoves: [Int] = []
        var movesleft = 0
        
        for move in moves{
            if move == "" {
                availablemoves.append(movesleft)
            }
        movesleft += 1
        }
        if availablemoves.count != 0 {
            moves[availablemoves.randomElement()!] = "O" 
        }
    }
    
    
                             
    
    
    func resetGame(){  //this is to reset the game
        endgametext = "TickTackToe"
        moves = ["","","","","","","","",""]
    }
}
   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .background(LinearGradient(colors: [Color.red, Color.teal], startPoint: .trailing, endPoint: .leading))
        
    }
}

