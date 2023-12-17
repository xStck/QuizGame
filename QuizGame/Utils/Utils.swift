//
//  Utils.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 14/12/2023.
//

import Foundation
import SwiftUI
struct Utils {
    
    var backgroundImage: some View{
        Image("bg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
    
    var gradient: some View{
        LinearGradient(colors: [.purple.opacity(0.4),
                                .blue.opacity(0.4),
                                .red.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomLeading).ignoresSafeArea()
    }
    
//    static var quizQuestionsDb: [QuizQuestion] {
//        [
//            QuizQuestion(
//                question: "Co to jest SwiftUI?",
//                answer: "A",
//                optionsList: [
//                    QuizOption(id: 1, optionId: "A", option: "Framework do tworzenia interfejsów użytkownika", color: Color.blue),
//                    QuizOption(id: 2, optionId: "B", option: "Język programowania", color: Color.red),
//                    QuizOption(id: 3, optionId: "C", option: "System operacyjny", color: Color.green),
//                    QuizOption(id: 4, optionId: "D", option: "Biblioteka matematyczna", color: Color.orange)
//                ]),
//            QuizQuestion(
//                question: "Które z poniższych to frameworki do tworzenia interfejsów użytkownika w języku Swift?",
//                answer: "B",
//                optionsList: [
//                    QuizOption(id: 5, optionId: "A", option: "UIKit", color: Color.blue),
//                    QuizOption(id: 6, optionId: "B", option: "SwiftUI", color: Color.red),
//                    QuizOption(id: 7, optionId: "C", option: "SpriteKit", color: Color.green),
//                    QuizOption(id: 8, optionId: "D", option: "Core Data", color: Color.orange)
//                ]),
//            QuizQuestion(question: "Który operator używamy do tworzenia zakresu w Swift?", answer: "C", optionsList: [
//                QuizOption(id: 9, optionId: "A", option: "..<", color: Color.blue),
//                QuizOption(id: 10, optionId: "B", option: "...", color: Color.red),
//                QuizOption(id: 11, optionId: "C", option: "<>", color: Color.green),
//                QuizOption(id: 12, optionId: "D", option: "===", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Które z poniższych są typami kolekcji w Swift?", answer: "D", optionsList: [
//                QuizOption(id: 13, optionId: "A", option: "Dictionary", color: Color.blue),
//                QuizOption(id: 14, optionId: "B", option: "Queue", color: Color.red),
//                QuizOption(id: 15, optionId: "C", option: "Set", color: Color.green),
//                QuizOption(id: 16, optionId: "D", option: "Stack", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Które słowo kluczowe służy do oznaczania opcjonalnych wartości w Swift?", answer: "A", optionsList: [
//                QuizOption(id: 17, optionId: "A", option: "Optional", color: Color.blue),
//                QuizOption(id: 18, optionId: "B", option: "Nullable", color: Color.red),
//                QuizOption(id: 19, optionId: "C", option: "Voidable", color: Color.green),
//                QuizOption(id: 20, optionId: "D", option: "Unset", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Który operator służy do potęgowania w Swift?", answer: "B", optionsList: [
//                QuizOption(id: 21, optionId: "A", option: "**", color: Color.blue),
//                QuizOption(id: 22, optionId: "B", option: "//", color: Color.red),
//                QuizOption(id: 23, optionId: "C", option: "^^", color: Color.green),
//                QuizOption(id: 24, optionId: "D", option: "++", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest MVVM i jakie są jego główne komponenty?", answer: "B", optionsList: [
//                QuizOption(id: 29, optionId: "A", option: "Model-View-View", color: Color.blue),
//                QuizOption(id: 30, optionId: "B", option: "Model-View-ViewModel", color: Color.red),
//                QuizOption(id: 31, optionId: "C", option: "Model-ViewModel-View", color: Color.green),
//                QuizOption(id: 32, optionId: "D", option: "Model-Controller-View", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Jakie są trzy podstawowe rodzaje kontrolerów widoku w iOS?", answer: "D", optionsList: [
//                QuizOption(id: 37, optionId: "A", option: "UIViewController, UINavigationController, UITabBar", color: Color.blue),
//                QuizOption(id: 38, optionId: "B", option: "UIView, UITableViewController, UICollectionView", color: Color.red),
//                QuizOption(id: 39, optionId: "C", option: "UIPageViewController, UISplitViewController, UITableViewController", color: Color.green),
//                QuizOption(id: 40, optionId: "D", option: "UIViewController, UINavigationController, UITabBarController", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest ARC w Swift i do czego służy?", answer: "A", optionsList: [
//                QuizOption(id: 41, optionId: "A", option: "Automatic Reference Counting, zarządzanie pamięcią", color: Color.blue),
//                QuizOption(id: 42, optionId: "B", option: "Advanced Resource Control, kontrola zasobów", color: Color.red),
//                QuizOption(id: 43, optionId: "C", option: "Automatic Resource Collection, kolekcja zasobów", color: Color.green),
//                QuizOption(id: 44, optionId: "D", option: "Advanced Reference Counting, zliczanie referencji", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Które narzędzie używamy do zarządzania zależnościami w projekcie Swift?", answer: "B", optionsList: [
//                QuizOption(id: 45, optionId: "A", option: "Git", color: Color.blue),
//                QuizOption(id: 46, optionId: "B", option: "CocoaPods", color: Color.red),
//                QuizOption(id: 47, optionId: "C", option: "Carthage", color: Color.green),
//                QuizOption(id: 48, optionId: "D", option: "Swift Package Manager", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Jaki operator używamy w Swift do sprawdzania równości dwóch wartości?", answer: "A", optionsList: [
//                QuizOption(id: 49, optionId: "A", option: "==", color: Color.blue),
//                QuizOption(id: 50, optionId: "B", option: "===", color: Color.red),
//                QuizOption(id: 51, optionId: "C", option: "&&", color: Color.green),
//                QuizOption(id: 52, optionId: "D", option: "||", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest @State w SwiftUI?", answer: "B", optionsList: [
//                QuizOption(id: 53, optionId: "A", option: "Specjalna klasa w SwiftUI", color: Color.blue),
//                QuizOption(id: 54, optionId: "B", option: "Właściwość, która przechowuje zmienne stanu widoku", color: Color.red),
//                QuizOption(id: 55, optionId: "C", option: "Atrybut określający widoczność widoku", color: Color.green),
//                QuizOption(id: 56, optionId: "D", option: "Akcja reagująca na zmianę stanu", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest modifier w SwiftUI?", answer: "C", optionsList: [
//                QuizOption(id: 57, optionId: "A", option: "Właściwość określająca wygląd widoku", color: Color.blue),
//                QuizOption(id: 58, optionId: "B", option: "Kontrolka do modyfikowania tekstu", color: Color.red),
//                QuizOption(id: 59, optionId: "C", option: "Funkcja modyfikująca właściwości widoku", color: Color.green),
//                QuizOption(id: 60, optionId: "D", option: "Specjalna kategoria widoków", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Jaka jest rola GeometryReader w SwiftUI?", answer: "D", optionsList: [
//                QuizOption(id: 61, optionId: "A", option: "Pomiar czasu animacji", color: Color.blue),
//                QuizOption(id: 62, optionId: "B", option: "Zarządzanie danymi w formie tabeli", color: Color.red),
//                QuizOption(id: 63, optionId: "C", option: "Kontrola dostępu do aparatu fotograficznego", color: Color.green),
//                QuizOption(id: 64, optionId: "D", option: "Odczytywanie informacji o geometrii widoku", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest @Binding w SwiftUI?", answer: "A", optionsList: [
//                QuizOption(id: 65, optionId: "A", option: "Wiązanie dwukierunkowe między danymi a widokiem", color: Color.blue),
//                QuizOption(id: 66, optionId: "B", option: "Specjalny rodzaj animacji", color: Color.red),
//                QuizOption(id: 67, optionId: "C", option: "Okno dialogowe", color: Color.green),
//                QuizOption(id: 68, optionId: "D", option: "Atrybut określający kolor tekstu", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Które narzędzie służy do testowania interfejsu użytkownika w aplikacjach iOS?", answer: "B", optionsList: [
//                QuizOption(id: 69, optionId: "A", option: "Instruments", color: Color.blue),
//                QuizOption(id: 70, optionId: "B", option: "XCUITest", color: Color.red),
//                QuizOption(id: 71, optionId: "C", option: "SwiftLint", color: Color.green),
//                QuizOption(id: 72, optionId: "D", option: "CocoaPods", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest Codable w Swift i do czego służy?", answer: "C", optionsList: [
//                QuizOption(id: 73, optionId: "A", option: "Biblioteka do obsługi baz danych", color: Color.blue),
//                QuizOption(id: 74, optionId: "B", option: "Framework do tworzenia interfejsów użytkownika", color: Color.red),
//                QuizOption(id: 75, optionId: "C", option: "Protokół do enkodowania i dekodowania danych", color: Color.green),
//                QuizOption(id: 76, optionId: "D", option: "Kontrola dostępu do aparatu fotograficznego", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Jak utworzyć teksturowane tło w SwiftUI?", answer: "A", optionsList: [
//                QuizOption(id: 21, optionId: "A", option: "Za pomocą Image(uiImage:)", color: Color.blue),
//                QuizOption(id: 22, optionId: "B", option: "Przez dodanie tła jako widoku", color: Color.red),
//                QuizOption(id: 23, optionId: "C", option: "Używając tła w kolorze", color: Color.green),
//                QuizOption(id: 24, optionId: "D", option: "Nie można używać tekstury w SwiftUI", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest VStack?", answer: "B", optionsList: [
//                QuizOption(id: 25, optionId: "A", option: "Pionowy stack", color: Color.blue),
//                QuizOption(id: 26, optionId: "B", option: "Pionowy układ elementów", color: Color.red),
//                QuizOption(id: 27, optionId: "C", option: "Znak zodiaku", color: Color.green),
//                QuizOption(id: 28, optionId: "D", option: "Kolekcja widoków", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Do czego służy Spacer w SwiftUI?", answer: "C", optionsList: [
//                QuizOption(id: 29, optionId: "A", option: "Do dodawania odstępów między tekstem", color: Color.blue),
//                QuizOption(id: 30, optionId: "B", option: "Jako zastępstwo dla pustego widoku", color: Color.red),
//                QuizOption(id: 31, optionId: "C", option: "Do równomiernego rozłożenia elementów", color: Color.green),
//                QuizOption(id: 32, optionId: "D", option: "Nie ma takiej funkcji", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest @State w SwiftUI?", answer: "D", optionsList: [
//                QuizOption(id: 33, optionId: "A", option: "Służy do zdefiniowania koloru", color: Color.blue),
//                QuizOption(id: 34, optionId: "B", option: "Oznacza styl widoku", color: Color.red),
//                QuizOption(id: 35, optionId: "C", option: "Jest to specjalny widok", color: Color.green),
//                QuizOption(id: 36, optionId: "D", option: "Właściwość, która przechowuje zmienne stanu widoku", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Jak dodać zaokrąglenie do krawędzi widoku w SwiftUI?", answer: "A", optionsList: [
//                QuizOption(id: 37, optionId: "A", option: "Korzystając z .cornerRadius()", color: Color.blue),
//                QuizOption(id: 38, optionId: "B", option: "Ustawiając kształt na 'Rounded'", color: Color.red),
//                QuizOption(id: 39, optionId: "C", option: "Dodając specjalny modifier .roundEdges()", color: Color.green),
//                QuizOption(id: 40, optionId: "D", option: "Nie można zaokrąglić krawędzi w SwiftUI", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Jakie są podstawowe rodzaje widoków w SwiftUI?", answer: "B", optionsList: [
//                QuizOption(id: 41, optionId: "A", option: "Text, Image, Spacer", color: Color.blue),
//                QuizOption(id: 42, optionId: "B", option: "Text, Image, VStack", color: Color.red),
//                QuizOption(id: 43, optionId: "C", option: "ZStack, HStack, Spacer", color: Color.green),
//                QuizOption(id: 44, optionId: "D", option: "List, ScrollView, NavigationView", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Jak stworzyć interaktywny przycisk w SwiftUI?", answer: "C", optionsList: [
//                QuizOption(id: 45, optionId: "A", option: "Przez dodanie GestureRecognizer", color: Color.blue),
//                QuizOption(id: 46, optionId: "B", option: "Używając specjalnego widoku Button", color: Color.red),
//                QuizOption(id: 47, optionId: "C", option: "Poprzez dodanie akcji do widoku", color: Color.green),
//                QuizOption(id: 48, optionId: "D", option: "Jest to niemożliwe w SwiftUI", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Jak stworzyć listę w SwiftUI?", answer: "A", optionsList: [
//                QuizOption(id: 53, optionId: "A", option: "Przez użycie widoku List", color: Color.blue),
//                QuizOption(id: 54, optionId: "B", option: "Dodając elementy do VStack", color: Color.red),
//                QuizOption(id: 55, optionId: "C", option: "Poprzez użycie widoku TableView", color: Color.green),
//                QuizOption(id: 56, optionId: "D", option: "Jest to niemożliwe w SwiftUI", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Jakie są podstawowe style tekstu w SwiftUI?", answer: "B", optionsList: [
//                QuizOption(id: 57, optionId: "A", option: "Regular, Bold, Italic", color: Color.blue),
//                QuizOption(id: 58, optionId: "B", option: "Plain, Bold, Italic", color: Color.red),
//                QuizOption(id: 59, optionId: "C", option: "Thin, Regular, Bold", color: Color.green),
//                QuizOption(id: 60, optionId: "D", option: "Normal, Strong, Emphasis", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest NavigationView w SwiftUI?", answer: "C", optionsList: [
//                QuizOption(id: 61, optionId: "A", option: "Widok do nawigacji w tekście", color: Color.blue),
//                QuizOption(id: 62, optionId: "B", option: "Specjalny styl widoku", color: Color.red),
//                QuizOption(id: 63, optionId: "C", option: "Kontener do nawigacji między widokami", color: Color.green),
//                QuizOption(id: 64, optionId: "D", option: "Przycisk nawigacyjny", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest modifier w SwiftUI?", answer: "B", optionsList: [
//                QuizOption(id: 69, optionId: "A", option: "Właściwość określająca wygląd widoku", color: Color.blue),
//                QuizOption(id: 70, optionId: "B", option: "Funkcja modyfikująca właściwości widoku", color: Color.red),
//                QuizOption(id: 71, optionId: "C", option: "Atrybut określający widoczność widoku", color: Color.green),
//                QuizOption(id: 72, optionId: "D", option: "Specjalna kategoria widoków", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Jakie są trzy podstawowe rodzaje kontrolerów widoku w iOS?", answer: "C", optionsList: [
//                QuizOption(id: 73, optionId: "A", option: "UIViewController, UINavigationController, UITabBar", color: Color.blue),
//                QuizOption(id: 74, optionId: "B", option: "UIView, UITableViewController, UICollectionView", color: Color.red),
//                QuizOption(id: 75, optionId: "C", option: "UIPageViewController, UISplitViewController, UITableViewController", color: Color.green),
//                QuizOption(id: 76, optionId: "D", option: "UIViewController, UINavigationController, UITabBarController", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest @ObservedObject w SwiftUI?", answer: "A", optionsList: [
//                QuizOption(id: 81, optionId: "A", option: "Właściwość do obserwowania zmian w obiekcie", color: Color.blue),
//                QuizOption(id: 82, optionId: "B", option: "Specjalny widok do obserwacji interakcji", color: Color.red),
//                QuizOption(id: 83, optionId: "C", option: "Funkcja do śledzenia animacji", color: Color.green),
//                QuizOption(id: 84, optionId: "D", option: "Kluczowy element w strukturze danych", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Jak zmienić kolor tekstu w SwiftUI?", answer: "C", optionsList: [
//                QuizOption(id: 89, optionId: "A", option: "Przez ustawienie koloru na samym tekście", color: Color.blue),
//                QuizOption(id: 90, optionId: "B", option: "Poprzez dodanie kolorowego tła", color: Color.red),
//                QuizOption(id: 91, optionId: "C", option: "Za pomocą .foregroundColor()", color: Color.green),
//                QuizOption(id: 92, optionId: "D", option: "Nie można zmieniać koloru tekstu w SwiftUI", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest environmentObject w SwiftUI?", answer: "B", optionsList: [
//                QuizOption(id: 85, optionId: "A", option: "Specjalny efekt wizualny", color: Color.blue),
//                QuizOption(id: 86, optionId: "B", option: "Właściwość do udostępniania danych w całej aplikacji", color: Color.red),
//                QuizOption(id: 87, optionId: "C", option: "Funkcja do zarządzania kolorami", color: Color.green),
//                QuizOption(id: 88, optionId: "D", option: "Atrybut do kontrolowania animacji", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest GeometryReader w SwiftUI?", answer: "D", optionsList: [
//                QuizOption(id: 93, optionId: "A", option: "Widok do renderowania grafiki 3D", color: Color.blue),
//                QuizOption(id: 94, optionId: "B", option: "Kontener do przechowywania geometrii widoku", color: Color.red),
//                QuizOption(id: 95, optionId: "C", option: "Specjalny widok do animacji", color: Color.green),
//                QuizOption(id: 96, optionId: "D", option: "Odczytywanie informacji o geometrii widoku", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest ViewModifier w SwiftUI?", answer: "A", optionsList: [
//                QuizOption(id: 97, optionId: "A", option: "Funkcja modyfikująca właściwości widoku", color: Color.blue),
//                QuizOption(id: 98, optionId: "B", option: "Widok do aplikowania efektów wizualnych", color: Color.red),
//                QuizOption(id: 99, optionId: "C", option: "Specjalny widok do zarządzania kształtem", color: Color.green),
//                QuizOption(id: 100, optionId: "D", option: "Atrybut do obsługi zmian stanu widoku", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Jak stworzyć animację w SwiftUI?", answer: "B", optionsList: [
//                QuizOption(id: 101, optionId: "A", option: "Poprzez ustawienie atrybutu 'animate'", color: Color.blue),
//                QuizOption(id: 102, optionId: "B", option: "Korzystając z funkcji withAnimation()", color: Color.red),
//                QuizOption(id: 103, optionId: "C", option: "Przez dodanie specjalnego widoku AnimationView", color: Color.green),
//                QuizOption(id: 104, optionId: "D", option: "Nie ma możliwości animacji w SwiftUI", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest TabView w SwiftUI?", answer: "C", optionsList: [
//                QuizOption(id: 105, optionId: "A", option: "Specjalny widok do zarządzania tabulatorami w tekście", color: Color.blue),
//                QuizOption(id: 106, optionId: "B", option: "Kontener do przechowywania elementów widoku", color: Color.red),
//                QuizOption(id: 107, optionId: "C", option: "Kontrolka do nawigacji między widokami za pomocą zakładek", color: Color.green),
//                QuizOption(id: 108, optionId: "D", option: "Funkcja do ustawiania koloru krawędzi widoku", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest onAppear w SwiftUI?", answer: "B", optionsList: [
//                QuizOption(id: 117, optionId: "A", option: "Funkcja do ustawiania efektów dźwiękowych", color: Color.blue),
//                QuizOption(id: 118, optionId: "B", option: "Modyfikator wywoływany, gdy widok pojawia się na ekranie", color: Color.red),
//                QuizOption(id: 119, optionId: "C", option: "Specjalny widok do obsługi zdarzenia pojawienia się", color: Color.green),
//                QuizOption(id: 120, optionId: "D", option: "Flaga informująca o pojawieniu się widoku", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Jak zaimplementować obsługę gestów w SwiftUI?", answer: "B", optionsList: [
//                QuizOption(id: 129, optionId: "A", option: "Przez ustawienie atrybutu 'gestures'", color: Color.blue),
//                QuizOption(id: 130, optionId: "B", option: "Dodając GestureRecognizer do widoku", color: Color.red),
//                QuizOption(id: 131, optionId: "C", option: "Korzystając z funkcji onTouch()", color: Color.green),
//                QuizOption(id: 132, optionId: "D", option: "Nie ma możliwości obsługi gestów w SwiftUI", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Co to jest @FetchRequest w SwiftUI?", answer: "A", optionsList: [
//                QuizOption(id: 137, optionId: "A", option: "Właściwość do pobierania danych z CoreData", color: Color.blue),
//                QuizOption(id: 138, optionId: "B", option: "Specjalny widok do dynamicznego odświeżania", color: Color.red),
//                QuizOption(id: 139, optionId: "C", option: "Funkcja do filtrowania danych", color: Color.green),
//                QuizOption(id: 140, optionId: "D", option: "Flaga informująca o zmianach w żądanych danych", color: Color.orange)
//            ]),
//            QuizQuestion(question: "Dlaczego SwiftUI nie jest wybierany przez wiele firm?",
//                         answer: "D",
//                         optionsList: [QuizOption(id: 141, optionId: "A", option: "Jest niestabilny i ma wiele błędów", color: Color.yellow),
//                                       QuizOption(id: 143,optionId: "B", option: "Nie obsługuje starszych wersji systemu iOS.", color: Color.red),
//                                       QuizOption(id: 144,optionId: "C", option: "Funkcjonalność jest ograniczona w porównaniu do UIKit", color: Color.green),
//                                       QuizOption(id: 145,optionId: "D", option: "Wszystkie z powyższych", color: Color.purple)]),
//            
//            
//            
//            QuizQuestion(question: "Która z poniższych technologii jest open-source?",
//                         answer: "C",
//                         optionsList: [QuizOption(id: 146,optionId: "A", option: "SwiftUI", color: Color.yellow),
//                                       QuizOption(id: 147,optionId: "B", option: "Combine", color: Color.red),
//                                       QuizOption(id: 148,optionId: "C", option: "Swift", color: Color.green),
//                                       QuizOption(id: 149,optionId: "D", option: "UIKit", color: Color.purple)]),
//            
//            QuizQuestion(question: "Który z poniższych elementów jest używany do tworzenia obiektu Mutable?",
//                         answer: "B",
//                         optionsList: [QuizOption(id: 162,optionId: "A", option: "Let", color: Color.yellow),
//                                       QuizOption(id: 163,optionId: "B", option: "Var", color: Color.red),
//                                       QuizOption(id: 164,optionId: "C", option: "Zarówno A jak i B", color: Color.green),
//                                       QuizOption(id: 165,optionId: "D", option: "Żadne z powyższych", color: Color.purple)]),
//            
//            QuizQuestion(question: "Który z poniższych typów danych jest nieprawidłowy?",
//                         answer: "C",
//                         optionsList: [QuizOption(id: 166,optionId: "A", option: "Ulnt", color: Color.yellow),
//                                       QuizOption(id: 167,optionId: "B", option: "Double", color: Color.red),
//                                       QuizOption(id: 168,optionId: "C", option: "Char", color: Color.green),
//                                       QuizOption(id: 169,optionId: "D", option: "Optional", color: Color.purple)]),
//            QuizQuestion(question: "Które z poniższych nie jest typem danych w Swift?",
//                          answer: "C", 
//                          optionsList: [QuizOption(id: 170, optionId: "A", option: "String", color: Color.blue),
//                                       QuizOption(id: 171, optionId: "B", option: "Int", color: Color.red),
//                                       QuizOption(id: 172, optionId: "C", option: "FloatArray", color: Color.green),
//                                       QuizOption(id: 173, optionId: "D", option: "Bool", color: Color.orange)]),
//
//            QuizQuestion(question: "Które ze słów kluczowych jest używane do tworzenia aliasów dla typów danych w Swift?",
//                             answer: "B",
//                             optionsList: [QuizOption(id: 174, optionId: "A", option: "Type", color: Color.blue),
//                                      QuizOption(id: 175, optionId: "B", option: "Typealias", color: Color.red),
//                                      QuizOption(id: 176, optionId: "C", option: "Alias", color: Color.green),
//                                      QuizOption(id: 177, optionId: "D", option: "Define", color: Color.orange)]),
//            QuizQuestion(question: "Które z poniższych deklaracji zmiennych w Swift jest mutowalne?",
//                         answer: "A",
//                         optionsList: [QuizOption(id: 175, optionId: "A", option: "var", color: Color.blue),
//                                      QuizOption(id: 176, optionId: "B", option: "let", color: Color.red),
//                                      QuizOption(id: 177, optionId: "C", option: "const", color: Color.green),
//                                      QuizOption(id: 178, optionId: "D", option: "immutable", color: Color.orange)]),4
//            QuizQuestion(question: "Które z poniższych jest właściwością typu Enum w Swift?",
//                         answer: "B",
//                         optionsList: [QuizOption(id: 37, optionId: "A", option: "Accessor", color: Color.blue),
//                                       QuizOption(id: 38, optionId: "B", option: "RawValue", color: Color.red),
//                                       QuizOption(id: 39, optionId: "C", option: "Computed", color: Color.green),
//                                       QuizOption(id: 40, optionId: "D", option: "Static", color: Color.orange)])
//
//            
//        ]
//    }
    
    
    static var quizQuestionsDb: [QuizQuestion] {
        [
            QuizQuestion(
                question: "Co to jest SwiftUI?",
                answer: "A",
                optionsList: [
                    QuizOption(id: 1, optionId: "A", option: "Framework do tworzenia interfejsów użytkownika", color: Color.blue),
                    QuizOption(id: 2, optionId: "B", option: "Język programowania", color: Color.red),
                    QuizOption(id: 3, optionId: "C", option: "System operacyjny", color: Color.green),
                    QuizOption(id: 4, optionId: "D", option: "Biblioteka matematyczna", color: Color.orange)
                ]),
            QuizQuestion(
                question: "Które z poniższych to frameworki do tworzenia interfejsów użytkownika w języku Swift?",
                answer: "A",
                optionsList: [
                    QuizOption(id: 5, optionId: "A", option: "UIKit", color: Color.blue),
                    QuizOption(id: 6, optionId: "B", option: "SwiftUI", color: Color.red),
                    QuizOption(id: 7, optionId: "C", option: "SpriteKit", color: Color.green),
                    QuizOption(id: 8, optionId: "D", option: "Core Data", color: Color.orange)
                ]),
            QuizQuestion(question: "Który operator używamy do tworzenia zakresu w Swift?", answer: "A", optionsList: [
                QuizOption(id: 9, optionId: "A", option: "..<", color: Color.blue),
                QuizOption(id: 10, optionId: "B", option: "...", color: Color.red),
                QuizOption(id: 11, optionId: "C", option: "<>", color: Color.green),
                QuizOption(id: 12, optionId: "D", option: "===", color: Color.orange)
            ]),
            QuizQuestion(question: "Które z poniższych są typami kolekcji w Swift?", answer: "A", optionsList: [
                QuizOption(id: 13, optionId: "A", option: "Dictionary", color: Color.blue),
                QuizOption(id: 14, optionId: "B", option: "Queue", color: Color.red),
                QuizOption(id: 15, optionId: "C", option: "Set", color: Color.green),
                QuizOption(id: 16, optionId: "D", option: "Stack", color: Color.orange)
            ]),
            QuizQuestion(question: "Które słowo kluczowe służy do oznaczania opcjonalnych wartości w Swift?", answer: "A", optionsList: [
                QuizOption(id: 17, optionId: "A", option: "Optional", color: Color.blue),
                QuizOption(id: 18, optionId: "B", option: "Nullable", color: Color.red),
                QuizOption(id: 19, optionId: "C", option: "Voidable", color: Color.green),
                QuizOption(id: 20, optionId: "D", option: "Unset", color: Color.orange)
            ]),
            QuizQuestion(question: "Który operator służy do potęgowania w Swift?", answer: "A", optionsList: [
                QuizOption(id: 21, optionId: "A", option: "**", color: Color.blue),
                QuizOption(id: 22, optionId: "B", option: "//", color: Color.red),
                QuizOption(id: 23, optionId: "C", option: "^^", color: Color.green),
                QuizOption(id: 24, optionId: "D", option: "++", color: Color.orange)
            ]),
            QuizQuestion(question: "Co to jest MVVM i jakie są jego główne komponenty?", answer: "A", optionsList: [
                QuizOption(id: 29, optionId: "A", option: "Model-View-View", color: Color.blue),
                QuizOption(id: 30, optionId: "B", option: "Model-View-ViewModel", color: Color.red),
                QuizOption(id: 31, optionId: "C", option: "Model-ViewModel-View", color: Color.green),
                QuizOption(id: 32, optionId: "D", option: "Model-Controller-View", color: Color.orange)
            ])
        ]
    }
}
