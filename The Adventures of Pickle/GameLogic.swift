//
//  GameLogic.swift
//  The Adventures of Pickle
//
//  Created by Darien Hallam on 23/8/2024.
//

import Foundation

// Define events
let explorePondEvent = Event(description: "You find a shiny pebble in the pond.")
let exploreForestEvent = Event(description: "You discover a hidden path in the forest.")
let exploreMeadowEvent = Event(description: "You find some delicious berries in the meadow.")


let pond = Location(name: "Pond", description: "You are at a peaceful pond. Ducks are swimming around.", actions: ["explore", "rest", "got to the forest"])
let forest = Location(name: "Forest", description: "You are in a dense forest. The trees are tall and the air is fresh.", actions: ["explore", "rest", "go to the pond"])
let meadow = Location(name: "Meadow", description: "You are in a sunnny meadow. Flowers blooming everywhere.", actions: ["explore", "find food", "got to riverbank"])


func handleUserInput(input: String, currentLocation: Location, storyText: inout String) -> Location {
    var newLocation = currentLocation
    
    if currentLocation.actions.contains(input) {
        switch input {
        case "explore":
            storyText = exploreLocation(location: currentLocation)
        case "swim":
            storyText = "Pickle swims happily in the pond."
        case "rest":
            storyText = "Pickle rests under a tree, enjoying the fresh forest air."
        case "find food":
            storyText = "Pickle finds some tasty seeds in the meadow."
        case "go to the forest":
            newLocation = forest
            storyText = newLocation.description
        case "go to the pond":
            newLocation = pond
            storyText = newLocation.description
        case "go to the riverbank":
            storyText = "Pickle goes to the riverbank. The water is calm and clear."
        default:
            storyText = "Pickle doesn't understand that command."
        }
    } else {
        storyText = "That action isn't available here."
    }
    
    return newLocation
}

func exploreLocation(location: Location) -> String {
    switch location.name {
    case "Pond":
        return explorePondEvent.description
    case "Forest":
        return exploreForestEvent.description
    case "Meadow":
        return exploreMeadowEvent.description
    default:
        return "You explore the area but find nothing of interest."
    }
}
