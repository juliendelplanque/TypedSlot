Class {
	#name : #TypedSlotTest,
	#superclass : #TestCase,
	#instVars : [
		'object'
	],
	#category : #'TypedSlot-Tests'
}

{ #category : #helpers }
TypedSlotTest >> disableTypeCheckingDuring: aBlock [
	| previousState |
	previousState := MockObjectUsingTypedSlots isTypeCheckingEnabled.
	MockObjectUsingTypedSlots isTypeCheckingEnabled: false.
	aBlock ensure: [ MockObjectUsingTypedSlots isTypeCheckingEnabled: previousState ]
]

{ #category : #helpers }
TypedSlotTest >> enableTypeCheckingDuring: aBlock [
	| previousState |
	previousState := MockObjectUsingTypedSlots isTypeCheckingEnabled.
	MockObjectUsingTypedSlots isTypeCheckingEnabled: true.
	aBlock ensure: [ MockObjectUsingTypedSlots isTypeCheckingEnabled: previousState ]
]

{ #category : #running }
TypedSlotTest >> setUp [
	super setUp.
	object := MockObjectUsingTypedSlots new.
]

{ #category : #tests }
TypedSlotTest >> testIntegerSlot [
	self enableTypeCheckingDuring: [
		self assert: object integerSlot equals: nil.
	
		object integerSlot: 1.
		self assert: object integerSlot equals: 1.
	
		self should: [ object integerSlot: 'test' ] raise: TypeViolation.
	
		object integerSlot: nil.
		self assert: object integerSlot equals: nil ]
]

{ #category : #tests }
TypedSlotTest >> testIntegerSlotClassDisabled [
	self disableTypeCheckingDuring: [ 
		self assert: object integerSlot equals: nil.
	
		object integerSlot: 1.
		self assert: object integerSlot equals: 1.
	
		self shouldnt: [ object integerSlot: 'test' ] raise: TypeViolation.
		self assert: object integerSlot equals: 'test'.
	
		object integerSlot: nil.
		self assert: object integerSlot equals: nil ]
]

{ #category : #tests }
TypedSlotTest >> testIntegerSlotInstanceDisabled [
	object isTypeCheckingEnabled: false.
	
	self assert: object integerSlot equals: nil.
	
	object integerSlot: 1.
	self assert: object integerSlot equals: 1.
	
	self shouldnt: [ object integerSlot: 'test' ] raise: TypeViolation.
	self assert: object integerSlot equals: 'test'.
	
	object integerSlot: nil.
	self assert: object integerSlot equals: nil
]

{ #category : #tests }
TypedSlotTest >> testIntegerSlotInstanceEnabled [
	self disableTypeCheckingDuring: [ 
		object isTypeCheckingEnabled: true.
		self assert: object integerSlot equals: nil.
	
		object integerSlot: 1.
		self assert: object integerSlot equals: 1.
	
		self should: [ object integerSlot: 'test' ] raise: TypeViolation.
	
		object integerSlot: nil.
		self assert: object integerSlot equals: nil ]
]
