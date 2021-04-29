//
//  ViewController.swift
//  DependencyInjectionFeature
//
//  Created by Veldanov, Anton on 4/18/21.
//

import UIKit

class ViewController: UIViewController {

    enum ProgLang{
        
        case swift
        case java
        case objectivec
        case basic
    }

    
    class Computer{
        var operatingSystem: String!
        
        func printOperatingSystem(){
           print(operatingSystem)
            
        }
        
    }
    
    class Programmer{
        var programmingLang: ProgLang!
        var name: String!
        var computerUsed: Computer
        
        init(computerUsed: Computer) {
            self.computerUsed = computerUsed
        }
        
        
        func catchPhrases() -> String{
            var catchPhrase = ""
            
            switch programmingLang {
            case .basic:
                catchPhrase = "basiccc"
            case .java:
                catchPhrase = "javaccc"
            case .swift:
                catchPhrase = "swiftcc"
            default:
                catchPhrase = "none"
                break
            }
            return catchPhrase
            
        }
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let computer = Computer()

        let programmer = Programmer(computerUsed: computer) //dependency injection
        let catchPhrase = programmer.catchPhrases()
        print("phrase",catchPhrase)
        print(programmer.name)
        
        computer.operatingSystem = "macOS"
        programmer.computerUsed = computer//
        print(programmer.computerUsed.printOperatingSystem())


    }


}

