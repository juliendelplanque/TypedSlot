"
I provide tests for #checkObjectType: extension method on ClassDescription.
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
