//
//  ContentView.swift
//  HellowSwiftUI
//
//  Created by 青木優太 on 2020/07/07.
//  Copyright © 2020 okiuta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let piece = [" ", "X", "O"]
    @State var board = [[0,0,0],[0,0,0],[0,0,0]]
    @State var active = true
    @State var Winner = 0
    @State var judge = false
    @State var coma = 1
    
    var body: some View {
        VStack{
            Text(piece[coma] + "の番")
            Spacer()
            ForEach((0...2), id:\.self){
                j in
                HStack(spacing:0){
                    ForEach((0...2), id:\.self){
                        i in
                        self.getAt(j:j, i:i).frame(width: 75.0, height: 75.0).border(Color.black, width: 1).foregroundColor(Color.blue).frame(width: 80, height:80)
                    }
                }
            }
            

//            HStack{
//                self.getAt(j:2, i:0).frame(width: 75.0, height: /*@START_MENU_TOKEN@*/75.0/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//                self.getAt(j:2, i:1).frame(width: 75.0, height: /*@START_MENU_TOKEN@*/75.0/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//                self.getAt(j:2, i:2).frame(width: 75.0, height: /*@START_MENU_TOKEN@*/75.0/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//            }.frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
        Spacer()
            resetBtn()
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        
            if judge{
                Text(piece[Winner] + "の勝ち")
            }else{
                Text("")
            }
        }.font(.largeTitle)
    }
    
    private func resetBtn() -> Button<Text>{
        return Button(action:{
            self.board = [[0,0,0],[0,0,0],[0,0,0]]
            self.active = true
            self.Winner = 0
            self.judge = false
            self.coma = 1
        }){
            Text("Reset")
        }
    }
    
    private func checkBoard(){
        for i in 0...2{
            if self.board[i][0]==self.board[i][1] && self.board[i][1]==self.board[i][2] && self.board[i][0] != 0{
                self.Winner = self.board[i][0]
                self.judge = true
                self.active = false
            }
        }
        
        for i in 0...2{
            if self.board[0][i]==self.board[1][i] && self.board[1][i]==self.board[2][i] && self.board[0][i] != 0{
                self.Winner = self.board[0][i]
                self.judge = true
                self.active = false
            }
        }
        
        if self.board[0][0] == self.board[1][1] &&
            self.board[1][1] == self.board[2][2] &&
            self.board[0][0] != 0{
            self.Winner = self.board[0][0]
            self.judge = true
            self.active = false
        }
        
        if self.board[2][0] == self.board[1][1] &&
            self.board[1][1] == self.board[0][2] &&
            self.board[1][1] != 0{
            self.Winner = self.board[1][1]
            self.judge = true
            self.active = false
        }
    }

    private func getAt(j:Int, i:Int) -> Button<Text>{
        return Button(action:{
            if self.active && self.board[j][i] == 0{
                self.board[j][i] = self.coma
                self.coma = 3 - self.coma
                self.checkBoard()
            }
        }){
            Text(self.piece[self.board[j][i]])
                
            }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
