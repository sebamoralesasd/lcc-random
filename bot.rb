# frozen_string_literal: true

require_relative 'elecece'
require 'discordrb'

class DiscordBot
  def initialize
    @bot = Discordrb::Bot.new token: ENV.fetch('DISCORD_ELECECE_TOKEN', nil)
    @lcc = Elecece.new
  end

  def execute
    # puts "This bot's invite URL is #{bot.invite_url}"
    # puts 'Click on it to invite it to your server.'

    member_join
    priv_mes
    # This method call has to be put at the end of your script, it is what makes the bot actually connect to Discord. If you
    # leave it out (try it!) the script will simply stop and the bot will not appear online.
    @bot.run
  end

  private

  def priv_mes
    @bot.pm(contains: 'Sugerir') do |event|
      nombre = @lcc.generate
      user = event.author

      user.pm("Hola #{user.mention}! El nombre sugerido para que uses en el server es #{nombre}. Salu2.")
    end
  end

  def member_join
    @bot.member_join do |event|
      nombre = @lcc.generate
      user = event.user

      channels = event.server.channels
      channels.each(&:name)
      chan = channels.find { |ch| ch.name == 'jorge' }

      chan.send_message("Hola #{user.mention}! El nombre sugerido para que uses en el server es #{nombre}. Salu2.")
    end
  end
end
