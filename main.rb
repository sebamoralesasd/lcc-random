require_relative 'bot'

def main
  # lcc = Elecece.new
  # puts lcc.generate
  bot = DiscordBot.new
  bot.execute
end

main
