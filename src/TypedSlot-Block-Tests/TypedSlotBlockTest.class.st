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
	self shouldnt: [ [ :x | x isInteger ] checkConstraint: 1 ] raise: ConstraintViolation.
	self shouldnt: [ [ :x | x = -1 ] checkConstraint: -1 ] raise: ConstraintViolation.
	self shouldnt: [ [ :x | x > 0 and: [ x < 1 ] ] checkConstraint: 1/2 ] raise: ConstraintViolation.
	
	expectedType := [ :x | x isInteger ].
	self
		should: [ expectedType checkConstraint: 'string' ]
		raise: ConstraintViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: expectedType.
			self assert: typeViolation objectAttemptedToBeWritten equals: 'string' ].
		
	expectedType := [ :x | x base64Decoded first = 0 ].
	self
		should: [ expectedType checkConstraint: -1 ]
		raise: ConstraintViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: expectedType.
			self assert: typeViolation objectAttemptedToBeWritten equals: -1 ]
]

{ #category : #tests }
TypedSlotBlockTest >> testWriteTo [
	| testSlot mockObject |
	testSlot := MockObjectForTypedSlotUsingBlockClosure slotNamed: #testSlot.
	mockObject := MockObjectForTypedSlotUsingBlockClosure new.
	
	self shouldnt: [ testSlot write: 1 to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: 1.
	
	self shouldnt: [ testSlot write: nil to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: nil.
	
	self should: [ testSlot write: -1 to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: nil.
]
