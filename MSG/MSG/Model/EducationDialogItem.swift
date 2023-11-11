//
//  EducationDialogItem.swift
//  MSG
//
//  Created by Triet Le on 11.11.2023.
//

import Foundation

enum EducationDialogItem {
    case milk
    case strawberry
    case water
    case repeatChallenge
}

extension EducationDialogItem {
    var fact: String {
        switch self {
        case .milk:
            "Did you know milk comes from cows, and a single cow can produce about 6 to 7 gallons of milk a day? That's enough to fill up almost 100 glasses! And not just cows, even camels, goats, and reindeers can give milk. Each type of milk is unique and helps baby animals grow strong - just like how these exercises help you!"
        case .strawberry:
            "Wow, jumping made me hungry! Did you know strawberries are the only fruit with seeds on the outside, and it takes about 50 to 75 strawberries to make a pound. And did you know bananas are berries, but strawberries aren't? Plus, apples float in water because they are 25% air!"
        case .water:
            "Great job! Water is amazing, isn't it? It can be liquid, ice or steam. And guess what? The water on Earth today is same water that's been here for millions of years. We're drinking the same water dinosours did!!"
        case .repeatChallenge:
            "Remember that you can repeat this challenge as many times as you want to earn more coins"
        }
    }
}
