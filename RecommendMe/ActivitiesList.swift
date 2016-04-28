//
//  ActivitiesList.swift
//  RecommendMe
//
//  Created by Ryan Linehan on 4/28/16.
//  Copyright © 2016 Team Recommend. All rights reserved.
//

import UIKit

class ActivitiesList: NSObject {
    override init() {}
    
    class func attractionsList() -> [[String:String]]
    {
        return [["name" : "Amusement Parks", "code": "amusementparks"],
                ["name" : "Aquariums", "code": "aquariums"],
                ["name" : "Arcades", "code": "arcades"],
                ["name" : "Art Galleries", "code": "galleries"],
                ["name" : "Casinos", "code": "casinos"],
                ["name" : "Go Karts", "code": "gokarts"],
                ["name" : "Horse Racing", "code": "horseracing"],
                ["name" : "Laser Tag", "code": "lasertag"],
                ["name" : "Mini Golf", "code": "mini_golf"],
                ["name" : "Museums", "code": "museums"],
                ["name" : "Paintball", "code": "paintball"],
                ["name" : "Skating Rinks", "code": "skatingrinks"],
                ["name" : "Trampoline Parks", "code": "trampoline"],
                ["name" : "Zoos", "code": "zoos"]]
    }
    class func beautyList()->[[String:String]]
    {
        //Beauty and Spas
        return [["name" : "Day Spas", "code": "spas"],
                ["name" : "Massage", "code": "massage"],
                ["name" : "Piercing", "code": "piercing"],
                ["name" : "Tanning", "code": "tanning"],
                ["name" : "Tattoo", "code": "tattoo"]]
        
    }
    class func entertainmentList()->[[String:String]]
    {
        //Entertainment
        return [["name" : "Festivals", "code": "festivals"],
                ["name" : "Movies", "code": "movietheatres"],
                ["name" : "Music Venues", "code": "musicvenues"],
                ["name" : "Opera & Ballet", "code": "opera"],
                ["name" : "Theater", "code": "theater"],
                ["name" : "Race Tracks", "code": "racetracks"],
                ["name" : "Social Clubs", "code": "social_clubs"],
                ["name" : "Wineries", "code": "wineries"]]
        
    }
    class func extremeList()->[[String:String]]
    {
        //Extreme/Great Outdoors
        return [["name" : "Climbing", "code": "climbing"],
                ["name" : "Hang Gliding", "code": "hanggliding"],
                ["name" : "Hiking", "code": "hiking"],
                ["name" : "Hot Air Balloons", "code": "hot_air_balloons"],
                ["name" : "Mountain Biking", "code": "mountainbiking"],
                ["name" : "Rafting/Kayaking", "code": "rafting"],
                ["name" : "Skydiving", "code": "skydiving"]]
    }
    class func landmarksList()->[[String:String]]
    {
        return [["name" : "Landmarks", "code": "landmarks"]]
    }
    class func nightlifeList()->[[String:String]]
    {
        return  [["name" : "Champagne Bars", "code": "champagne_bars"],
                 ["name" : "Cocktail Bars", "code": "cocktailbars"],
                 ["name" : "Comedy Clubs", "code": "comedyclubs"],
                 ["name" : "Country Dance Halls", "code": "countrydancehalls"],
                 ["name" : "Dance Clubs", "code": "danceclubs"],
                 ["name" : "Dive Bars", "code": "divebars"],
                 ["name" : "Gay Bars", "code": "gaybars"],
                 ["name" : "Hookah Bars", "code": "hookah_bars"],
                 ["name" : "Jazz & Blues", "code": "jazzandblues"],
                 ["name" : "Karaoke", "code": "karaoke"],
                 ["name" : "Lounges", "code": "lounges"],
                 ["name" : "Piano Bars", "code": "pianobars"],
                 ["name" : "Pool Halls", "code": "poolhalls"],
                 ["name" : "Pubs", "code": "pubs"],
                 ["name" : "Sports Bars", "code": "sportsbars"],
                 ["name" : "Wine Bars", "code": "wine_bars"]]
    }
    class func parksList()->[[String:String]]
    {
        return [["name" : "Playgrounds", "code": "playgrounds"],
                ["name" : "Skate Parks", "code": "skate_parks"]]
    }
    class func petsList()->[[String:String]]
    {
        return [["name" : "Animal Parks", "code": "dog_parks"],
                ["name" : "Animal Shelters", "code": "animalshelters"]]
    }
    class func profSportsList()->[[String:String]]
    {
        return [["name" : "Amateur Sports Teams", "code": "amateursportsteams"],
                ["name" : "Professional Sports Teams", "code": "sportsteams"],
                ["name" : "Stadiums & Arenas", "code": "stadiumsarenas"]]
    }
    class func sportsList()->[[String:String]]
    {
        return [["name" : "Archery", "code": "archery"],
                ["name" : "Badminton", "code": "badminton"],
                ["name" : "Basketball Courts", "code": "basketballcourts"],
                ["name" : "Batting Cages", "code": "battingcages"],
                ["name" : "Bike Rentals", "code": "bikerentals"],
                ["name" : "Boating", "code": "boating"],
                ["name" : "Bowling", "code": "bowling"],
                ["name" : "Disc Golf", "code": "discgolf"],
                ["name" : "Golf", "code": "golf"],
                ["name" : "Gun/Rifle", "code": "gun_ranges"],
                ["name" : "Gymnastics", "code": "gymnastics"],
                ["name" : "Horseback Riding", "code": "horsebackriding"],
                ["name" : "Rock Climbing", "code": "rock_climbing"],
                ["name" : "Soccer", "code": "football"],
                ["name" : "Squash", "code": "squash"],
                ["name" : "Tennis", "code": "tennis"],
                ["name" : "Yoga", "code": "yoga"]]
    }
    class func waterList()->[[String:String]]
    {
        return [["name" : "Beaches", "code": "beaches"],
                ["name" : "Fishing", "code": "fishing"],
                ["name" : "Kiteboarding", "code": "kiteboarding"],
                ["name" : "Lakes", "code": "lakes"],
                ["name" : "Paddleboarding", "code": "paddleboarding"],
                ["name" : "Scuba Diving", "code": "scuba"],
                ["name" : "Surfing", "code": "surfing"],
                ["name" : "Swimming Pools", "code": "swimmingpools"],
                ["name" : "Tubing", "code": "tubing"]]
    }
    class func bigActivities() -> [[String:String]]
    {
        return [["name" : "Attractions", "code": "0"],
                ["name" : "Beauty and Spas", "code": "1"],
                ["name" : "Entertainment", "code": "2"],
                ["name" : "Great Outdoors/Extreme", "code": "3"],
                ["name" : "Landmarks/Historical Buildings", "code": "4"],
                ["name" : "Nightlife", "code": "5"],
                ["name" : "Parks", "code": "6"],
                ["name" : "Pets", "code": "7"],
                ["name" : "Professional Sporting Events", "code": "8"],
                ["name" : "Sports", "code": "9"],
                ["name" : "Water Activities", "code": "10"]]
    }
    
