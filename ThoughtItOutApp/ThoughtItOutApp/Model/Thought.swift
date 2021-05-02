//
//  Thought.swift
//  ThoughtItOutApp
//
//  Created by Anton Veldanov on 5/2/21.
//

import Foundation


class Thought {
    private(set) var username: String!
    private(set) var timeStamp: Date!
    private(set) var thoughtText: String!
    private(set) var numLikes: Int!
    private(set) var numComments: Int!
    private(set) var documentId: String!

    
    init(username: String, timeStamp:Date, thoughtText: String, numLikes: Int, numComments: Int, documentId: String) {
        self.username = username
        self.timeStamp = timeStamp
        self.thoughtText = thoughtText
        self.numLikes = numLikes
        self.numComments = numComments
        self.documentId = documentId
    }
}
