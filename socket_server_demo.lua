local socket = require "socket"

local host = "127.0.0.1"
local port = 3333
local sfd = socket.listen(host, port)
