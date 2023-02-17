//
//  AnimatedGradients.swift
//  TrialrApp
//
//  Created by Ocean on 2/16/23.
//
// https://www.appcoda.com/animate-gradient-swiftui/
// Resource 2: https://gist.github.com/amannayak0007/e8fb74843ba6b4ed64c3761777fd8a01
// Resource 3: https://www.cephalopod.studio/blog/swiftui-aurora-background-animation
//

import SwiftUI

struct GradientView: View { //AnimationView Original
    @State private var animateGradient = false
    @State private var version: Int = 4
    var body: some View {
        
        if version == 1 {
            LinearGradient(colors: [.blue, .white, .blue], startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing)
                .blur(radius: 50)
                .ignoresSafeArea()
                //.hueRotation(.degrees(0))
                .hueRotation(.degrees(animateGradient ? 45 : 0))
                .onAppear {
                    withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: false)) {
                        animateGradient.toggle()
                    }
                }
        } else if version == 2 {
            RadialGradient(colors: [.purple, .yellow], center: .center, startRadius: animateGradient ? 400 : 200, endRadius: animateGradient ? 20 : 40)
                .ignoresSafeArea()
                .onAppear {
                    withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()
                    }
                }
        } else if version == 3 {
            ZStack {
                LinearGradient(colors: [.blue, .white, .blue, .white, .blue], startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing).blur(radius: 50) //startPoint: .topLeading, endPoint: .bottomTrailing)
                    .hueRotation(.degrees(animateGradient ? 45 : 0))
                    .ignoresSafeArea()
                    .onAppear {
                        withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                    }
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 350)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .cornerRadius(30)
                    .padding()
            }
        } else if version == 4 {
            ZStack {
                AnimatedGradientView()
            }
        }
    }
}

//MARK: - Animated Gradient View

struct AnimatedGradientView: View {
    @State private var progress: CGFloat = 0
    let gradient1 = Gradient(colors: [.white, .blue])
    let gradient2 = Gradient(colors: [.blue, .white])
 
    var body: some View {
 
        Rectangle()
            .animatableGradient(fromGradient: gradient1, toGradient: gradient2, progress: progress)
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: true)) {
                    self.progress = 1.0
                }
            }
    }
}





//MARK: - Gradient to Gradient Transform Requirements




struct AnimatableGradientModifier: AnimatableModifier {
    let fromGradient: Gradient
    let toGradient: Gradient
    var progress: CGFloat = 0.0
 
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
 
    func body(content: Content) -> some View {
        var gradientColors = [Color]()
 
        for i in 0..<fromGradient.stops.count {
            let fromColor = UIColor(fromGradient.stops[i].color)
            let toColor = UIColor(toGradient.stops[i].color)
 
            gradientColors.append(colorMixer(fromColor: fromColor, toColor: toColor, progress: progress))
        }
 
        return LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
 
    func colorMixer(fromColor: UIColor, toColor: UIColor, progress: CGFloat) -> Color {
        guard let fromColor = fromColor.cgColor.components else { return Color(fromColor) }
        guard let toColor = toColor.cgColor.components else { return Color(toColor) }
 
        let red = fromColor[0] + (toColor[0] - fromColor[0]) * progress
        let green = fromColor[1] + (toColor[1] - fromColor[1]) * progress
        let blue = fromColor[2] + (toColor[2] - fromColor[2]) * progress
 
        return Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
}


extension View {
    func animatableGradient(fromGradient: Gradient, toGradient: Gradient, progress: CGFloat) -> some View {
        self.modifier(AnimatableGradientModifier(fromGradient: fromGradient, toGradient: toGradient, progress: progress))
    }
}



//MARK: - Problematic Gradient, Resource 2
//https://gist.github.com/amannayak0007/e8fb74843ba6b4ed64c3761777fd8a01

/*
 //has problems, but maybe can be solved using withAnimation?
struct AnimatedView: View {
    var body: some View {
        AnimatedBackground().edgesIgnoringSafeArea(.all)
            .blur(radius: 50)
    }
}
struct AnimatedBackground: View {
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors = [Color.blue, Color.red, Color.purple, Color.pink, Color.yellow, Color.green, Color.orange]
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
            .animation(Animation.easeInOut(duration: 6).repeatForever())
            .onReceive(timer, perform: { _ in
                self.start = UnitPoint(x: 4, y: 0)
                self.end = UnitPoint(x: 0, y: 2)
                self.start = UnitPoint(x: -4, y: 20)
                self.start = UnitPoint(x: 4, y: 0)
            })
    }
}
*/
