local savedNotes = {
  
}

TriggerEvent('server:LoadsNote')

RegisterCommand('notes', function(source, args) -- Change this to fsn_commands
  local playerPed = GetPlayerPed(-1)
     TriggerClientEvent('notepad:note', source)
     TriggerClientEvent('notepad:OpenNotepadGui', source)
     TriggerEvent('server:LoadsNote')
end, false)

RegisterNetEvent("server:LoadsNote")
AddEventHandler("server:LoadsNote", function()
   TriggerClientEvent('notepad:updateNotes', -1, savedNotes)
end)

RegisterNetEvent("server:newNote")
AddEventHandler("server:newNote", function(text, x, y, z)
      local import = {
        ["text"] = ""..text.."",
        ["x"] = x,
        ["y"] = y,
        ["z"] = z,
      }
      table.insert(savedNotes, import)
      TriggerEvent("server:LoadsNote")
end)

RegisterNetEvent("server:updateNote")
AddEventHandler("server:updateNote", function(noteID, text)
  savedNotes[noteID]["text"]=text
  TriggerEvent("server:LoadsNote")
end)

RegisterNetEvent("server:destroyNote")
AddEventHandler("server:destroyNote", function(noteID)
  table.remove(savedNotes, noteID)
  TriggerEvent("server:LoadsNote")
end)

