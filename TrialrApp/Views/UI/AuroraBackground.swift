//
//  AuroraBackground.swift
//  TrialrApp
//
//  Created by Ocean on 2/16/23.
//https://www.reddit.com/r/iOSProgramming/comments/r6hdv7/issues_with_swiftui_in_existing_project/
//https://www.cephalopod.studio/blog/swiftui-aurora-background-animation
//
//
//


import SwiftUI
import Charts


struct AuroraView: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.colorScheme) var scheme
    var testReduceTransparency = false
    var testDifferentiateWithoutColor = false

    var body: some View {
        if differentiateWithoutColor || testDifferentiateWithoutColor {
            AuroraTheme.differentiateWithoutColorBackground(forScheme: scheme)
                .ignoresSafeArea()
        } else {
            if reduceTransparency || testReduceTransparency {
                LinearNonTransparency()
            } else {
                FloatingBubbles()
            }
        }
    }
    
}



struct LinearNonTransparency: View {
    @Environment(\.colorScheme) var scheme
    var gradient: Gradient {
        Gradient(colors: [AuroraTheme.ellipsesTopLeading(forScheme: scheme), AuroraTheme.ellipsesTopTrailing(forScheme: scheme)])
    }

    var body: some View {
        LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}


struct AuroraTheme {
    static var generalBackground: Color {
        //Color(red: 0.043, green: 0.467, blue: 0.494)
        Color(.systemBlue)
    }

    static func ellipsesTopLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color(.white)//Color(red: 0.039, green: 0.388, blue: 0.502, opacity: 0.81)
        let dark = Color.blue //Color(red: 0.000, green: 0.176, blue: 0.216, opacity: 80.0)
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }

    static func ellipsesTopTrailing(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 0.196, green: 0.796, blue: 0.329, opacity: 0.5)
        let dark = Color(red: 0.408, green: 0.698, blue: 0.420, opacity: 0.61)
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }

    static func ellipsesBottomTrailing(forScheme scheme: ColorScheme) -> Color {
        Color(red: 0.541, green: 0.733, blue: 0.812, opacity: 0.7)
    }

    static func ellipsesBottomLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 0.196, green: 0.749, blue: 0.486, opacity: 0.55)
        let dark = Color(red: 0.525, green: 0.859, blue: 0.655, opacity: 0.45)
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }


    static func differentiateWithoutColorBackground(forScheme scheme: ColorScheme) -> Color {
        let any = Color(white: 0.95)
        let dark = Color(white: 0.2)
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }
}



class BubblesProvider: ObservableObject {
    let offset: CGSize
    let frameHeightRatio: CGFloat

    init() {
        frameHeightRatio = CGFloat.random(in: 0.7 ..< 1.4)
        offset = CGSize(width: CGFloat.random(in: -150 ..< 150),
                        height: CGFloat.random(in: -150 ..< 150))
    }
}

struct Bubbles: View {
    @StateObject var provider = BubblesProvider()
    @State var move = false
    let proxy: GeometryProxy
    let color: Color
    let rotationStart: Double
    let duration: Double
    let alignment: SwiftUI.Alignment

    var body: some View {
        Circle()
            .fill(color)
            .frame(height: proxy.size.height /  provider.frameHeightRatio)
            .offset(provider.offset)
            .rotationEffect(.init(degrees: move ? rotationStart : rotationStart + 360) )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .opacity(0.8)
            .onAppear {
                withOptionalAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false)) {
                    move.toggle()
                }
            }
    }
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

