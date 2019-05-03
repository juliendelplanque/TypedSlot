Class {
	#name : #TypedSlotTest,
	#superclass : #TestCase,
	#instVars : [
		'object'
	],
	#category : #'TypedSlot-Tests'
}

{ #category : #running }
TypedSlotTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	object := TSObjectUsingTypedSlots new.
]

{ #category : #tests }
TypedSlotTest >> testBlockSlot [
	self assert: object usingBlockSlot equals: nil.
	
	object usingBlockSlot: 1.
	self assert: object usingBlockSlot equals: 1.
	
	self should: [ object usingBlockSlot: 'test' ] raise: TypeViolation.
	self should: [ object usingBlockSlot: -1 ] raise: TypeViolation.
	
	object usingBlockSlot: nil.
	self assert: object usingBlockSlot equals: nil.
]

{ #category : #tests }
TypedSlotTest >> testIntegerSlot [
	self assert: object integerSlot equals: nil.
	
	object integerSlot: 1.
	self assert: object integerSlot equals: 1.
	
	self should: [ object integerSlot: 'test' ] raise: TypeViolation.
	
	object integerSlot: nil.
	self assert: object integerSlot equals: nil.
]

{ #category : #tests }
TypedSlotTest >> testStringSlot [
	self assert: object stringSlot equals: nil.
	
	object stringSlot: 'test'.
	self assert: object stringSlot equals: 'test'.
	
	self should: [ object stringSlot: 1 ] raise: TypeViolation.
	
	object stringSlot: nil.
	self assert: object stringSlot equals: nil.
]

{ #category : #tests }
TypedSlotTest >> testUsingInterfaceSlot [
	| expected |
	self assert: object usingInterfaceSlot equals: nil.
	
	expected := FooableObject new.
	object usingInterfaceSlot: expected.
	self assert: object usingInterfaceSlot equals: expected.
	
	self should: [ object usingInterfaceSlot: Object new ] raise: TypeViolation.
	
	object usingInterfaceSlot: nil.
	self assert: object usingInterfaceSlot equals: nil.
]

{ #category : #tests }
TypedSlotTest >> testUsingTraitSlot [
	| expected |
	self assert: object usingTraitSlot equals: nil.
	
	expected := TSObjectForTest new.
	object usingTraitSlot: expected.
	self assert: object usingTraitSlot equals: expected.
	
	self should: [ object usingTraitSlot: Object new ] raise: TypeViolation.
	
	object usingTraitSlot: nil.
	self assert: object usingTraitSlot equals: nil.
]
