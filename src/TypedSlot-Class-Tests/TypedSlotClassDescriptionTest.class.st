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
	self shouldnt: [ Integer checkObjectType: 1 ] raise: TypeViolation.
	self shouldnt: [ Integer checkObjectType: -1 ] raise: TypeViolation.
	self shouldnt: [ Fraction checkObjectType: 1/2 ] raise: TypeViolation.
	self shouldnt: [ Fraction checkObjectType: 0.5s02 ] raise: TypeViolation.
	
	self
		should: [ Integer checkObjectType: 'string' ]
		raise: TypeViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: Integer.
			self assert: typeViolation objectAttemptedToBeWritten equals: 'string' ].
		
	self
		should: [ ScaledDecimal checkObjectType: 1/2 ]
		raise: TypeViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: ScaledDecimal.
			self assert: typeViolation objectAttemptedToBeWritten equals: 1/2 ].
]

{ #category : #tests }
TypedSlotClassDescriptionTest >> testWriteTo [
	| testSlot mockObject |
	testSlot := MockObjectForTypedSlotUsingClass slotNamed: #testSlot.
	mockObject := MockObjectForTypedSlotUsingClass new.
	
	self shouldnt: [ testSlot write: 1 to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: 1.
	
	self shouldnt: [ testSlot write: nil to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: nil.
	
	self should: [ testSlot write: 'string' to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: nil.
]
