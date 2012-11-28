class Outpost::Config
  include Singleton
  attr_accessor :files, :ranks, :game_type, :colors

  class << self
    # Configure the rules for this game.  The basic rules
    # will determine the size of the board, colors, and if you are playing
    # `standard` chess or `960` chess.
    def setup
      yield self.instance if block_given?
      defaults!
    end

    # Set defaults to any of the config that has not yet been set
    # by the user.  The defaults assume a `standard` game
    #
    # @returns the configuration instance
    def defaults!
      self.instance.files     ||= 'a' .. 'h'
      self.instance.ranks     ||= 1 .. 8
      self.instance.colors    ||= [:black, :white]
      self.instance.game_type ||= :standard
      self.instance
    end
  end
end
