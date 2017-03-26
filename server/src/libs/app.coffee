express = require('express')
path = require('path')
logger = require('morgan')
bodyParser = require('body-parser')
index = require('./../routes/index')
userRouter=require('./../routes/user')
taskRouter=require('./../routes/task')
cors=require('cors')


app = express()

#uncomment after placing your favicon in /public
#app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

#采用restful设计原则
#路径有/api/user

app.use(cors())
app.use('/api', index);
app.use('/api', userRouter);
#/api/task
app.use('/api',taskRouter);

#catch 404 and forward to error handler
app.use((req, res, next) ->
  err = new Error('Not Found')
  err.status = 404
  next(err)
)
app.use((err, req, res, next)->
  res.send(err.status || 500, {
    message:err.message
  })
)

#error handler
###app.use((err, req, res, next) ->
#set locals, only providing error in development
  res.locals.message = err.message;
  if req.app.get('env') is 'development'
    res.locals.error = err
  else
    res.locals.error = {}

#render the error page
  res.status(err.status || 500)
  res.send('error')
)###
module.exports = app
