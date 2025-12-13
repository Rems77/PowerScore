//
//  ViewModel.swift
//  Pokedex
//
//  Created by Lamée Rémy   on 21/02/2025.
//

import Foundation
import AVFoundation

class ViewModel: ObservableObject {
    
    private var player: AVAudioPlayer?
    
    @Published var stats: [StatObject] = [
        StatObject(name: "force"),
            StatObject(name: "vitesse"),
            StatObject(name: "durabilite"),
            StatObject(name: "intelligence"),
            StatObject(name: "pouvoir"),
            StatObject(name: "agilite"),
            StatObject(name: "endurance"),
            StatObject(name: "regeneration"),
            StatObject(name: "polyvalence"),
            StatObject(name: "experience"),
            StatObject(name: "powerScore")
        ]
    @Published var listePerso: [Perso] = [
        Perso(nom: "Goku (fin DBZ)", photo: "goku", son: "kameha",force: 61, vitesse: 66, durabilite: 54, intelligence: 64, pouvoir: 59, agilite: 72, endurance: 63, regeneration: 32, polyvalence: 71, experience: 86, powerScore: 628, faitImportant: [""]),
        Perso(nom: "Superman", photo: "superman", son: "heatvision",force: 96, vitesse: 94, durabilite: 93, intelligence: 78, pouvoir: 95, agilite: 69, endurance: 92, regeneration: 88, polyvalence: 97, experience: 93, powerScore: 885, faitImportant: [""]),
        Perso(nom: "Spider-Man", photo: "spiderman", son: "spidersound",force: 48, vitesse: 52, durabilite: 46, intelligence: 80, pouvoir: 65, agilite: 90, endurance: 66, regeneration: 28, polyvalence: 75, experience: 68, powerScore: 614, faitImportant: [""]),
        Perso(nom: "Homer Simpson", photo: "homer", son: "doh",force: 26, vitesse: 27, durabilite: 29, intelligence: 19, pouvoir: 10, agilite: 21, endurance: 37, regeneration: 12, polyvalence: 14, experience: 33, powerScore: 228, faitImportant: [""]),
        Perso(nom: "Saïtama", photo: "saitama", son: "onepunch",force: 100, vitesse: 98, durabilite: 97, intelligence: 52, pouvoir: 100, agilite: 87, endurance: 100, regeneration: 92, polyvalence: 69, experience: 61, powerScore: 856, faitImportant: [""]),
        Perso(nom: "Mewtwo", photo: "mewtwo", son: "mewtwocrie",force: 61, vitesse: 87, durabilite: 74, intelligence: 99, pouvoir: 100, agilite: 82, endurance: 79, regeneration: 63, polyvalence: 96, experience: 88, powerScore: 829, faitImportant: [""]),
        Perso(nom: "Dark Vador", photo: "vador", son: "vaderbreath",force: 86, vitesse: 71, durabilite: 82, intelligence: 89, pouvoir: 96, agilite: 69, endurance: 86, regeneration: 56, polyvalence: 83, experience: 93, powerScore: 811, faitImportant: [""]),
        Perso(nom: "Kratos", photo: "kratos", son: "boy",force: 97, vitesse: 83, durabilite: 92, intelligence: 76, pouvoir: 95, agilite: 88, endurance: 94, regeneration: 70, polyvalence: 93, experience: 90, powerScore: 878, faitImportant: [""]),
        Perso(nom: "dumbledore", photo: "dumbledore", son: "crottedenez",force: 24, vitesse: 44, durabilite: 61, intelligence: 99, pouvoir: 98, agilite: 53, endurance: 69, regeneration: 32, polyvalence: 97, experience: 100, powerScore: 677, faitImportant: [""]),
        Perso(nom: "The Bride (Kill Bill)", photo: "bride", son: "killbillsound",force: 31, vitesse: 62, durabilite: 67, intelligence: 82, pouvoir: 10, agilite: 91, endurance: 52, regeneration: 34, polyvalence: 66, experience: 82, powerScore: 511, faitImportant: [""]),
    ]
    
    func maxValue(for stat: String) -> Double {
        switch stat.lowercased() {
        case "force":
            return 100
        case "vitesse":
            return 100
        case "durabilite":
            return 100
        case "intelligence":
            return 100
        case "pouvoir":
            return 100
        case "agilite":
            return 100
        case "endurance":
            return 100
        case "regeneration":
            return 100
        case "polyvalence":
            return 100
        case "experience":
            return 100
        case "powerscore":
            return 1000
        default:
            return 100
        }
    }
    
    func playSound(named soundName: String) {
            guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
                print("❌ Son introuvable :", soundName)
                return
            }
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.prepareToPlay()
                player?.play()
            } catch {
                print("❌ Erreur de lecture du son :", error)
            }
        }
}