struct FloatingBubbles: View {
    @Environment(\.colorScheme) var scheme
    let blur: CGFloat = 60

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                AuroraTheme.generalBackground
                ZStack {
                    Bubbles(proxy: proxy,
                          color: AuroraTheme.ellipsesTopLeading(forScheme: scheme),
                          rotationStart: 180,
                          duration: 5,
                          alignment: .topLeading)
                    Bubbles(proxy: proxy,
                          color: AuroraTheme.ellipsesBottomTrailing(forScheme: scheme),
                          rotationStart: 0,
                          duration: 10,
                          alignment: SwiftUI.Alignment(horizontal: .leading, vertical: .bottom))
                    Bubbles(proxy: proxy,
                          color: AuroraTheme.ellipsesTopTrailing(forScheme: scheme),
                          rotationStart: 240,
                          duration: 10,
                          alignment: .topTrailing)
                    Bubbles(proxy: proxy,
                          color: AuroraTheme.ellipsesBottomLeading(forScheme: scheme),
                          rotationStart: 120,
                          duration: 8,
                          alignment: .bottomLeading)
                    Bubbles(proxy: proxy,
                            color: Color.purple,
                          rotationStart: 120,
                          duration: 8,
                          alignment: .bottomLeading)
                    Bubbles(proxy: proxy,
                            color: Color("Deep3"),
                          rotationStart: 180,
                          duration: 5,
                          alignment: .topLeading)
                    Bubbles(proxy: proxy,
                            color: Color("Deep4"),
                    rotationStart: 540,
                            duration: 30,
                            alignment: .topLeading)
                    AnimatedGradientView().opacity(0.4)
                    
                }
                .blur(radius: blur)
            }
            .ignoresSafeArea()
        }
    }
}

//MARK: - Dark

struct DarkAuroraView: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.colorScheme) var scheme
    var testReduceTransparency = false
    var testDifferentiateWithoutColor = false

    var body: some View {
        if differentiateWithoutColor || testDifferentiateWithoutColor {
            DarkAuroraTheme.differentiateWithoutColorBackground(forScheme: scheme)
                .ignoresSafeArea()
        } else {
            if reduceTransparency || testReduceTransparency {
                DarkLinearNonTransparency()
            } else {
                DarkFloatingBubbles()
            }
        }
    }
    
}

struct DarkAuroraTheme {
    static var generalBackground: Color {
        //Color(red: 0.043, green: 0.467, blue: 0.494)
        Color("Deep3")
    }

    static func ellipsesTopLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color.black//Color(red: 0.039, green: 0.388, blue: 0.502, opacity: 0.81)
        let dark = Color.blue //Color(red: 0.000, green: 0.176, blue: 0.216, opacity: 80.0)
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }

    static func ellipsesTopTrailing(forScheme scheme: ColorScheme) -> Color {
        let any = Color.black
        let dark = Color("Deep3")
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }

    static func ellipsesBottomTrailing(forScheme scheme: ColorScheme) -> Color {
        //Color(red: 0.541, green: 0.733, blue: 0.812, opacity: 0.7)
        Color("Deep3")
    }

    static func ellipsesBottomLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color("Deep3") //Color(red: 0.196, green: 0.749, blue: 0.486, opacity: 0.55)
        let dark = Color("Deep3")
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }


    static func differentiateWithoutColorBackground(forScheme scheme: ColorScheme) -> Color {
        let any = Color("Deep3")
        let dark = Color("Deep3")
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }
}


struct DarkFloatingBubbles: View {
    @Environment(\.colorScheme) var scheme
    let blur: CGFloat = 100

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                DarkAuroraTheme.generalBackground
                ZStack {
                    Bubbles(proxy: proxy,
                            color: Color.white,
                          rotationStart: 0,
                          duration: 10,
                          alignment: SwiftUI.Alignment(horizontal: .leading, vertical: .bottom))
                    Bubbles(proxy: proxy,
                            color: Color.blue,
                          rotationStart: 240,
                          duration: 10,
                          alignment: .topTrailing)
                    Bubbles(proxy: proxy,
                            color: Color.purple,
                          rotationStart: 120,
                          duration: 8,
                          alignment: .bottomLeading)
                    Bubbles(proxy: proxy,
                            color: Color("Deep3"),
                          rotationStart: 180,
                          duration: 5,
                          alignment: .topLeading)
                    Bubbles(proxy: proxy,
                            color: Color("Deep4"),
                    rotationStart: 540,
                            duration: 30,
                            alignment: .topLeading)
                    
                }
                .blur(radius: blur)
            }
            .ignoresSafeArea()
        }
    }
}

struct DarkLinearNonTransparency: View {
    @Environment(\.colorScheme) var scheme
    var gradient: Gradient {
        Gradient(colors: [DarkAuroraTheme.ellipsesTopLeading(forScheme: scheme), DarkAuroraTheme.ellipsesTopTrailing(forScheme: scheme)])
    }

    var body: some View {
        LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}
