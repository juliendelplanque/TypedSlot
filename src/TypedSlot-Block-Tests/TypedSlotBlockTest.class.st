"
I provide tests for #checkObjectType: extension method on BlockClosure and I ensure using a BlockClosure as type in a TypedSlot works.
"
Class {
	#name : #TypedSlotBlockTest,
	#superclass : #TestCase,
	#category : #'TypedSlot-Block-Tests'
}

{ #category : #tests }
TypedSlotBlockTest >> testCheckObjectType [
	| expectedType |
	self shouldnt: [ [ :x | x isInteger ] checkObjectType: 1 ] raise: TypeViolation.
	self shouldnt: [ [ :x | x = -1 ] checkObjectType: -1 ] raise: TypeViolation.
	self shouldnt: [ [ :x | x > 0 and: [ x < 1 ] ] checkObjectType: 1/2 ] raise: TypeViolation.
	
	expectedType := [ :x | x isInteger ].
	self
		should: [ expectedType checkObjectType: 'string' ]
		raise: TypeViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: expectedType.
			self assert: typeViolation objectAttemptedToBeWritten equals: 'string' ].
		
	expectedType := [ :x | x base64Decoded first = 0 ].
	self
		should: [ expectedType checkObjectType: -1 ]
		raise: TypeViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: expectedType.
			self assert: typeViolation objectAttemptedToBeWritten equals: -1 ]
]

{ #category : #tests }
TypedSlotBlockTest >> testWriteTo [
	| testSlot mockObject |
	testSlot := MockObjectForTypedSlotUsingBlockClosure slotNamed: #testSlot.
	mockObject := MockObjectForTypedSlotUsingBlockClosure new.
	
	self shouldnt: [ testSlot write: 1 to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: 1.
	
	self shouldnt: [ testSlot write: nil to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: nil.
	
	self should: [ testSlot write: -1 to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: nil.
]
