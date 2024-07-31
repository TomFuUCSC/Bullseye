//
//  Game.swift
//  Bullseye
//
//  Created by Tom Fu on 6/26/23.
//

import Foundation

struct Game{
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init( loadTestData: Bool = false){
        if loadTestData{
            addToLeaderboard(score: 80)
            addToLeaderboard(score: 200)
            addToLeaderboard(score: 50)
            addToLeaderboard(score: 40)
            addToLeaderboard(score: 77)
        }
    }
    
    
    func points(sliderValue: Int) -> Int{
        let difference = abs((target - sliderValue))
        let bonus: Int
        
        if difference == 0{
            bonus = 100
        }else if difference <= 2{
            bonus = 50
        }else{
            bonus = 0
        }
        
        return 100 - difference + bonus
        //return 999
    }
    
    mutating func startNewRound(points: Int){
        addToLeaderboard(score: points)
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart(){
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
    mutating func addToLeaderboard(score: Int){
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries.sort { entry1, entry2 in
            entry1.score > entry2.score
        }
        
    }
}

struct LeaderboardEntry{
    let score: Int
    let date: Date
}
