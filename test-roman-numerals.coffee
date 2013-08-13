should = require('chai').should()

describe 'Roman numerals', ->    

  roman = (numeral) -> 
    digits = numeral.toUpperCase().split('')
    digits.length
    
  it 'should turn I into 1', ->
    roman('I').should.equal 1

  it 'should turn i into 1', -> # should not be case sensitive
    roman('i').should.equal 1

  it 'should turn II into 2', -> 
    roman('II').should.equal 2

  it 'should turn III into 3', ->
    roman('III').should.equal 3

  it 'should turn IIII into 4', ->
    roman('IIII').should.equal 4

  it 'should turn IIIIIIIIIII into 11', ->
    roman('IIIIIIIIIII').should.equal 11




