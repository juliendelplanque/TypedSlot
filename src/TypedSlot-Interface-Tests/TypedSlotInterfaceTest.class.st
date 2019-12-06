Class {
	#name : #TypedSlotInterfaceTest,
	#superclass : #TestCase,
	#category : #'TypedSlot-Interface-Tests'
}

{ #category : #tests }
TypedSlotInterfaceTest >> testCheckObjectType [
	| interface |
	interface := AnonymousInterfaceConstraint selectors: #(#foo).
	self shouldnt: [ interface checkConstraint: FooableObject new ] raise: ConstraintViolation.
	
	self
		should: [ interface checkConstraint: 'string' ]
		raise: ConstraintViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType interface equals: interface interface.
			self assert: typeViolation objectAttemptedToBeWritten equals: 'string' ]
]

{ #category : #tests }
TypedSlotInterfaceTest >> testWriteTo [
	| testSlot mockObject fooableObject |
	testSlot := MockObjectForTypedSlotUsingInterface slotNamed: #anonymousInterfaceSlot.
	mockObject := MockObjectForTypedSlotUsingInterface new.
	
	fooableObject := FooableObject new.
	self shouldnt: [ testSlot write: fooableObject to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: fooableObject.
	
	self shouldnt: [ testSlot write: nil to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: nil.
	
	self should: [ testSlot write: 'string' to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: nil.
]
