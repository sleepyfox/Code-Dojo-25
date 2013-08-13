should = require('chai').should()

describe 'Roman numerals', ->    
  it 'should turn I into 1', ->
    roman = -> 1
    roman('I').should.equal 1

  it 'should turn i into 1', -> # should not be case sensitive
    roman = -> 1
    roman('i').should.equal 1
