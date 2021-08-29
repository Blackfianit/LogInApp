//
//  User.swift
//  LogInApp
//
//  Created by Дмитрий Ивашинин on 29.08.2021.
//

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            userName: "User",
            password: "Password",
            person: Person(
                name: "Dmitry",
                surname: "Ivashinin",
                aboutInfo: Information(
                    height: 188,
                    weight: 75,
                    interests: [
                        Hobby(
                            title: "Piano playing",
                            achievments: "Wrote music for short film"
                        ),
                        Hobby(
                            title: "iOS development",
                            achievments: "Started learning swiftbook course"
                        )
                    ]
                )
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let aboutInfo: Information
}
struct Information {
    let height: Int
    let weight: Int
    let interests: [Hobby]
}

struct Hobby {
    let title: String
    let achievments: String
}
