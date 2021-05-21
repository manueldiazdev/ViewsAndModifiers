//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Manuel Diaz on 4/3/21.
//

import SwiftUI
struct MyTitle: ViewModifier {
    func body(content: Content) -> some View{
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
extension View{
    func titleStyle() -> some View{
        self.modifier(MyTitle())
    }
}

struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
           // .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}
struct ContentView: View {

    
    
    @State private var useRedText = false
    let p1 = Text("My app")
    let p2 = Text("Another app")
    var body: some View {
        VStack{
            VStack{
                Text("MY mod")
                    .modifier(MyTitle())
                Text("Same")
                    .titleStyle()
                Button("Bello"){
                    self.useRedText.toggle()
                }
                .foregroundColor(useRedText ? .red : .blue)
                Text("Hello, world!")
                    //order matters
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red)
                    .edgesIgnoringSafeArea(.all)
            }
            
            //
            VStack{
                Text("Hellosh")
                    //this modifier is added to the environmental modifer instead
                    .blur(radius: 0)
                Text("BELLO")
                p1
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                p2
            }
            //environment modifier
            .font(.title)
            .blur(radius: 2)
            VStack{
                CapsuleText(text: "Hello")
                    .foregroundColor(.black)
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
