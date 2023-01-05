function love.load()
    if arg[#arg] == "-debug" then require("mobdebug").start() end
  
      cell = 64
      a = 1
      b = 3.5
  
      itemExist = false
  
      default_item = {
          name = "",
          description = "",
          image = nil,
          quantity = 0,
      }
  
      apple = {
          name = "Apple",
          description = "Heal 10 HP",
          image = love.graphics.newImage("hp_1_11zon.png"),  -- this field should hold the image for the item
          quantity = 1,
      }
  
      potion = {
          name = "Potion",
          description = "Heal 50 HP",
          -- other relevant attributes
          image = love.graphics.newImage("exp_1_11zon.png"),  -- this field should hold the image for the item
          quantity = 1,
      }
  
      inventory = {
          stocked_item = {}, -- table containing the item to stock
          size = 10 -- MAX size of the inventory
      }
  
  end
  
  function love.update(dt) --Fonction LOve2D en execution tout le temps
      
  end
  
    
  function love.draw()
      drawInventoryInterface(a,b) -- drawing the interface on the app
  end
  
  function checkItem(pItem) -- function to verify existence of one itm and recuperate the position of the item on the inventory
      for i, v in ipairs(inventory.stocked_item) do  -- Iterate through the inventory
          if v.name == pItem.name then  -- Check if the current item is the one we are looking for
              itemExist = true
              index = i -- recuperate the position in the table inventory
              return itemExist  -- Item was found, return true
          end
      end
      itemExist = false
      return itemExist
  end
  
  function addItemToInventory(pItem) -- function to add an item or the quantity of item in the inventory
      checkItem(pItem)
      if itemExist == true then
          for i, v in ipairs(inventory.stocked_item) do  -- Iterate through the items
              if i == index then 
                  inventory.stocked_item[index].quantity = inventory.stocked_item[index].quantity + 1  -- add quantity if the item already exist     
              end
          end
      else
          if #inventory.stocked_item < inventory.size then
              table.insert(inventory.stocked_item, pItem) -- add the item to the inventory table if item did not exist
          else
              -- We can print a text on the screen
          end
      end
  
  end
  
  
  function removeItemFromInventory(pItem) -- function to remove an item or decrease quantity of an item
      checkItem(pItem)
      if itemExist == true then -- check if exist
          if inventory.stocked_item[index].quantity > 0 then -- if exist check the quantity > 0
              for i, v in ipairs(inventory.stocked_item) do  -- Iterate through the items
                  if i == index then 
                      inventory.stocked_item[index].quantity = inventory.stocked_item[index].quantity - 1  -- and if quantity > 0 then decrease the quantity          
                  end
              end
          elseif inventory.stocked_item[index].quantity <= 0 then -- but if quantity <= 0 then remove item from the inventory
              table.remove(inventory.stocked_item, index)
              pItem.quantity = 1 -- restart the initial value of quantity in the database to 1
          end
          
      end
  end
  
  
  function love.keypressed(key)
      if key == "a" then
          addItemToInventory(apple)
      elseif key == "q" then
          addItemToInventory(potion)
      elseif key == "z" then
  
      elseif key == "e" then
  
      elseif key == "r" then
          removeItemFromInventory(apple)
          removeItemFromInventory(potion)
  
      end
  end
  
  
  function drawInventoryInterface(a,b)
      
      -- Items details rectangle
      love.graphics.rectangle("line", (1/2) * cell, (1/2) * cell, 9*cell, 2*cell)
      love.graphics.rectangle("line", 1 * cell, (1-0.01) * cell, cell, cell)
      love.graphics.rectangle("fill", 1 * cell, (0.25) * cell, 2*cell, cell/2)
      love.graphics.rectangle("fill", 10 * cell, (1.2) * cell, 2*cell, cell/2)
      love.graphics.rectangle("fill", 10 * cell, (1.96) * cell, 2*cell, cell/2)
  
      --Items list
      love.graphics.rectangle("line", (1/2) * cell, 3 * cell, 11.5*cell, 5*cell)
      love.graphics.rectangle("fill", 1 * cell, 2.75* cell, 2*cell, cell/2)
  
      -- Text on the page
      love.graphics.setColor(0, 0, 0)
      love.graphics.print("Item Details", (1+0.07)*cell, (0.35)*cell)
      love.graphics.print("Item List", (1+0.07)*cell, (2.85)*cell)
  
      love.graphics.print("USE", (10+0.07)*cell, (1.3)*cell)
      love.graphics.print("QUIT", (10+0.07)*cell, (2.06)*cell)
      love.graphics.setColor(1, 1, 1)
  
      --Page zone
      love.graphics.print("<-" .. " Page :" .. " 1/5 " .. "->", 0.5*cell, 8.35*cell)
  
      for i, v in ipairs(inventory.stocked_item) do
  
          love.graphics.print(v.name, a*cell, b*cell)
          love.graphics.print("x " .. v.quantity, (a+2)*cell, b*cell)
          b = b + 0.5
  
      end
  end
  
        