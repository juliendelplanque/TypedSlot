Class {
	#name : #TypedSlotInterfaceTest,
	#superclass : #TestCase,
	#category : #'TypedSlot-Interface-Tests'
}

{ #category : #tests }
TypedSlotInterfaceTest >> testCheckObjectType [
	| interface |
	interface := AnonymousInterfaceType selectors: #(#foo).
	self shouldnt: [ interface checkObjectType: FooableObject new ] raise: TypeViolation.
	
	self
		should: [ interface checkObjectType: 'string' ]
		raise: TypeViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: interface interface.
			self assert: typeViolation objectAttemptedToBeWritten equals: 'string' ]
]

{ #category : #tests }
TypedSlotInterfaceTest >> testWriteTo [
	| testSlot mockObject fooableObject |
	testSlot := MockObjectForTypedSlotUsingInterface slotNamed: #anonymousInterfaceSlot.
	mockObject := MockObjectForTypedSlotUsingInterface new.
	
	fooableObject := FooableObject new.
	self shouldnt: [ testSlot write: fooableObject to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: fooableObject.
	
	self shouldnt: [ testSlot write: nil to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: nil.
	
	self should: [ testSlot write: 'string' to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: nil.
]
