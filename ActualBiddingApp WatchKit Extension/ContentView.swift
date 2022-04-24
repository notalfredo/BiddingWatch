//
//  ContentView.swift
//  ActualBiddingApp WatchKit Extension
//
//  Created by Marium Mannan on 4/23/22.
//


import SwiftUI



struct ContentView: View{
    var body: some View {
        NavigationView{
            VStack{
   
                NavigationLink(destination: QuizView()) {
                    Text("Enter Code")
                }
                
                
            
            }
        }
    }
}










struct QuizView: View {
    @State var countDownTimer = 15;
    @State var timeRunning = true;
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var didTap:Bool = false

    @GestureState private var pressed = false
    
    @State private var alertIsPresented = false
    
    var body: some View {
        VStack{
            Button(action:{
                self.didTap = true
                self.alertIsPresented = true
            }){
                Text("A")
            }
            .background(Color.red )
            .opacity(didTap ? 0.5 : 1.0)
            .cornerRadius(30)
            .alert(isPresented: $alertIsPresented, content: {Alert(title: Text("Bid placed"), message: Text("Bid was Successful!"), dismissButton: .default(Text("Got It!")))})
            
            
            
            Button(action:{
            }){
                Text("B")
            }
            .background(Color.green )
            .cornerRadius(30)
            
            
            
            
            Button(action:{

            }){
                Text("C")
            }
            .background(Color.blue )
            .cornerRadius(30)
           
           
            
            
            
            HStack{
                Text("Time Left: \(countDownTimer)")
                    .onReceive(timer) { _ in
                        if countDownTimer > 0 && timeRunning{
                             countDownTimer -= 1
                        } else{
                            timeRunning = false
                        }
                    }
                    .font(.system(size: 12, weight: .bold))
            }
            
        }
       
    }
    
}
struct MyPrimitiveButtonStyle: PrimitiveButtonStyle {

    func makeBody(configuration: PrimitiveButtonStyle.Configuration) -> some View {
        MyButton(configuration: configuration)
    }

    struct MyButton: View {
        @GestureState private var pressed = false

        let configuration: PrimitiveButtonStyle.Configuration
        let color: Color = .green

        @State private var didTriggered = false

        var body: some View {
            // you can set minimumDuration to Double.greatestFiniteMagnitude if you think that
            // user can hold button for such a long time
            let longPress = LongPressGesture(minimumDuration: 300, maximumDistance: 300.0)
                .updating($pressed) { value, state, _ in
                    state = value
                    self.configuration.trigger()
            }

            return configuration.label
                .background(Color.green)
                .opacity(pressed ? 0.5 : 1.0)
                .gesture(longPress)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
