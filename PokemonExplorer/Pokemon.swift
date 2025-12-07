//
//  Pokemon.swift
//  PokemonExplorer
//

import Foundation

// Pokemon data model
struct Pokemon {
    let number: Int
    let name: String
    let type: String
    let category: String
    let height: String
    let weight: String
    let description: String
    let abilities: String
    let evolution: String
    let imageEmoji: String
    
    init(number: Int, name: String, type: String, category: String, height: String, weight: String, description: String, abilities: String, evolution: String, imageEmoji: String) {
        self.number = number
        self.name = name
        self.type = type
        self.category = category
        self.height = height
        self.weight = weight
        self.description = description
        self.abilities = abilities
        self.evolution = evolution
        self.imageEmoji = imageEmoji
    }
}

// Manages all the pokemon data
class PokemonDataManager {
    static let shared = PokemonDataManager()
    
    private init() {}
    
    // 15 pokemon from gen 1
    let pokemon: [Pokemon] = [
        Pokemon(
            number: 1,
            name: "Bulbasaur",
            type: "Grass/Poison",
            category: "Seed Pokémon",
            height: "2'04\" (0.7 m)",
            weight: "15.2 lbs (6.9 kg)",
            description: "A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon. For some time after its birth, it uses the nutrients that are packed into the seed on its back in order to grow.",
            abilities: "Overgrow, Chlorophyll",
            evolution: "Evolves into Ivysaur at level 16",
            imageEmoji: "🌱"
        ),
        Pokemon(
            number: 4,
            name: "Charmander",
            type: "Fire",
            category: "Lizard Pokémon",
            height: "2'00\" (0.6 m)",
            weight: "18.7 lbs (8.5 kg)",
            description: "It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail. The flame on its tail shows the strength of its life force. If it is weak, the flame also burns weakly.",
            abilities: "Blaze, Solar Power",
            evolution: "Evolves into Charmeleon at level 16",
            imageEmoji: "🔥"
        ),
        Pokemon(
            number: 7,
            name: "Squirtle",
            type: "Water",
            category: "Tiny Turtle Pokémon",
            height: "1'08\" (0.5 m)",
            weight: "19.8 lbs (9.0 kg)",
            description: "When it retracts its long neck into its shell, it squirts out water with vigorous force. Its shell is soft when it is born, but it becomes hard as it gets older. It shelters itself in its shell and then strikes back with water jets.",
            abilities: "Torrent, Rain Dish",
            evolution: "Evolves into Wartortle at level 16",
            imageEmoji: "💧"
        ),
        Pokemon(
            number: 25,
            name: "Pikachu",
            type: "Electric",
            category: "Mouse Pokémon",
            height: "1'04\" (0.4 m)",
            weight: "13.2 lbs (6.0 kg)",
            description: "When several of these Pokémon gather, their electricity can build and cause lightning storms. It keeps its tail raised to monitor its surroundings. If you yank its tail, it will try to bite you.",
            abilities: "Static, Lightning Rod",
            evolution: "Evolves into Raichu with Thunder Stone",
            imageEmoji: "⚡"
        ),
        Pokemon(
            number: 6,
            name: "Charizard",
            type: "Fire/Flying",
            category: "Flame Pokémon",
            height: "5'07\" (1.7 m)",
            weight: "199.5 lbs (90.5 kg)",
            description: "It spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally. Its wings can carry this Pokémon close to an altitude of 4,600 feet. It blows out fire at very high temperatures.",
            abilities: "Blaze, Solar Power",
            evolution: "Final evolution of Charmander",
            imageEmoji: "🔥"
        ),
        Pokemon(
            number: 54,
            name: "Psyduck",
            type: "Water",
            category: "Duck Pokémon",
            height: "2'07\" (0.8 m)",
            weight: "43.2 lbs (19.6 kg)",
            description: "While lulling its enemies with its vacant look, this wily Pokémon will use psychokinetic powers. It is constantly wracked by a headache. When the headache turns intense, it begins using mysterious powers.",
            abilities: "Damp, Cloud Nine",
            evolution: "Evolves into Golduck at level 33",
            imageEmoji: "🦆"
        ),
        Pokemon(
            number: 39,
            name: "Jigglypuff",
            type: "Normal/Fairy",
            category: "Balloon Pokémon",
            height: "1'08\" (0.5 m)",
            weight: "12.1 lbs (5.5 kg)",
            description: "When its huge eyes light up, it sings a mysteriously soothing melody that lulls its enemies to sleep. It can draw breath endlessly, and it can continue singing for a very long time.",
            abilities: "Cute Charm, Competitive",
            evolution: "Evolves into Wigglytuff with Moon Stone",
            imageEmoji: "🎵"
        ),
        Pokemon(
            number: 94,
            name: "Gengar",
            type: "Ghost/Poison",
            category: "Shadow Pokémon",
            height: "4'11\" (1.5 m)",
            weight: "89.3 lbs (40.5 kg)",
            description: "Under a full moon, this Pokémon likes to mimic the shadows of people and laugh at their fright. Sometimes, on a dark night, your shadow thrown by a streetlight will suddenly overtake you. It is actually a Gengar running past you.",
            abilities: "Cursed Body",
            evolution: "Final evolution of Gastly via trade",
            imageEmoji: "👻"
        ),
        Pokemon(
            number: 68,
            name: "Machamp",
            type: "Fighting",
            category: "Superpower Pokémon",
            height: "5'03\" (1.6 m)",
            weight: "286.6 lbs (130.0 kg)",
            description: "Using its heavy muscles, it throws powerful punches that can send the victim clear over the horizon. One arm alone can move mountains. With all four arms, this Pokémon can deliver a powerful combo.",
            abilities: "Guts, No Guard",
            evolution: "Final evolution of Machop via trade",
            imageEmoji: "💪"
        ),
        Pokemon(
            number: 91,
            name: "Cloyster",
            type: "Water/Ice",
            category: "Bivalve Pokémon",
            height: "4'11\" (1.5 m)",
            weight: "292.1 lbs (132.5 kg)",
            description: "Its shell is extremely hard. It cannot be shattered, even with a bomb. The shell opens only when it is attacking. Once it slams its shell shut, it is impossible to open, even by those with superior strength.",
            abilities: "Shell Armor, Skill Link",
            evolution: "Evolves from Shellder with Water Stone",
            imageEmoji: "🐚"
        ),
        Pokemon(
            number: 65,
            name: "Alakazam",
            type: "Psychic",
            category: "Psi Pokémon",
            height: "4'11\" (1.5 m)",
            weight: "105.8 lbs (48.0 kg)",
            description: "Its brain can outperform a supercomputer. Its intelligence quotient is said to be 5,000. It remembers everything that happens. As a result, it remembers far too much and can't be lazy.",
            abilities: "Synchronize, Inner Focus",
            evolution: "Final evolution of Abra via trade",
            imageEmoji: "🧠"
        ),
        Pokemon(
            number: 59,
            name: "Arcanine",
            type: "Fire",
            category: "Legendary Pokémon",
            height: "6'03\" (1.9 m)",
            weight: "341.7 lbs (155.0 kg)",
            description: "A Pokémon that has long been admired for its beauty. It runs agilely as if on wings. Its magnificent bark conveys a sense of majesty. Anyone hearing it can't help but grovel before it.",
            abilities: "Intimidate, Flash Fire",
            evolution: "Evolves from Growlithe with Fire Stone",
            imageEmoji: "🐕"
        ),
        Pokemon(
            number: 3,
            name: "Venusaur",
            type: "Grass/Poison",
            category: "Seed Pokémon",
            height: "6'07\" (2.0 m)",
            weight: "220.5 lbs (100.0 kg)",
            description: "The flower on its back catches the sun's rays. The sunlight is then absorbed and used for energy. By spreading the broad petals of its flower, it can collect sunlight to use for energy generation.",
            abilities: "Overgrow, Chlorophyll",
            evolution: "Final evolution of Bulbasaur",
            imageEmoji: "🌺"
        ),
        Pokemon(
            number: 76,
            name: "Golem",
            type: "Rock/Ground",
            category: "Megaton Pokémon",
            height: "4'07\" (1.4 m)",
            weight: "661.4 lbs (300.0 kg)",
            description: "Once it sheds its skin, its body turns tender and whitish. Its hide hardens when it's exposed to air. It sheds its skin once a year. The discarded shell immediately hardens and crumbles away.",
            abilities: "Rock Head, Sturdy",
            evolution: "Final evolution of Geodude via trade",
            imageEmoji: "🪨"
        ),
        Pokemon(
            number: 87,
            name: "Dewgong",
            type: "Water/Ice",
            category: "Sea Lion Pokémon",
            height: "5'07\" (1.7 m)",
            weight: "264.6 lbs (120.0 kg)",
            description: "Its body is covered with a pure white fur. The colder the weather, the more active it becomes. It stores thermal energy in its body. It swims at a steady 8 knots even in intensely cold waters.",
            abilities: "Thick Fat, Hydration",
            evolution: "Evolves from Seel at level 34",
            imageEmoji: "🦭"
        )
    ]
}

