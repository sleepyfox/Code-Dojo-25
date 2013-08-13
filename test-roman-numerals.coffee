should = require('chai').should()

describe 'Roman numerals', ->    
  it 'should turn I into 1', ->
    roman = -> 1
    roman('I').should.equal 1
