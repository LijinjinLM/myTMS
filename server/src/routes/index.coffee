express = require('express');
router = express.Router();
db=require('./../libs/db');

# GET home page.
router.get('/', (req, res, next) ->
  ###res.send('服务器重启2');###
  db.users.insert({username:'tom'},(err,user)->
    return next(err) if err
    console.log(user)
    res.json(user)
    return
  )
)
module.exports = router;