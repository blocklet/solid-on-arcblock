const solid = require('solid-server')

// Startin solid server
const ldp = solid.createServer()
const port = process.env.PORT || process.env.BLOCKLET_PORT || 8000
ldp.listen(port, function () {
  console.log('Starting Blocklet on port ' + port)
  console.log('Solid Server run on /')
})
