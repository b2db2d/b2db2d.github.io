import SwiftUI

struct ColorView: View {
    var body: some View {
        AnimatedBackground().edgesIgnoringSafeArea(.all)
            .blur(radius: 60)
            
            
            
    }
}

struct AnimatedBackground: View {
    @State var start = UnitPoint(x: 5, y: 0.1)
    @State var end = UnitPoint(x: 1, y: -5)
//    @State var opacity = 0.1
    @State var opacity = Double.random(in: 0.5...1)
    @State var duration = 10.0
    @State var location = 0.0
    var randomDouble = Double.random(in: 0...1)
    
    let timer = Timer.publish(every: 0.6, on: .main, in: .default).autoconnect()
    let colors = [Color.blue, Color.red, Color.purple, Color.pink, Color.yellow, Color.green, Color.cyan]
    let isZoomed = true
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: colors), startPoint: end, endPoint: start)
            .scaleEffect(isZoomed ? 2 : 1)
            .animation(.elasticEaseInEaseOut(duration: duration), value: isZoomed)
        
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
            .scaleEffect(isZoomed ? 2 : 1)
            .opacity(opacity)
            .animation(.elasticEaseInEaseOut(duration: duration), value: isZoomed)
            .onReceive(timer, perform: { _ in
                withAnimation{
                    self.start = UnitPoint(x: randomDouble, y: randomDouble)
                    self.end = UnitPoint(x: Double.random(in: 0...1), y: Double.random(in: 0...1))
                    self.opacity = Double.random(in: 0.7...1)
//                    self.opacity = self.opacity == 1.0 ? 0.0 : 1.0
                    let time = Date().timeIntervalSince1970
                    self.duration = log(time - floor(time) + 1)
                    self.location = Double.random(in: 0...1)
                    
                    
                }
            })
            
    }
}


struct ElasticEaseInEaseOutAnimation: CustomAnimation {
    let duration: TimeInterval


    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        if time > duration { return nil } // The animation has finished.


        let p = time / duration
        let s = sin((20 * p - 11.125) * ((2 * Double.pi) / 4.5))
        if p < 0.5 {
            return value.scaled(by: -(pow(2, 20 * p - 10) * s) / 2)
        } else {
            return value.scaled(by: (pow(2, -20 * p + 10) * s) / 2 + 1)
        }
    }
}

extension Animation {
    static var elasticEaseInEaseOut: Animation {
        elasticEaseInEaseOut(duration: 5.8)
    }

    static func elasticEaseInEaseOut(duration: TimeInterval) -> Animation {
        Animation(ElasticEaseInEaseOutAnimation(duration: duration))
    }
}




#Preview(windowStyle: .automatic) {
    ColorView()
}
