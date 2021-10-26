//
//  ContentView.swift
//  FizBuzz
//
//  Created by Christopher Yoon on 10/25/21.
//

import SwiftUI

struct ContentView: View {
    
    func fizzBuzz(x: Int) -> String {
        if((x % 3 == 0) && (x % 5 == 0)) {
            return "Fiz Buzz"
        } else if (x % 3 == 0) {
            return "Fiz"
        } else if (x % 5 == 0) {
            return "Buzz"
        } else {
            return String(x)
        }
    }
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var currentNumber = 0
    @State var isCounting = false
    
    var body: some View {
        VStack {
            Text(fizzBuzz(x: currentNumber))
                .font(.system(size: 75))
                .onReceive(timer, perform: { _ in
                    if isCounting {
                        currentNumber += 1
                    }
                })
                .padding()
            Text("\(currentNumber)")
            Button {
                isCounting.toggle()
            } label: {
                Text(isCounting ? "Pause" : "Resume")
                    .frame(width: 100, height: 50)
                    .border(.black, width: 5)
                    .background(isCounting ? Color.red : Color.green)
            }
            Button {
                currentNumber = 0
            } label: {
                Text("Reset")
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
