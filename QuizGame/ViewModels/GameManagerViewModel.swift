//
//  GameManagerViewModel.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import Foundation
import SwiftUI

class GameManagerViewModel: ObservableObject{
    static var currentIndex = 0
    var timer = Timer()
    var maxProgress = 15
    @Published var progress = 0
    @Published var model = GameManagerViewModel.createGameModel(i: GameManagerViewModel.currentIndex)
    
    static func createGameModel(i: Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    init(){
        self.start()
    }

    func verifyAnswer(selectedOption: QuizOption){
        for index in model.quizModel.optionsList.indices{
            model.quizModel.optionsList[index].isMatched = false
            model.quizModel.optionsList[index].isSelected = false
        }
        if let index = model.quizModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}){
            if selectedOption.optionId == model.quizModel.answer {
                model.quizModel.optionsList[index].isMatched = true
                model.quizModel.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    if GameManagerViewModel.currentIndex < GameManagerViewModel.quizData.count - 1{
                        GameManagerViewModel.currentIndex = GameManagerViewModel.currentIndex+1
                        self.model = GameManagerViewModel.createGameModel(i: GameManagerViewModel.currentIndex)
                    }else{
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                        self.reset()
                    }
                }
            }else{
                model.quizModel.optionsList[index].isMatched = false
                model.quizModel.optionsList[index].isSelected = true
            }
        }
    }
    
    func restartGame(){
        GameManagerViewModel.currentIndex = 0
        model = GameManagerViewModel.createGameModel(i: GameManagerViewModel.currentIndex)
        self.start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true, block: { time in
            if self.progress == self.maxProgress {
                self.model.quizCompleted = true
                self.model.quizWinningStatus = false
                self.reset()
            } else {
                self.progress += 1
            }
        })
    }
    
    func reset () {
        timer.invalidate()
        self.progress = 0
    }
}

extension GameManagerViewModel
{
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Dlaczego SwiftUI nie jest wybierany przez wiele firm?",
                      answer: "D",
                      optionsList: [QuizOption(id: 1, optionId: "A", option: "Jest niestabilny i ma wiele błędów", color: Color.yellow),
                                    QuizOption(id: 2,optionId: "B", option: "Nie obsługuje starszych wersji systemu iOS.", color: Color.red),
                                    QuizOption(id: 3,optionId: "C", option: "Funkcjonalność jest ograniczona w porównaniu do UIKit", color: Color.green),
                                    QuizOption(id: 4,optionId: "D", option: "Wszystkie z powyższych", color: Color.purple)]),
            
            QuizModel(question: "Która z poniższych technologii jest open-source?",
                      answer: "C",
                      optionsList: [QuizOption(id: 11,optionId: "A", option: "SwiftUI", color: Color.yellow),
                                    QuizOption(id: 12,optionId: "B", option: "Combine", color: Color.red),
                                    QuizOption(id: 13,optionId: "C", option: "Swift", color: Color.green),
                                    QuizOption(id: 14,optionId: "D", option: "UIKit", color: Color.purple)]),
            
            QuizModel(question: "Funkcja .flatMap() służy do spłaszczania zagnieżdżonych tablic do tablicy jednopoziomowej. Czy można ją wywołać na tablicy opcjonalnych wartości i jaki będzie wynik? (array.flatMap({ $0 }))",
                      answer: "C",
                      optionsList: [QuizOption(id: 21,optionId: "A", option: "Tak, wynik będzie identyczny z oryginalną tablicą, ponieważ jest to już tablica jednopoziomowa", color: Color.yellow),
                                    QuizOption(id: 22,optionId: "B", option: "Nie, kompilator na to nie pozwoli, można to wywołać tylko na tablicach, które mają zagnieżdżone tablice", color: Color.red),
                                    QuizOption(id: 23,optionId: "C", option: "Tak, spowoduje to utworzenie nowej tablicy z niezerowymi wartościami z oryginalnej tablicy", color: Color.green),
                                    QuizOption(id: 24,optionId: "D", option: "Nie, kompilator pozwoli na to, ale spowoduje to błąd w czasie wykonywania", color: Color.purple)]),
            
            QuizModel(question: "Dlaczego SwiftUI nie pozwala mieć więcej niż 10 zagnieżdżonych widoków w innym widoku?",
                      answer: "A",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "To z powodu generics, nie można mieć zmiennego parametru typu generycznego. Zespół SwiftUI postanowił po prostu ograniczyć to do 10 inicjalizatorów z rosnącą liczbą parametrów", color: Color.yellow),
                                    QuizOption(id: 32,optionId: "B", option: "Ponieważ wydajność będzie zbyt niska, a zespół SwiftUI postanowił zmusić nas do nie pisania powolnego kodu", color: Color.red),
                                    QuizOption(id: 33,optionId: "C", option: "Wydajność w rzeczywistości byłaby zbyt dobra, a zespół SwiftUI nie chciał, abyśmy tworzyli tak świetne i szybkie aplikacje. Nie będzie wtedy sensu kupować nowych iPhone'ów", color: Color.green),
                                    QuizOption(id: 34,optionId: "D", option: "Ograniczenie wynika z zaplanowanej struktury pamięciowej, która w obecnym modelu SwiftUI optymalizuje wydajność do 10 zagnieżdżonych widoków", color: Color.purple)]),
            
            QuizModel(question: "Podczas zwracania widoku SwiftUI zazwyczaj dodajemy słowo kluczowe some. Jakie byłyby konsekwencje braku takiego słowa kluczowego?",
                      answer: "D",
                      optionsList: [QuizOption(id: 41,optionId: "A", option: "Musielibyśmy określić dokładny typ zwracanego widoku", color: Color.yellow),
                                    QuizOption(id: 42,optionId: "B", option: "Nieznaczna zmiana struktury widoku doprowadziłaby do innego typu widoku", color: Color.red),
                                    QuizOption(id: 43,optionId: "C", option: "Musielibyśmy znać wszystkie typy dostarczane nam przez ViewBuilder, aby móc samodzielnie określić typ", color: Color.green),
                                    QuizOption(id: 44,optionId: "D", option: "Wszystkie z powyższych", color: Color.purple)]),
            
            QuizModel(question: "Który z poniższych elementów jest używany do tworzenia obiektu Mutable?",
                      answer: "B",
                      optionsList: [QuizOption(id: 51,optionId: "A", option: "Let", color: Color.yellow),
                                    QuizOption(id: 52,optionId: "B", option: "Var", color: Color.red),
                                    QuizOption(id: 53,optionId: "C", option: "Zarówno A jak i B", color: Color.green),
                                    QuizOption(id: 54,optionId: "D", option: "Żadne z powyższych", color: Color.purple)]),
            
            QuizModel(question: "Który z poniższych typów danych jest nieprawidłowy?",
                      answer: "C",
                      optionsList: [QuizOption(id: 61,optionId: "A", option: "Ulnt", color: Color.yellow),
                                    QuizOption(id: 62,optionId: "B", option: "Double", color: Color.red),
                                    QuizOption(id: 63,optionId: "C", option: "Char", color: Color.green),
                                    QuizOption(id: 64,optionId: "D", option: "Optional", color: Color.purple)])
            
        ]
    }
}
