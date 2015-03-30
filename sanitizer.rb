
require 'rubygems'
require 'obscenity'
require 'yaml'

# CENSOR TYPES
# :default : Uses the :garbled method
# :garbled : Replaces profane words with $@!#%
# :stars : Replaces profane words with '*' up to the word's length
# :vowels : Replaces the vowels in the profane word with '*'
# :nonconsonants : Replaces non consonants with '*'
# "custom string" : Replaces the profane word with the custom string

def getCensorType(type)
	if(!type)
		return :default
	end

	case type.downcase
	when "default"
		return :default
	when "garbled"
		return :garbled
	when "stars"
		return :stars
	when "vowels"
		return :vowels
	when "nonconsonants"
		return :nonconsonants
	else
		return type
	end
end

text = ARGV[0].dup
censor_type = getCensorType(ARGV[1]) || :default

Obscenity.configure do |config|
  config.blacklist   = "blacklist.yml" 
  config.whitelist   = ["safe", "word"]
  config.replacement = censor_type
end

puts Obscenity.sanitize(text)

