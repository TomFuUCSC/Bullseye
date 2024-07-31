//
//  TextViews.swift
//  Bullseye
//
//  Created by Tom Fu on 7/1/23.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(10.0)
            .font(.footnote)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct LabelText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .font(.caption)
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12)
    }
}
struct ButtonText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color("AccentColor")
            )
            .foregroundColor(.white)
            .cornerRadius(12)
    }
}

struct ScoreText: View {
    var score: Int
    var body: some View {
        Text(String(score))
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            
    }
}

struct DateText: View {
    var date: Date
    var body: some View {
        Text(date, style: .time)
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigBoldText: View {
    let text: String
    var body: some View {
        Text(text.uppercased())
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .fontWeight(.black)
            .kerning(2)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            
            BigBoldText(text: "leaderboard")
            InstructionText(text: "Instructions")
            BigNumberText(text: "50")
            SliderLabelText(text: "999")
            LabelText(text: "Score")
            BodyText(text: "You scored 200 points\n 🗿🗿🗿")
            ButtonText(text: "Start New Round")
            ScoreText(score: 459)
            DateText(date: Date())
            
        }
        .padding()
    }
}
