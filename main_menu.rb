load 'player.rb'

class MainMenu
  @@players = Array.new
  @@mode = "new"

  def choose
    puts "#=============================================#"
    puts "#           Welcome to Battle Arena           #"
    puts "#---------------------------------------------#"
    puts "# Description :                               #"
    puts "# 1. ketik 'new' untuk membuat karakter       #"
    puts "# 2. ketik 'start' untuk memulai pertarungan  #"
    puts "#---------------------------------------------#"

    play()
  end

  def play gets.chomp
    while !isGameOver do
      @input = gets.chomp

      if @input.eql? "new"
        puts "Masukan nama Player 1 :"
        @nama1 = gets.chomp
        puts "Masukan nama Player 2 :"
        @nama2 = gets.chomp

        @@players.push Player.new @nama1
        @@players.push Player.new @nama2

      else if  @input.eql? "begin"
        if @@players.count < 2
          puts "Masukan pemain ke 2"

        else if @@players.count.eql? 2
          puts "Masukan nama attacker"
          @namaAttacker = get.chomp
          puts "masukan nama defender"
          @namaDefender = get.chomp

          if @namaAttacker.eql? @namaDefender then
            puts "Can't attack himself"
          else
            puts "Descriptions"

            for player in @@players do
              if player.name.eql? @namaAttacker then
                player.attack()
              elsif player.name.eql? @namaDefender then
                player.defense()
              end
              puts "#{player.name} : manna = #{player.manna}, blood = #{player.blood}"
            end
          end
        end
      else
        puts "Input tidak diketahui"
      end
    end
    puts "Game Over!"
  end

  def isGameOver
    gameOver = false

    for player in @@players do
      gameOver = gameOver || player.isGameOver()
    end
    gameOver
  end
end
