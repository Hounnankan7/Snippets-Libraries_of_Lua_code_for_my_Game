
function love.load()
	player = {}
    player.max_health = 100
    player.health = 100
    damage = 0
    tile = 16
end
 
 
function love.update(dt)
	
    if player.health > 0 and love.mouse.isDown(1) then

        -- Récupération de la position du curseur en pixels
        local i = love.mouse.getX()
        local j = love.mouse.getY()
        -- Conversion pixer vers cases de la grille
        mousePosX_1 = math.floor((i/16)+1)
        mousePosY_1 = math.floor((j/16)+1)

        if mousePosY_1 >= 4 and mousePosY_1 <= 6 and mousePosX_1 >= 2 and mousePosX_1 <= 6 then
            
            damage = 10
            delay_s(0.9)
            actual_health = math.min(player.health-damage, player.max_health)
            player.health = actual_health 

        end
    else

    end

end
 
 

function love.draw()
	--Boutton d'attaque
    love.graphics.print("Attaque",2*tile,4*tile )
    love.graphics.rectangle("line",2*tile, 4*tile, 4*tile, 2*tile)


    --Barre de vie
    x,y = 32,96
    c = player.health/player.max_health
    color = {2-2*c, 2*c, 0} -- red by 0 and green by 1
    love.graphics.setColor(color)
    love.graphics.print('Health: ' .. math.floor(player.health),x,y)
    love.graphics.rectangle('fill',x,1.5*y,player.health,y/2)
    love.graphics.setColor(1,1,1)
	love.graphics.rectangle('line',x,1.5*y,player.max_health,y/2)





end


function delay_s(delay) -- Fonction pour attente une durée "delay"
    delay = delay or 1
    local time_to = os.time() + delay
    while os.time() < time_to do end
end
