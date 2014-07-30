"use strict"

module.exports = (grunt) ->
  DEFAULT_BANNER = '/*! <%= pkg.name %>: v<%= pkg.version %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
  grunt.initConfig {
    pkg      : grunt.file.readJSON 'package.json'
    source   : 'src'
    target   : 'dist'
    build    : 'dist/.__build'
    web      :
      root: 'public'
      apps: '<%= client.root %>/apps'
    webSource:
      root: '<%= source %>/<%= web.root %>'
      apps: '<%= source %>/<%= web.apps %>'
    webTarget:
      root: '<%= target %>/<%= web.root %>'
      apps: '<%= target %>/<%= web.apps %>'
    webBuild :
      root: '<%= build %>/<%= web.root %>'
      apps: '<%= build %>/<%= web.apps %>'

    clean:
      all       : [ 'dist/**' ]
      webScripts: [
        '<%= webTarget.root %>/**/*.js'
        '!<%= webTarget.root %>/**/*.min.js'
      ]
      webStyles : [
        '<%= webTarget.root %>/**/*.css'
        '!<%= webTarget.root %>/**/*.min.css'
      ]

    less:
      all:
        expand: true
        cwd   : '<%= webSource.root %>'
        src   : [ '**/*.less' ]
        dest  : '<%= webBuild.root %>'
        ext   : '.css'
        extDot: 'last'

    coffee:
      options:
        sourceMap: true
      all    :
        expand: true
        cwd   : '<%= source %>'
        src   : [ '**/*.coffee' ]
        dest  : '<%= build %>'
        ext   : '.js'
        extDot: 'last'

    copy:
      webStaticsToTarget:
        expand: true
        cwd   : '<%= webSource.root %>'
        src   : [
          '**'
          '!**/*.js'
          '!**/*.coffee'
          '!**/*.css'
          '!**/*.less'
        ]
        dest  : '<%= webTarget.root %>'
      svcToTarget       :
        files: [
          {
            expand: true
            cwd   : '<%= source %>'
            src   : [
              '**'
              '!**/*.coffee'
              '!**/*.less'
              '!public/**'
            ]
            dest  : '<%= target %>'
          }
          {
            expand: true
            cwd   : '<%= build %>'
            src   : [
              '**/*.js'
              '!**/*.map'
              '!public/**'
            ]
            dest  : '<%= target %>'
          }
        ]
      deployOutput      :
        cwd : '.'
        src : [
          'package.json'
          'bin/**'
          'conf/**'
          '<%= target %>/**'
          '!<%= build %>/**'
        ]
        dest: '<%= grunt.option("out") || "./deployed" %>/'

    concat:
      options:
        seperator: '\n'
      home   :
        files: [
          {
            dest  : '<%= webTarget.root %>/apps/home/styles/home.css'
            src   : [
              '<%= webBuild.root %>/apps/home/styles/home.css'
            ]
            nonull: true
          }
          {
            dest  : '<%= webTarget.root %>/apps/home/scripts/app.js'
            src   : [
              '<%= webBuild.root %>/apps/home/scripts/app.js'
              '<%= webBuild.root %>/scripts/agLauncher.js'
            ]
            nonull: true
          }
        ]

    cssmin:
      options  :
        banner: DEFAULT_BANNER
      webStyles:
        expand: true
        cwd   : '<%= webTarget.root %>'
        src   : [
          '**/*.css'
          '!**/*.min.css'
        ]
        dest  : '<%= webTarget.root %>'
        ext   : '.min.css'
        extDot: 'last'

    uglify:
      options   :
        banner: DEFAULT_BANNER
      webScripts:
        expand: true
        cwd   : '<%= webTarget.root %>'
        src   : [
          '**/*.js'
          '!**/*.min.js'
        ]
        dest  : '<%= webTarget.root %>'
        ext   : '.min.js'
        extDot: 'last'

    useminPrepare:
      html   : [ '<%= source %>/views/**/*.ejs' ]
      options:
        dest: '<%= target %>/views'

    usemin:
      html: [ '<%= target %>/views/**/*.ejs', '<%= target %>/public/**/*.html' ]
  }

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-usemin'

  grunt.registerTask 'default', [
#    'useminPrepare'
    'clean:all'
    'coffee'
    'less'
    'copy:svcToTarget'
    'copy:webStaticsToTarget'
    'concat'
    'cssmin'
    'uglify'
    'clean:webStyles'
    'clean:webScripts'
    'usemin'
  ]

  grunt.registerTask 'deploy', [
    'copy:deployOutput'
  ]
