Class {
	#name : #TypedSlotRemoteInterfaceTest,
	#superclass : #TestCase,
	#category : #'TypedSlot-Interface-Tests'
}

{ #category : #tests }
TypedSlotRemoteInterfaceTest >> testCheckObjectType [
	| interface |
	interface := NamedInterfaceConstraint from: FooableObject.
	self shouldnt: [ interface checkConstraint: FooableObject new ] raise: ConstraintViolation.
	
	self
		should: [ interface checkConstraint: 'string' ]
		raise: ConstraintViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: interface.
			self assert: typeViolation objectAttemptedToBeWritten equals: 'string' ]
]

{ #category : #tests }
TypedSlotRemoteInterfaceTest >> testWriteTo [
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
