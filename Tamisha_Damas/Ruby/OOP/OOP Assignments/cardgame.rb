class Card
    value = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    suit = %w(Spade Heart Club Diamond)
    attr_reader :value, :suit
    def initialize(value, suit)
        @value = value
        @suit = suit
        self
    end
end

class Deck
    @cards
    attr_accessor :cards

    def initialize
        @cards=[]
        value = %w(2 3 4 5 6 7 8 9 10 J Q K A)
        suit = %w(Spade Heart Club Diamond)
        for i in suit
            for x in value
                @cards << Card.new(x,i)
            end
        end
    end

    def deal
        @cards.pop
    end

    def shuffle
        self.cards.shuffle!
    end

    def return_card(card)
        #Needs to insert card to the front of the deck when discarded
        self
    end
end

deck = Deck.new
deck.shuffle

class Player
    @@no_of_players
    @name
    @hand
    attr_accessor :hand, :name

    def initialize(name)
        @name = name
        @hand = []
        self
    end

    def draw(num, deck)
        5.times { @hand << deck.deal } #need to deal a card
        self    
    end

    def hand


    def discard(card)
        # Needs to remove a specific card and return to .return method in deck
        self    
    end
end


hermione = Player.new("hermione").draw(5, deck)
p hermione.hand

ron = Player.new("ron").draw(5, deck)
p ron.hand

harry = Player.new("harry").draw(5, deck)
p harry.hand

ginny = Player.new("ginny").draw(5, deck)
p ginny.hand


#----------------- PLAY GO FISH ----------------------


end


