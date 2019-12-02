"
I provide tests for #checkObjectType: extension method on ClassDescription and I ensure using a ClassDescription as type in a TypedSlot works.
"
Class {
	#name : #TypedSlotClassDescriptionTest,
	#superclass : #TestCase,
	#category : #'TypedSlot-Class-Tests'
}

{ #category : #tests }
TypedSlotClassDescriptionTest >> testCheckObjectType [
	self shouldnt: [ Integer checkConstraint: 1 ] raise: ConstraintViolation.
	self shouldnt: [ Integer checkConstraint: -1 ] raise: ConstraintViolation.
	self shouldnt: [ Fraction checkConstraint: 1/2 ] raise: ConstraintViolation.
	self shouldnt: [ Fraction checkConstraint: 0.5s02 ] raise: ConstraintViolation.
	
	self
		should: [ Integer checkConstraint: 'string' ]
		raise: ConstraintViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: Integer.
			self assert: typeViolation objectAttemptedToBeWritten equals: 'string' ].
		
	self
		should: [ ScaledDecimal checkConstraint: 1/2 ]
		raise: ConstraintViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: ScaledDecimal.
			self assert: typeViolation objectAttemptedToBeWritten equals: 1/2 ].
]

{ #category : #tests }
TypedSlotClassDescriptionTest >> testWriteTo [
	| testSlot mockObject |
	testSlot := MockObjectForTypedSlotUsingClass slotNamed: #testSlot.
	mockObject := MockObjectForTypedSlotUsingClass new.
	
	self shouldnt: [ testSlot write: 1 to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: 1.
	
	self shouldnt: [ testSlot write: nil to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: nil.
	
	self should: [ testSlot write: 'string' to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: nil.
]
