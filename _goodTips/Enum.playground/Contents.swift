

 //MARK: ENUM

enum Items:CaseIterable{
    case laptop
    case phone
    case desktop
}

let item = Items.laptop

var result: String
//guarantee we check all cases

switch item {
case .laptop:
    result = "laptop"
case .phone:
    result = "phone"
case .desktop:
    result = "desktop"
}

Items.allCases

result


// deck of cards
enum Suit: String{
    case heart = "serdce"
    case diamond
    case club
    case spade
    
}

Suit.heart.rawValue




enum Card{
    case regular(Int, Suit)
    case joker
    
}

let card = Card.regular(5, .heart)
switch card{
case .regular(let number, let suit):
    result = "\(number) of \(suit.rawValue)"
case .joker:
    result = "we have a joker"
}


result
