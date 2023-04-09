//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    var answers: [Answer]!
    var countAnimal: [Animal] = []
    
    @IBOutlet var result: UILabel!
    @IBOutlet var resultDiscription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        
        checkingAnswers()
        
        let item = countAnimal.map {($0, 1)}
        let counts = Dictionary(item, uniquingKeysWith: +)
        let countsMax = counts.max { $0.1 < $1.1}
        
        func updateResult() {
            if countsMax!.key == PersonalQuiz.Animal.dog {
                result.text = "Вы - \(Animal.dog.rawValue)"
                resultDiscription.text = Animal.dog.definition
            } else if countsMax!.key == PersonalQuiz.Animal.cat {
                result.text = "Вы - \(Animal.cat.rawValue)"
                resultDiscription.text = Animal.cat.definition
            } else if countsMax!.key == PersonalQuiz.Animal.rabbit {
                result.text = "Вы - \(Animal.rabbit.rawValue)"
                resultDiscription.text = Animal.rabbit.definition
            }    else if countsMax!.key == PersonalQuiz.Animal.turtle {
                result.text = "Вы - \(Animal.turtle.rawValue)"
                resultDiscription.text = Animal.turtle.definition
            }
        }

        updateResult()
        }
       
    func checkingAnswers() {
        for answer in answers {
            if answer.animal == .dog {
                countAnimal.append(.dog)
            } else if answer.animal == .cat {
                countAnimal.append(.cat)
            } else if answer.animal == .rabbit {
                countAnimal.append(.rabbit)
            } else if answer.animal == .turtle {
                countAnimal.append(.turtle)
            }
        }
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