    class func allActivitiesCategories() -> [[String:String]] {
        return [["name" : "Amusement Parks", "code": "amusementparks"],
                ["name" : "Aquariums", "code": "aquariums"],
                ["name" : "Arcades", "code": "arcades"],
                ["name" : "Art Galleries", "code": "galleries"],
                ["name" : "Casinos", "code": "casinos"],
                ["name" : "Go Karts", "code": "gokarts"],
                ["name" : "Horse Racing", "code": "horseracing"],
                ["name" : "Laser Tag", "code": "lasertag"],
                ["name" : "Mini Golf", "code": "mini_golf"],
                ["name" : "Museums", "code": "museums"],
                ["name" : "Paintball", "code": "paintball"],
                ["name" : "Skating Rinks", "code": "skatingrinks"],
                ["name" : "Trampoline Parks", "code": "trampoline"],
                ["name" : "Zoos", "code": "zoos"],
                ["name" : "Day Spas", "code": "spas"],
                ["name" : "Massage", "code": "massage"],
                ["name" : "Piercing", "code": "piercing"],
                ["name" : "Tanning", "code": "tanning"],
                ["name" : "Tattoo", "code": "tattoo"],
                ["name" : "Festivals", "code": "festivals"],
                ["name" : "Movies", "code": "movietheatres"],
                ["name" : "Music Venues", "code": "musicvenues"],
                ["name" : "Opera & Ballet", "code": "opera"],
                ["name" : "Theater", "code": "theater"],
                ["name" : "Race Tracks", "code": "racetracks"],
                ["name" : "Social Clubs", "code": "social_clubs"],
                ["name" : "Wineries", "code": "wineries"],
                ["name" : "Climbing", "code": "climbing"],
                ["name" : "Hang Gliding", "code": "hanggliding"],
                ["name" : "Hiking", "code": "hiking"],
                ["name" : "Hot Air Balloons", "code": "hot_air_balloons"],
                ["name" : "Mountain Biking", "code": "mountainbiking"],
                ["name" : "Rafting/Kayaking", "code": "rafting"],
                ["name" : "Skydiving", "code": "skydiving"],
                ["name" : "Landmarks", "code": "landmarks"],
                ["name" : "Champagne Bars", "code": "champagne_bars"],
                ["name" : "Cocktail Bars", "code": "cocktailbars"],
                ["name" : "Comedy Clubs", "code": "comedyclubs"],
                ["name" : "Country Dance Halls", "code": "countrydancehalls"],
                ["name" : "Dance Clubs", "code": "danceclubs"],
                ["name" : "Dive Bars", "code": "divebars"],
                ["name" : "Gay Bars", "code": "gaybars"],
                ["name" : "Hookah Bars", "code": "hookah_bars"],
                ["name" : "Jazz & Blues", "code": "jazzandblues"],
                ["name" : "Karaoke", "code": "karaoke"],
                ["name" : "Lounges", "code": "lounges"],
                ["name" : "Piano Bars", "code": "pianobars"],
                ["name" : "Pool Halls", "code": "poolhalls"],
                ["name" : "Pubs", "code": "pubs"],
                ["name" : "Sports Bars", "code": "sportsbars"],
                ["name" : "Wine Bars", "code": "wine_bars"],
                ["name" : "Playgrounds", "code": "playgrounds"],
                ["name" : "Skate Parks", "code": "skate_parks"],
                ["name" : "Animal Parks", "code": "dog_parks"],
                ["name" : "Animal Shelters", "code": "animalshelters"],
                ["name" : "Amateur Sports Teams", "code": "amateursportsteams"],
                ["name" : "Professional Sports Teams", "code": "sportsteams"],
                ["name" : "Stadiums & Arenas", "code": "stadiumsarenas"],
                ["name" : "Archery", "code": "archery"],
                ["name" : "Badminton", "code": "badminton"],
                ["name" : "Basketball Courts", "code": "basketballcourts"],
                ["name" : "Batting Cages", "code": "battingcages"],
                ["name" : "Bike Rentals", "code": "bikerentals"],
                ["name" : "Boating", "code": "boating"],
                ["name" : "Bowling", "code": "bowling"],
                ["name" : "Disc Golf", "code": "discgolf"],
                ["name" : "Golf", "code": "golf"],
                ["name" : "Gun/Rifle", "code": "gun_ranges"],
                ["name" : "Gymnastics", "code": "gymnastics"],
                ["name" : "Horseback Riding", "code": "horsebackriding"],
                ["name" : "Rock Climbing", "code": "rock_climbing"],
                ["name" : "Soccer", "code": "football"],
                ["name" : "Squash", "code": "squash"],
                ["name" : "Tennis", "code": "tennis"],
                ["name" : "Yoga", "code": "yoga"],
                ["name" : "Beaches", "code": "beaches"],
                ["name" : "Fishing", "code": "fishing"],
                ["name" : "Kiteboarding", "code": "kiteboarding"],
                ["name" : "Lakes", "code": "lakes"],
                ["name" : "Paddleboarding", "code": "paddleboarding"],
                ["name" : "Scuba Diving", "code": "scuba"],
                ["name" : "Surfing", "code": "surfing"],
                ["name" : "Swimming Pools", "code": "swimmingpools"],
                ["name" : "Tubing", "code": "tubing"]]
    }


    
}
