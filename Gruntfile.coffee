"use strict"

module.exports = (grunt) ->
  DEFAULT_BANNER = '/*! <%= pkg.name %>: v<%= pkg.version %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
  grunt.initConfig {

  }

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-usemin'

  grunt.registerTask 'build', [
  ]

  grunt.registerTask 'deploy', [
  ]
