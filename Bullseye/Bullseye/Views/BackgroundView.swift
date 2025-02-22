//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Tom Fu on 7/6/23.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct TopView: View {
    @State private var leaderboardIsShowing = false
    @Binding var game: Game
    var body: some View {
        HStack {
            Button {
                game.restart()
            } label: {
                RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button {
                leaderboardIsShowing = true
            } label: {
                RoundedImageViewStroked(systemName: "list.dash")
            }
            .sheet(isPresented: $leaderboardIsShowing){
                LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
            }
        }
    }
}

struct NumberView: View{
    var title: String
    var text: String
    var body: some View{
        VStack{
            LabelText(text: title)
            RoundedRectTextView(text: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct RingsView: View{
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            ForEach(1..<6){ ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme ==  .dark ? 0.1: 0.3
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(0.8 * opacity), Color("RingsColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300))
                    .frame(width: size, height: size)
                
            }
            
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
            .previewInterfaceOrientation(.landscapeRight)
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(.dark)
    }
}
