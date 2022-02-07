//
//  utils.swift
//  TickTacToe by Navy
//
//  Created by Navy on 08/02/22.
//



import Foundation

// this func takes a list of type string and letter of type string and -> means
//it will return to us a boolean

func checkwinner(list: [String], letter: String) -> Bool{
    
    
    let winningsequences = [
        [0,1,2], [3,4,5], [6,7,8],  //rows
        [0,4,8], [2,4,6],   //diagonal
        [0,3,6], [1,4,7], [2,5,8]  //vertical
    ]
    for sequence in winningsequences{
        var score = 0
        
        for match in sequence{  //here match is the index in thise arrays of winning sequences
            if list[match] == letter {
                score += 1
                
                if score == 3 {
                    return true  //incase bot or player won
                }
            }
        }
    }
return false //incase its a draw 
}
