//
//  MenuButtonView.swift
//  TrialrApp
//
//  Created by Tomer Zilbershtein on 2/16/23.
//

import SwiftUI

enum MenuState {
    case button, menu, surprise
}

//MARK: MenuButton
struct MenuButtonView: View {
    @Binding var appState: AppState
    @State var menuState: MenuState
    
    var body: some View {
        switch menuState {
        case .button:
            FloatingButtonView()
        case .menu:
            FloatingMenuView(menuState: $menuState, appState: $appState)
        case .surprise:
            Text("Surprise!")
        }
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView(appState: Binding.constant(.saved), menuState: .button)
    }
}

//MARK: Floating Button
struct FloatingButtonView: View {
    
    var body: some View {
        Circle().frame(width: 50, height: 50)
    }
}

//MARK: Floating Menu
struct FloatingMenuView: View {
    @Binding var menuState: MenuState
    @Binding var appState: AppState
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .inset(by: 5)
                .stroke(.ultraThinMaterial, lineWidth: 5)
                .onTapGesture(perform: {menuState = .button})
                .foregroundStyle(.ultraThinMaterial)
                .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
                .padding(.horizontal)
            HStack {
                Spacer()
                HStack {
                    Button {
                        withAnimation {
                            appState = .search
                        }
                    } label: {
                        Image(systemName: "magnifying.glass")
                            .resizable()
                            .frame(maxWidth: 30, maxHeight: 30)
                            .foregroundColor(appState == .search ? .primary : .secondary)
                    }
                }
            }
        }
    }
}




//MARK: Tap Modifier

struct TapAndLongPressModifier: ViewModifier {
  @State private var isLongPressing = false
  let tapAction: (()->())
  let longPressAction: (()->())
  func body(content: Content) -> some View {
    content
      .scaleEffect(isLongPressing ? 0.85 : 1.0)
      .onLongPressGesture(minimumDuration: 0.6, pressing: { (isPressing) in
        withAnimation {
          isLongPressing = isPressing
          print(isPressing)
        }
      }, perform: {
        longPressAction()
      })
      .simultaneousGesture(
        TapGesture()
          .onEnded { _ in
            tapAction()
          }
      )
  }
}
