gulp=require('gulp')
del=require('del')
fs=require('fs')
uglify=require('gulp-uglify')
minifyCss=require('gulp-minify-css')
concat=require('gulp-concat')
runSequence=require('run-sequence')
browserSync = require('browser-sync')

#读取assets.json文件
assets= JSON.parse(fs.readFileSync("assets.json"))
#新建任务队列
gulp.task('default',(callback)->
  runSequence(['clean'],['build'],['server'],['watch'],callback)
)

#直接删除dist目录，方便重新构建
gulp.task('clean',(callback)->
  del(['./dist'],callback)
)

#创建build的任务链  按顺序执行copy minjs和mincss任务
gulp.task('build',(callback)->
  runSequence(['assetsJs','assetsCss','assetsFont'],['appCss','appJs','copyHtml','copyConfig'],callback)
)

##合并所有的第三方css文件为assets.css文件
gulp.task('assetsJs', ->
  gulp.src(assets.assetsJs)
    .pipe(concat('assets.js', {newLine: ';\n'}))
    .pipe(gulp.dest('./dist/assets/js/'))
)
#合并所有的第三方css文件为assets.css文件
gulp.task('assetsCss', ->
  gulp.src(assets.assetsCss)
    .pipe(concat('assets.css', {newLine: '\n\n'}))
    .pipe(gulp.dest('./dist/assets/css/'))
)
#合并第三方的字体文件
gulp.task('assetsFont', ->
  gulp.src(assets.assetsFont)
    .pipe(gulp.dest('./dist/assets/fonts/'))
)
#合并我们所有自己写的css文件为app.css
gulp.task('appCss', ->
  gulp.src(assets.appCss)
    .pipe(concat('app.css', {newLine: '\n\n'}))
    .pipe(gulp.dest('./dist/assets/css/'))
)
#合并我们所有自己写的js为app.js
gulp.task('appJs', ->
  gulp.src(assets.appJs)
    .pipe(concat('app.js', {newLine: ';\n'}))
    .pipe(gulp.dest('./dist/assets/js/'))
)
# 拷贝所有的html目录到dist目录下
gulp.task('copyHtml', ->
  gulp.src(['./src/**/*.html'])
    .pipe(gulp.dest('./dist/'))
)
#复制config
gulp.task('copyConfig', ->
  gulp.src(['./src/config/**/*.js'])
    .pipe(gulp.dest('./dist/config/'))
)

#新建创建服务器，来让浏览器运行我们的前段页面
gulp.task('server', ->
  browserSync.init({
    server:{
      baseDir:'./dist/'
    }
    port:7411
  })
)
#监视文件是否改变
gulp.task('watch',->
  gulp.watch('./src/**/*.*',['reload'])
)
#把上面的任务再做一次，刷新
gulp.task('reload',(callback)->
  runSequence(['copy'],['minijs'],['minicss'],['reload-browser'],callback)
)

#定义文件修改后要自动执行的任务
gulp.task('reload-browser',->
  browserSync.reload()
)