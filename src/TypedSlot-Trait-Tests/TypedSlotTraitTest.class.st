"
I provide tests for #checkObjectType: extension method on Trait and I ensure using a Trait as type in a TypedSlot works.
"
Class {
	#name : #TypedSlotTraitTest,
	#superclass : #TestCase,
	#category : #'TypedSlot-Trait-Tests'
}

{ #category : #tests }
TypedSlotTraitTest >> testCheckObjectType [
	self shouldnt: [ MockTraitForTests checkConstraint: MockObjectUsingTrait new ] raise: ConstraintViolation.
	
	self
		should: [ MockTraitForTests checkConstraint: 'string' ]
		raise: ConstraintViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: MockTraitForTests.
			self assert: typeViolation objectAttemptedToBeWritten equals: 'string' ]
]

{ #category : #tests }
TypedSlotTraitTest >> testWriteTo [
	| testSlot mockObject expectedObject |
	testSlot := MockObjectForTypedSlotUsingTrait slotNamed: #testSlot.
	mockObject := MockObjectForTypedSlotUsingTrait new.
	
	expectedObject := MockObjectUsingTrait new.
	self shouldnt: [ testSlot write: expectedObject to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: expectedObject.
	
	self shouldnt: [ testSlot write: nil to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: nil.
	
	self should: [ testSlot write: 'string' to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: nil.
]
