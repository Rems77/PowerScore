//
//  Model.swift
//  Pokedex
//
//  Created by Lamée Rémy   on 21/02/2025.
//

import Foundation

struct Perso: Identifiable, Hashable {
    let id = UUID()
    let nom: String
    let photo: String
    let son: String
    let force: Int
    let vitesse: Int
    let durabilite: Int
    let intelligence: Int
    let pouvoir: Int
    let agilite: Int
    let endurance: Int
    let regeneration: Int
    let polyvalence: Int
    let experience: Int
    let powerScore: Int
    let faitImportant: [String]
    
    let stats = ["force", "vitesse", "durabilite", "intelligence", "pouvoir", "agilite", "endurance", "regeneration", "polyvalence", "experience", "powerScore"]
    
    init(nom: String, photo: String, son: String, force: Int, vitesse: Int, durabilite: Int, intelligence: Int, pouvoir: Int, agilite: Int, endurance: Int, regeneration: Int, polyvalence: Int, experience: Int, powerScore: Int, faitImportant: [String]) {
        self.nom = nom
        self.photo = photo
        self.son = son
        self.force = force
        self.vitesse = vitesse
        self.durabilite = durabilite
        self.intelligence = intelligence
        self.pouvoir = pouvoir
        self.agilite = agilite
        self.endurance = endurance
        self.regeneration = regeneration
        self.polyvalence = polyvalence
        self.experience = experience
        self.powerScore = powerScore
        self.faitImportant = faitImportant
    }
}
