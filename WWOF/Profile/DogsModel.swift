//
//  DogsModel.swift
//  WWOF
//
//  Created by Roman on 16.01.2022.
//

import Foundation

struct Dog: Equatable, Hashable {
    let name: String
    let breed: String
}

struct Header: Equatable, Hashable {
    let name: String
    let surname: String
    let status: String
    let city: String
}

struct Sections: Equatable, Hashable {
    let header: String
    let type: String
}

let dogList: [Dog] = [
    Dog(name: "Amal", breed: "duth"),
    Dog(name: "Peter", breed: "duth"),
    Dog(name: "Rem", breed: "duth")
]

let header = Header(name: "Danil",
                    surname: "Bogomolov",
                    status: "No",
                    city: "Tomsk")

var sectionsList: [Sections] = [Sections(header: "1", type: "1"),
                                Sections(header: "2", type: "2"),
                                Sections(header: "3", type: "3")]

