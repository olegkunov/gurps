
require_relative 'hero_creation'
require_relative 'cli'

include CLI

template = {
  powerlevel: 150, st: 10, dx: 10, iq: 10, ht: 10
}

hc = HeroCreation.new template

# p hc

CLI.run(hc)
